/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Creature.h"
#include "MapManager.h"
#include "RandomMovementGenerator.h"
#include "Map.h"
#include "Util.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"

void RandomMovementGenerator::_setRandomLocation(Creature &creature)
{
    if (creature.CanFly())
    {
        //typedef std::vector<Vector3> PointsArray;
        Movement::PointsArray path;
        uint32 ptsPerCycle = ceil(i_wanderDistance * 2);
        static const uint32 nbCyclesPerPacket = 1;
        for (uint32 i = 0; i <= nbCyclesPerPacket * ptsPerCycle; ++i)
            path.push_back(Vector3(i_positionX + i_wanderDistance * cos(i * 2 * M_PI / ptsPerCycle), i_positionY + i_wanderDistance * sin(i * 2 * M_PI / ptsPerCycle), i_positionZ));
        Movement::MoveSplineInit init(creature, "RandomMovementGenerator (CanFly)");
        init.SetFly();
        init.SetWalk(false);
        init.MovebyPath(path);
        init.SetFirstPointId(1);
        init.Launch();
        i_nextMoveTime.Reset(0);
        return;
    }

    float destX, destY, destZ;
    if (!creature.GetRandomPoint(i_positionX, i_positionY, i_positionZ, i_wanderDistance, destX, destY, destZ))
        return;

    creature.addUnitState(UNIT_STAT_ROAMING_MOVE);
    Movement::MoveSplineInit init(creature, "RandomMovementGenerator");
    init.MoveTo(destX, destY, destZ, MOVE_PATHFINDING | MOVE_EXCLUDE_STEEP_SLOPES);
    init.SetWalk(true);
    init.Launch();

    if (roll_chance_i(40))
        i_nextMoveTime.Reset(50);
    else
        i_nextMoveTime.Reset(urand(3000, 10000));
}

void RandomMovementGenerator::Initialize(Creature &creature)
{
    if (!creature.isAlive())
        return;

    creature.addUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    i_nextMoveTime.Reset(50);
}

void RandomMovementGenerator::Reset(Creature &creature)
{
    Initialize(creature);
}

void RandomMovementGenerator::Interrupt(Creature &creature)
{
    creature.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.hasUnitState(UNIT_STAT_RUNNING), false);
}

void RandomMovementGenerator::Finalize(Creature &creature)
{
    creature.clearUnitState(UNIT_STAT_ROAMING | UNIT_STAT_ROAMING_MOVE);
    creature.SetWalk(!creature.hasUnitState(UNIT_STAT_RUNNING), false);
}

bool RandomMovementGenerator::Update(Creature &creature, const uint32 &diff)
{
    creature.GetMotionMaster()->SetNeedAsyncUpdate();
    return true;
}

void RandomMovementGenerator::UpdateAsync(Creature &creature, uint32 diff)
{
    // Lock async updates for safety, see Unit::asyncMovesplineLock doc
    ACE_Guard<ACE_Thread_Mutex> guard(creature.asyncMovesplineLock);
    if (creature.hasUnitState(UNIT_STAT_CAN_NOT_MOVE | UNIT_STAT_DISTRACTED))
    {
        i_nextMoveTime.Reset(0);  // Expire the timer
        creature.clearUnitState(UNIT_STAT_ROAMING_MOVE);
    }
    else if (creature.IsNoMovementSpellCasted())
    {
        if (!creature.IsStopped())
            creature.StopMoving();
    }
    else if (creature.movespline->Finalized())
    {
        i_nextMoveTime.Update(diff);
        if (i_nextMoveTime.Passed())
            _setRandomLocation(creature);
    }
}

bool RandomMovementGenerator::GetResetPosition(Creature& c, float& x, float& y, float& z)
{
    // use current if in range
    if (c.IsWithinDist2d(i_positionX, i_positionY, i_wanderDistance))
        c.GetPosition(x, y, z);
    else
    {
        x = i_positionX;
        y = i_positionY;
        z = i_positionZ;
    }

    return true;
}

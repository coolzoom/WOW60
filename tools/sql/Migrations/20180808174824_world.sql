DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180808174824');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180808174824');
-- Add your query below.


DELETE FROM `quest_start_scripts` WHERE `id`=3382;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Crew Under Fire - Remove Npc Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 5, 10, 12204, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 10, 2375.868, -5947.179, 9.544, 4.565, 0, 'A Crew Under Fire - Spawn Spitelash Raider 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 5, 10, 12204, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 10, 2375.868, -5947.179, 9.544, 4.565, 0, 'A Crew Under Fire - Spawn Spitelash Raider 2');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 5, 10, 12204, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 10, 2375.868, -5947.179, 9.544, 4.565, 0, 'A Crew Under Fire - Spawn Spitelash Raider 3');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 10, 10, 12204, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 10, 2375.868, -5947.179, 9.544, 4.565, 0, 'A Crew Under Fire - Spawn Spitelash Raider 4');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 10, 10, 12204, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 10, 2375.868, -5947.179, 9.544, 4.565, 0, 'A Crew Under Fire - Spawn Spitelash Raider 5');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 30, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Crew Under Fire - Add Npc Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3382, 30, 7, 3382, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 'A Crew Under Fire - Complete Quest');
UPDATE `quest_template` SET `StartScript`=3382 WHERE `entry`=3382;

UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=15341;

UPDATE `game_event` SET `start_time`='2015-03-30 04:00:00', `disabled`=0, `patch_max`=1 WHERE `entry`=157;

-- Seeker Thompson
DELETE FROM `creature_ai_events` WHERE `creature_id`=14404;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440401, 14404, 0, 4, 2, 100, 0, 0, 0, 0, 0, 1440401, 0, 0, 'Seeker Thompson - Summon Deathguard Elite on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440402, 14404, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1440402, 0, 0, 'Seeker Thompson - Set Phase to 0 on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1440401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440401, 0, 10, 7980, 30000, 3, 30, 0, 0, 0, 0, 8, 0, 1, 1, 0, 0, 0, 0, 0, 'Seeker Thompson - Summon Creature Deathguard Elite');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440401, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Set Phase to 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=1440402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440402, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Thompson - Set Phase to 0');

-- Seeker Nahr
DELETE FROM `creature_ai_events` WHERE `creature_id`=14403;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440301, 14403, 0, 4, 2, 100, 0, 0, 0, 0, 0, 1440301, 0, 0, 'Seeker Nahr - Summon Deathguard Elite on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1440302, 14403, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1440302, 0, 0, 'Seeker Nahr - Set Phase to 0 on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1440301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440301, 0, 10, 7980, 30000, 3, 30, 0, 0, 0, 0, 8, 0, 1, 1, 0, 0, 0, 0, 0, 'Seeker Nahr - Summon Creature Deathguard Elite');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440301, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Set Phase to 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=1440302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1440302, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeker Nahr - Set Phase to 0');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

/*
恢复NAXX帕奇维克AI
修复仇恨打击
原始值是220099修正为1000其实一般高于1000因为有加成
*/
UPDATE `creature_template` SET `ScriptName`='boss_patchwerk'  WHERE `entry`=16028;
UPDATE `spell_template` SET `effectBasePoints1`='1000' WHERE (`ID`='28308');


/*
恢复BWL费尔默AI
*/
UPDATE `creature_template` SET `ScriptName`='boss_firemaw'  WHERE `entry`=11983;


/*
恢复BWL艾博诺克AI
*/
UPDATE `creature_template` SET `ScriptName`='boss_ebonroc'  WHERE `entry`=14601;

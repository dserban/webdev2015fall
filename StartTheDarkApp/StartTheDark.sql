CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  chosen_activity_id INTEGER NOT NULL,
  user_name TEXT
);
CREATE INDEX index_on_chosen_activity_id ON users (chosen_activity_id);

CREATE TABLE chosen_activities (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  activity_author_id INTEGER NOT NULL,
  activity_description TEXT
);
CREATE INDEX index_on_activity_author_id ON chosen_activities (activity_author_id);

INSERT INTO users VALUES( 1,  1, 'DummyUser');
INSERT INTO users VALUES( 2, 13, 'AccidentallyAwesome');
INSERT INTO users VALUES( 3,  1, 'AgentSmith');
INSERT INTO users VALUES( 4,  1, 'AndriiPopa');
INSERT INTO users VALUES( 5,  8, 'AquaShark');
INSERT INTO users VALUES( 6,  2, 'AstroDust');
INSERT INTO users VALUES( 7,  8, 'Atacant');
INSERT INTO users VALUES( 8,  5, 'BambiTheBaby');
INSERT INTO users VALUES( 9,  8, 'Bastard.Robot.From.Hell');
INSERT INTO users VALUES(10,  5, 'Black.Magnolia');
INSERT INTO users VALUES(11, 13, 'ButtersFromSouthPark');
INSERT INTO users VALUES(12, 13, 'CarbonFire');
INSERT INTO users VALUES(13,  5, 'Cleopatra.In.Hyperspace');
INSERT INTO users VALUES(14, 13, 'DarkAngel');
INSERT INTO users VALUES(15,  8, 'DarthCoder');
INSERT INTO users VALUES(16, 13, 'DragonQuest');
INSERT INTO users VALUES(17,  5, 'DreamCatcher');
INSERT INTO users VALUES(18,  2, 'DuduBobo');
INSERT INTO users VALUES(19,  8, 'EtherealCereal');
INSERT INTO users VALUES(20,  1, 'FrakkingToaster');
INSERT INTO users VALUES(21, 10, 'FreeStyler');
INSERT INTO users VALUES(22,  8, 'Frodo');
INSERT INTO users VALUES(23,  5, 'GlamourBlue');
INSERT INTO users VALUES(24,  1, 'GossipGRRRL');
INSERT INTO users VALUES(25,  5, 'GuessWho');
INSERT INTO users VALUES(26,  8, 'Haiducul');
INSERT INTO users VALUES(27,  5, 'HappyAngelOfSnow');
INSERT INTO users VALUES(28,  5, 'Have.We.Met.Before');
INSERT INTO users VALUES(29,  5, 'JennyTheCat');
INSERT INTO users VALUES(30,  8, 'JohnnyDaKid');
INSERT INTO users VALUES(31,  8, 'Juventus');
INSERT INTO users VALUES(32,  5, 'KellyPenguinGRRRL');
INSERT INTO users VALUES(33, 10, 'Kernel.Panic');
INSERT INTO users VALUES(34,  8, 'Klingon');
INSERT INTO users VALUES(35, 10, 'Konstruktor');
INSERT INTO users VALUES(36,  5, 'LifeEnigma');
INSERT INTO users VALUES(37,  8, 'Lionel.Messi');
INSERT INTO users VALUES(38,  5, 'Light.On.The.Sky');
INSERT INTO users VALUES(39,  8, 'ManOnTheRun');
INSERT INTO users VALUES(40,  5, 'Muzette');
INSERT INTO users VALUES(41,  9, 'MythBuster');
INSERT INTO users VALUES(42,  1, 'NapoleonPhoneApart');
INSERT INTO users VALUES(43,  5, 'OchiiDinVis');
INSERT INTO users VALUES(44,  1, 'Outlaw');
INSERT INTO users VALUES(45,  5, 'PrincessLeia');
INSERT INTO users VALUES(46,  1, 'Principessa');
INSERT INTO users VALUES(47,  8, 'Raider');
INSERT INTO users VALUES(48,  1, 'RipTheJacker');
INSERT INTO users VALUES(49,  1, 'Ronaldinho');
INSERT INTO users VALUES(50,  8, 'Scorpion');
INSERT INTO users VALUES(51,  5, 'Serendipity');
INSERT INTO users VALUES(52,  1, 'Sheriff');
INSERT INTO users VALUES(53,  5, 'ShinyPearl');
INSERT INTO users VALUES(54,  1, 'Sk8erboy');
INSERT INTO users VALUES(55,  2, 'Smarticus');
INSERT INTO users VALUES(56,  1, 'StoneColdSteve');
INSERT INTO users VALUES(57,  5, 'SugarCoated');
INSERT INTO users VALUES(58,  5, 'TaylorSwift');
INSERT INTO users VALUES(59,  8, 'The.Guy.Who.Said.Meh');
INSERT INTO users VALUES(60,  8, 'ThisIsSpartaaa');
INSERT INTO users VALUES(61, 10, 'Warrior');
INSERT INTO users VALUES(62,  1, 'WeaponX');
INSERT INTO users VALUES(63,  5, 'WonderWoman');
INSERT INTO users VALUES(64,  5, 'Zana.Cea.Buna');
INSERT INTO users VALUES(65,  5, 'ZborDeFluturi');

INSERT INTO chosen_activities VALUES( 1,  1, 'DummyActivity');
INSERT INTO chosen_activities VALUES( 2, 55, 'Mergem în club');
INSERT INTO chosen_activities VALUES( 3, 63, 'Mergem la o cafenea jazzy');
INSERT INTO chosen_activities VALUES( 4, 38, 'Movie night');
INSERT INTO chosen_activities VALUES( 5, 15, 'Mergem la concert');
INSERT INTO chosen_activities VALUES( 6, 39, 'Board games');
INSERT INTO chosen_activities VALUES( 7, 11, 'Noaptea devoratorilor de whatever');
INSERT INTO chosen_activities VALUES( 8, 31, 'Fotbal nocturn');
INSERT INTO chosen_activities VALUES( 9, 49, 'Ieșim la o bere în centrul vechi');
INSERT INTO chosen_activities VALUES(10, 61, 'Mergem la lasertag');
INSERT INTO chosen_activities VALUES(11, 65, 'Mergem la muzeu');
INSERT INTO chosen_activities VALUES(12, 27, 'Mergem la o pizzerie');
INSERT INTO chosen_activities VALUES(13, 25, 'Mergem la mall');
INSERT INTO chosen_activities VALUES(14, 40, 'Mergem în parc');


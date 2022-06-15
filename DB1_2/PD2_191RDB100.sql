/******************************************************************************************************************************
heap-type tables
******************************************************************************************************************************/
CREATE TABLE Teams(
    team_id         number          NOT NULL,
    team_name       varchar2(35)    NOT NULL    UNIQUE,
    hometown        varchar2(30),
    stadium         varchar2(40)    NOT NULL,
    capacity        number(6),
    foundation_year number(4) CHECK (foundation_year > 0 and foundation_year <= 2021),
    CONSTRAINT teams_pk PRIMARY KEY(team_id)
);

CREATE TABLE Players(
    player_id       number          NOT NULL,
    player_name     varchar2(25)    NOT NULL,
    surname         varchar2(35)    NOT NULL,
    birthdate       date            NOT NULL,
    position        varchar2(30),
    nationality     varchar2(25),
    id_team         number    NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY(player_id),
    CONSTRAINT players_teams_fk FOREIGN KEY (id_team) REFERENCES Teams (team_id)
);
   
INSERT INTO Teams VALUES('1', 'Manchester United', 'Manchester', 'Old Trafford', '76000', '1878');
INSERT INTO Teams VALUES('2', 'Borussia Dortmund', 'Dortmund', 'Signal Iduna Park', '81365', '1909');
INSERT INTO Teams VALUES('3', 'FC Barcelona', 'Barcelona', 'Camp Nou', '99354', '1899');
INSERT INTO Teams VALUES('4', 'Tottenham Hotspur', 'London', 'New White Hart Lane', '62303', '1882');
INSERT INTO Teams VALUES('5', 'Manchester City', 'Manchester', 'Etihad Stadium', '55097', '1880');
INSERT INTO Teams VALUES('6', 'AC Milan', 'Milano', 'San Siro', '80018', '1899');
INSERT INTO Teams VALUES('7', 'Juventus', 'Turin', 'Allianz Stadium', '41507', '1897');
INSERT INTO Teams VALUES('8', 'Aston Villa', 'Birmingham', 'Villa Park', '42785', '1874');
INSERT INTO Teams VALUES('9', 'Real Madrid', 'Madrid', 'Estadio Santiago Bernabeu', '81044', '1902');
INSERT INTO Teams VALUES('10', 'Atletico de Madrid', 'Madrid', 'Wanda Metropolitano', '68456', '1903');
     
INSERT INTO Players VALUES('1', 'Cristiano', 'Ronaldo', TO_DATE('05-02-1985', 'DD-MM-YYYY'), 'Forward', 'Portugese', '7');
INSERT INTO Players VALUES('2', 'Paul', 'Pogba', TO_DATE('15-03-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'French', '1');
INSERT INTO Players VALUES('3', 'Jack', 'Grealish', TO_DATE('10-09-1995', 'DD-MM-YYYY'), 'Attacking Midfielder', 'English', '8');
INSERT INTO Players VALUES('4', 'Zlatan', 'Ibrahimovic', TO_DATE('03-10-1981', 'DD-MM-YYYY'), 'Striker', 'Swedish', '6');
INSERT INTO Players VALUES('5', 'Sergio', 'Ramos', TO_DATE('30-03-1986', 'DD-MM-YYYY'), 'Center Back', 'Spanish', '9');
INSERT INTO Players VALUES('6', 'Harry', 'Kane', TO_DATE('28-07-1993', 'DD-MM-YYYY'), 'Striker', 'English', '4');
INSERT INTO Players VALUES('7', 'Jordi', 'Alba', TO_DATE('21-03-1989', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '3');
INSERT INTO Players VALUES('8', 'Bruno', 'Fernandes', TO_DATE('08-09-1994', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '1');
INSERT INTO Players VALUES('9', 'Jan', 'Oblak', TO_DATE('07-01-1993', 'DD-MM-YYYY'), 'Goalkeeper', 'Slovenian', '10');
INSERT INTO Players VALUES('10', 'Jadon', 'Sancho', TO_DATE('25-03-2000', 'DD-MM-YYYY'), 'Right Winger', 'English', '2');

    SELECT * FROM Teams, Players WHERE team_id=id_team;
    SELECT COUNT (*) FROM Teams, Players WHERE team_id=id_team;
    SELECT * FROM Teams, Players WHERE team_id=id_team AND player_id = 2;
    
/******************************************************************************************************************************
index-organized tables
******************************************************************************************************************************/
DROP TABLE Players;
DROP TABLE Teams;

CREATE TABLE Teams(
    team_id         number          NOT NULL,
    team_name       varchar2(35)    NOT NULL    UNIQUE,
    hometown        varchar2(30),
    stadium         varchar2(40)    NOT NULL,
    capacity        number(6),
    foundation_year number(4) CHECK (foundation_year > 0 and foundation_year <= 2021),
    CONSTRAINT teams_pk PRIMARY KEY(team_id)
)
    ORGANIZATION INDEX;

CREATE TABLE Players(
    player_id       number          NOT NULL,
    player_name     varchar2(25)    NOT NULL,
    surname         varchar2(35)    NOT NULL,
    birthdate       date            NOT NULL,
    position        varchar2(30),
    nationality     varchar2(25),
    id_team         number    NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY(player_id),
    CONSTRAINT players_teams_fk FOREIGN KEY (id_team) REFERENCES Teams (team_id)
)
    ORGANIZATION INDEX;
    
INSERT INTO Teams VALUES('1', 'Manchester United', 'Manchester', 'Old Trafford', '76000', '1878');
INSERT INTO Teams VALUES('2', 'Borussia Dortmund', 'Dortmund', 'Signal Iduna Park', '81365', '1909');
INSERT INTO Teams VALUES('3', 'FC Barcelona', 'Barcelona', 'Camp Nou', '99354', '1899');
INSERT INTO Teams VALUES('4', 'Tottenham Hotspur', 'London', 'New White Hart Lane', '62303', '1882');
INSERT INTO Teams VALUES('5', 'Manchester City', 'Manchester', 'Etihad Stadium', '55097', '1880');
INSERT INTO Teams VALUES('6', 'AC Milan', 'Milano', 'San Siro', '80018', '1899');
INSERT INTO Teams VALUES('7', 'Juventus', 'Turin', 'Allianz Stadium', '41507', '1897');
INSERT INTO Teams VALUES('8', 'Aston Villa', 'Birmingham', 'Villa Park', '42785', '1874');
INSERT INTO Teams VALUES('9', 'Real Madrid', 'Madrid', 'Estadio Santiago Bernabeu', '81044', '1902');
INSERT INTO Teams VALUES('10', 'Atletico de Madrid', 'Madrid', 'Wanda Metropolitano', '68456', '1903');
     
INSERT INTO Players VALUES('1', 'Cristiano', 'Ronaldo', TO_DATE('05-02-1985', 'DD-MM-YYYY'), 'Forward', 'Portugese', '7');
INSERT INTO Players VALUES('2', 'Paul', 'Pogba', TO_DATE('15-03-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'French', '1');
INSERT INTO Players VALUES('3', 'Jack', 'Grealish', TO_DATE('10-09-1995', 'DD-MM-YYYY'), 'Attacking Midfielder', 'English', '8');
INSERT INTO Players VALUES('4', 'Zlatan', 'Ibrahimovic', TO_DATE('03-10-1981', 'DD-MM-YYYY'), 'Striker', 'Swedish', '6');
INSERT INTO Players VALUES('5', 'Sergio', 'Ramos', TO_DATE('30-03-1986', 'DD-MM-YYYY'), 'Center Back', 'Spanish', '9');
INSERT INTO Players VALUES('6', 'Harry', 'Kane', TO_DATE('28-07-1993', 'DD-MM-YYYY'), 'Striker', 'English', '4');
INSERT INTO Players VALUES('7', 'Jordi', 'Alba', TO_DATE('21-03-1989', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '3');
INSERT INTO Players VALUES('8', 'Bruno', 'Fernandes', TO_DATE('08-09-1994', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '1');
INSERT INTO Players VALUES('9', 'Jan', 'Oblak', TO_DATE('07-01-1993', 'DD-MM-YYYY'), 'Goalkeeper', 'Slovenian', '10');
INSERT INTO Players VALUES('10', 'Jadon', 'Sancho', TO_DATE('25-03-2000', 'DD-MM-YYYY'), 'Right Winger', 'English', '2');

    SELECT * FROM Teams, Players WHERE team_id=id_team;
    SELECT COUNT (*) FROM Teams, Players WHERE team_id=id_team;
    SELECT * FROM Teams, Players WHERE team_id=id_team AND player_id = 2;

/******************************************************************************************************************************
indexed-cluster
******************************************************************************************************************************/
DROP TABLE Players;
DROP TABLE Teams;

CREATE CLUSTER i_cluster(team_id number)
size 100;

CREATE TABLE Teams(
    team_id         number          NOT NULL,
    team_name       varchar2(35)    NOT NULL    UNIQUE,
    hometown        varchar2(30),
    stadium         varchar2(40)    NOT NULL,
    capacity        number(6),
    foundation_year number(4) CHECK (foundation_year > 0 and foundation_year <= 2021),
    CONSTRAINT teams_pk PRIMARY KEY(team_id)
)
    CLUSTER i_cluster(team_id);

CREATE TABLE Players(
    player_id       number          NOT NULL,
    player_name     varchar2(25)    NOT NULL,
    surname         varchar2(35)    NOT NULL,
    birthdate       date            NOT NULL,
    position        varchar2(30),
    nationality     varchar2(25),
    id_team         number    NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY(player_id),
    CONSTRAINT players_teams_fk FOREIGN KEY (id_team) REFERENCES Teams (team_id)
)
    CLUSTER i_cluster(id_team);
    
    CREATE INDEX i_cluster_index ON CLUSTER i_cluster;
    
INSERT INTO Teams VALUES('1', 'Manchester United', 'Manchester', 'Old Trafford', '76000', '1878');
INSERT INTO Teams VALUES('2', 'Borussia Dortmund', 'Dortmund', 'Signal Iduna Park', '81365', '1909');
INSERT INTO Teams VALUES('3', 'FC Barcelona', 'Barcelona', 'Camp Nou', '99354', '1899');
INSERT INTO Teams VALUES('4', 'Tottenham Hotspur', 'London', 'New White Hart Lane', '62303', '1882');
INSERT INTO Teams VALUES('5', 'Manchester City', 'Manchester', 'Etihad Stadium', '55097', '1880');
INSERT INTO Teams VALUES('6', 'AC Milan', 'Milano', 'San Siro', '80018', '1899');
INSERT INTO Teams VALUES('7', 'Juventus', 'Turin', 'Allianz Stadium', '41507', '1897');
INSERT INTO Teams VALUES('8', 'Aston Villa', 'Birmingham', 'Villa Park', '42785', '1874');
INSERT INTO Teams VALUES('9', 'Real Madrid', 'Madrid', 'Estadio Santiago Bernabeu', '81044', '1902');
INSERT INTO Teams VALUES('10', 'Atletico de Madrid', 'Madrid', 'Wanda Metropolitano', '68456', '1903');
     
INSERT INTO Players VALUES('1', 'Cristiano', 'Ronaldo', TO_DATE('05-02-1985', 'DD-MM-YYYY'), 'Forward', 'Portugese', '7');
INSERT INTO Players VALUES('2', 'Paul', 'Pogba', TO_DATE('15-03-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'French', '1');
INSERT INTO Players VALUES('3', 'Jack', 'Grealish', TO_DATE('10-09-1995', 'DD-MM-YYYY'), 'Attacking Midfielder', 'English', '8');
INSERT INTO Players VALUES('4', 'Zlatan', 'Ibrahimovic', TO_DATE('03-10-1981', 'DD-MM-YYYY'), 'Striker', 'Swedish', '6');
INSERT INTO Players VALUES('5', 'Sergio', 'Ramos', TO_DATE('30-03-1986', 'DD-MM-YYYY'), 'Center Back', 'Spanish', '9');
INSERT INTO Players VALUES('6', 'Harry', 'Kane', TO_DATE('28-07-1993', 'DD-MM-YYYY'), 'Striker', 'English', '4');
INSERT INTO Players VALUES('7', 'Jordi', 'Alba', TO_DATE('21-03-1989', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '3');
INSERT INTO Players VALUES('8', 'Bruno', 'Fernandes', TO_DATE('08-09-1994', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '1');
INSERT INTO Players VALUES('9', 'Jan', 'Oblak', TO_DATE('07-01-1993', 'DD-MM-YYYY'), 'Goalkeeper', 'Slovenian', '10');
INSERT INTO Players VALUES('10', 'Jadon', 'Sancho', TO_DATE('25-03-2000', 'DD-MM-YYYY'), 'Right Winger', 'English', '2');

    SELECT * FROM Teams, Players WHERE team_id=id_team;
    SELECT COUNT (*) FROM Teams, Players WHERE team_id=id_team;
    SELECT * FROM Teams, Players WHERE team_id=id_team AND player_id = 2;

/******************************************************************************************************************************
hash-cluster
******************************************************************************************************************************/
DROP TABLE Players;
DROP TABLE Teams;
DROP CLUSTER i_cluster;

CREATE CLUSTER h_cluster(team_id number)
size 512 HASHKEYS 150;

CREATE TABLE Teams(
    team_id         number          NOT NULL,
    team_name       varchar2(35)    NOT NULL    UNIQUE,
    hometown        varchar2(30),
    stadium         varchar2(40)    NOT NULL,
    capacity        number(6),
    foundation_year number(4) CHECK (foundation_year > 0 and foundation_year <= 2021),
    CONSTRAINT teams_pk PRIMARY KEY(team_id)
    )
    CLUSTER h_cluster(team_id);

CREATE TABLE Players(
    player_id       number          NOT NULL,
    player_name     varchar2(25)    NOT NULL,
    surname         varchar2(35)    NOT NULL,
    birthdate       date            NOT NULL,
    position        varchar2(30),
    nationality     varchar2(25),
    id_team         number    NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY(player_id),
    CONSTRAINT players_teams_fk FOREIGN KEY (id_team) REFERENCES Teams (team_id)
    )
    CLUSTER h_cluster(id_team);
    
INSERT INTO Teams VALUES('1', 'Manchester United', 'Manchester', 'Old Trafford', '76000', '1878');
INSERT INTO Teams VALUES('2', 'Borussia Dortmund', 'Dortmund', 'Signal Iduna Park', '81365', '1909');
INSERT INTO Teams VALUES('3', 'FC Barcelona', 'Barcelona', 'Camp Nou', '99354', '1899');
INSERT INTO Teams VALUES('4', 'Tottenham Hotspur', 'London', 'New White Hart Lane', '62303', '1882');
INSERT INTO Teams VALUES('5', 'Manchester City', 'Manchester', 'Etihad Stadium', '55097', '1880');
INSERT INTO Teams VALUES('6', 'AC Milan', 'Milano', 'San Siro', '80018', '1899');
INSERT INTO Teams VALUES('7', 'Juventus', 'Turin', 'Allianz Stadium', '41507', '1897');
INSERT INTO Teams VALUES('8', 'Aston Villa', 'Birmingham', 'Villa Park', '42785', '1874');
INSERT INTO Teams VALUES('9', 'Real Madrid', 'Madrid', 'Estadio Santiago Bernabeu', '81044', '1902');
INSERT INTO Teams VALUES('10', 'Atletico de Madrid', 'Madrid', 'Wanda Metropolitano', '68456', '1903');
     
INSERT INTO Players VALUES('1', 'Cristiano', 'Ronaldo', TO_DATE('05-02-1985', 'DD-MM-YYYY'), 'Forward', 'Portugese', '7');
INSERT INTO Players VALUES('2', 'Paul', 'Pogba', TO_DATE('15-03-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'French', '1');
INSERT INTO Players VALUES('3', 'Jack', 'Grealish', TO_DATE('10-09-1995', 'DD-MM-YYYY'), 'Attacking Midfielder', 'English', '8');
INSERT INTO Players VALUES('4', 'Zlatan', 'Ibrahimovic', TO_DATE('03-10-1981', 'DD-MM-YYYY'), 'Striker', 'Swedish', '6');
INSERT INTO Players VALUES('5', 'Sergio', 'Ramos', TO_DATE('30-03-1986', 'DD-MM-YYYY'), 'Center Back', 'Spanish', '9');
INSERT INTO Players VALUES('6', 'Harry', 'Kane', TO_DATE('28-07-1993', 'DD-MM-YYYY'), 'Striker', 'English', '4');
INSERT INTO Players VALUES('7', 'Jordi', 'Alba', TO_DATE('21-03-1989', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '3');
INSERT INTO Players VALUES('8', 'Bruno', 'Fernandes', TO_DATE('08-09-1994', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '1');
INSERT INTO Players VALUES('9', 'Jan', 'Oblak', TO_DATE('07-01-1993', 'DD-MM-YYYY'), 'Goalkeeper', 'Slovenian', '10');
INSERT INTO Players VALUES('10', 'Jadon', 'Sancho', TO_DATE('25-03-2000', 'DD-MM-YYYY'), 'Right Winger', 'English', '2');

    SELECT * FROM Teams, Players WHERE team_id=id_team;
    SELECT COUNT (*) FROM Teams, Players WHERE team_id=id_team;
    SELECT * FROM Teams, Players WHERE team_id=id_team AND player_id = 2;

DROP TABLE Players;
DROP TABLE Teams;
DROP CLUSTER h_cluster;
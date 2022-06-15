DROP TABLE Players;
DROP TABLE Teams;
DROP TABLE Managers;

CREATE TABLE Managers(
    manager_id              number          NOT NULL,
    manager_name            varchar2(25)    NOT NULL,
    manager_surname         varchar2(35)    NOT NULL,
    manager_nationality     varchar2(25),
    manager_age             number(2),
    manages_since           number(4)       CHECK (manages_since > 0 and manages_since <= 2021),
    CONSTRAINT managers_pk PRIMARY KEY(manager_id)
);

CREATE TABLE Teams(
    team_id                 number          NOT NULL,
    team_name               varchar2(35)    NOT NULL    UNIQUE,
    hometown                varchar2(30),
    country                 varchar2(30),
    stadium                 varchar2(40)    NOT NULL,
    capacity                number(6),
    foundation_year         number(4) CHECK (foundation_year > 0 and foundation_year <= 2021), 
    id_manager              number,
    CONSTRAINT teams_pk PRIMARY KEY(team_id),
    CONSTRAINT teams_managers_fk FOREIGN KEY (id_manager) REFERENCES Managers (manager_id)
);

CREATE TABLE Players(
    player_id               number          NOT NULL,
    player_name             varchar2(25)    NOT NULL,
    player_surname          varchar2(35)    NOT NULL,
    birthdate               date            NOT NULL,
    position                varchar2(30),
    player_nationality      varchar2(25),   
    at_club_since           number(4) CHECK (at_club_since > 0 AND at_club_since <= 2021),
    started_career          number(4) CHECK (started_career > 0 AND started_career <= 2021),
    id_team                 number          NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY(player_id),
    CONSTRAINT players_teams_fk FOREIGN KEY (id_team) REFERENCES Teams (team_id)
);

INSERT INTO Managers VALUES('1', 'Jose', 'Mourinho', 'Portugese', '58', '2019');
INSERT INTO Managers VALUES('2', 'Andrea', 'Pirlo', 'Italian', '41', '2020');
INSERT INTO Managers VALUES('3', 'Diego', 'Simeone', 'Argentinian', '50', '2011');
INSERT INTO Managers VALUES('4', 'Stefano', 'Pioli', 'Italian', '55', '2019');
INSERT INTO Managers VALUES('5', 'Ole Gunnar', 'Solskjaer', 'Norwegian', '48', '2018');
INSERT INTO Managers VALUES('6', 'Ronald', 'Koeman', 'Dutch', '58', '2020');
INSERT INTO Managers VALUES('7', 'Zinadine', 'Zidane', 'French', '48', '2019');
INSERT INTO Managers VALUES('8', 'Jurgen', 'Klopp', 'German', '53', '2015');
INSERT INTO Managers VALUES('9', 'Dean', 'Smith', 'English', '50', '2018');
INSERT INTO Managers VALUES('10', 'Edin', 'Terzic', 'German', '38', '2020');
INSERT INTO Managers VALUES('11', 'Hansi', 'Flick', 'German', '56', '2019');
INSERT INTO Managers VALUES('12', 'Pep', 'Guardiola', 'Spanish', '50', '2016');
INSERT INTO Managers VALUES('13', 'Julen', 'Lopetegui', 'Spanish', '54', '2019');
INSERT INTO Managers VALUES('14', 'Gian Piero', 'Gasperini', 'Italian', '63', '2016');
INSERT INTO Managers VALUES('15', 'Antonio', 'Conte', 'Italian', '51', '2019');
INSERT INTO Managers VALUES('16', 'Marco', 'Rose', 'German', '44', '2019');
INSERT INTO Managers VALUES('17', 'Hannes', 'Wolf', 'German', '39', '2021');
INSERT INTO Managers VALUES('18', 'Gennaro', 'Gattuso', 'Italian', '43', '2019');
INSERT INTO Managers VALUES('19', 'Javi', 'Gracia', 'Spanish', '50', '2020');
INSERT INTO Managers VALUES('20', 'Julian', 'Nagelsmann', 'German', '33', '2019');

INSERT INTO Teams VALUES('1', 'Manchester United', 'Manchester', 'England', 'Old Trafford', '76000', '1878', '5');
INSERT INTO Teams VALUES('2', 'Borussia Dortmund', 'Dortmund', 'Germany', 'Signal Iduna Park', '81365', '1909', '10');
INSERT INTO Teams VALUES('3', 'FC Barcelona', 'Barcelona', 'Spain', 'Camp Nou', '99354', '1899', '6');
INSERT INTO Teams VALUES('4', 'Tottenham Hotspur', 'London', 'England', 'New White Hart Lane', '62303', '1882', '1');
INSERT INTO Teams VALUES('5', 'Manchester City', 'Manchester', 'England', 'Etihad Stadium', '55097', '1880', '12');
INSERT INTO Teams VALUES('6', 'AC Milan', 'Milano', 'Italy', 'San Siro', '80018', '1899', '4');
INSERT INTO Teams VALUES('7', 'Juventus', 'Turin', 'Italy', 'Allianz Stadium', '41507', '1897', '2');
INSERT INTO Teams VALUES('8', 'Aston Villa', 'Birmingham', 'England', 'Villa Park', '42785', '1874', '9');
INSERT INTO Teams VALUES('9', 'Real Madrid', 'Madrid', 'Spain', 'Estadio Santiago Bernabeu', '81044', '1902', '7');
INSERT INTO Teams VALUES('10', 'Atletico de Madrid', 'Madrid', 'Spain', 'Wanda Metropolitano', '68456', '1903', '3');
INSERT INTO Teams VALUES('11', 'Liverpool FC', 'Liverpool', 'England', 'Anfield', '53394', '1892', '8');
INSERT INTO Teams VALUES('12', 'FC Bayern Munich', 'Munich', 'Germany', 'Allianz Arena', '75000', '1900', '11');
INSERT INTO Teams VALUES('13', 'Valencia CF', 'Valencia', 'Spain', 'Mestalla', '48600', '1919', '19');
INSERT INTO Teams VALUES('14', 'Red Bull Leipzig', 'Leipzig', 'Germany', 'Red Bull Arena', '42959', '2009', '20');
INSERT INTO Teams VALUES('15', 'Bayer 04 Leverkusen', 'Leverkusen', 'Germany', 'BayArena', '30810', '1904', '17');
INSERT INTO Teams VALUES('16', 'Borussia Monchengladbach', 'Monchengladbach', 'Germany', 'Borussia-Park', '54022', '1900', '16');
INSERT INTO Teams VALUES('17', 'Sevilla FC', 'Seville', 'Spain', 'Estadio Ramon Sanchez Pizjuan', '42714', '1890', '13');
INSERT INTO Teams VALUES('18', 'Atalanta BC', 'Bergamo', 'Italy', 'Gewiss Stadium', '21300', '1907', '14');
INSERT INTO Teams VALUES('19', 'Internazionale', 'Milano', 'Italy', 'San Siro', '80018', '1908', '15');
INSERT INTO Teams VALUES('20', 'Napoli', 'Naples', 'Italy', 'Stadio Diego Armando Maradona', '54726', '1926', '18');

INSERT INTO Players VALUES('1', 'Cristiano', 'Ronaldo', TO_DATE('05-02-1985', 'DD-MM-YYYY'), 'Striker', 'Portugese', '2018', '2002', '7');
INSERT INTO Players VALUES('2', 'Paul', 'Pogba', TO_DATE('15-03-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'French', '2016', '2011', '1');
INSERT INTO Players VALUES('3', 'Jack', 'Grealish', TO_DATE('10-09-1995', 'DD-MM-YYYY'), 'Attacking Midfielder', 'English', '2001', '2012', '8');
INSERT INTO Players VALUES('4', 'Zlatan', 'Ibrahimovic', TO_DATE('03-10-1981', 'DD-MM-YYYY'), 'Striker', 'Swedish', '2020', '1999', '6');
INSERT INTO Players VALUES('5', 'Sergio', 'Ramos', TO_DATE('30-03-1986', 'DD-MM-YYYY'), 'Center Back', 'Spanish', '2005', '2003', '9');
INSERT INTO Players VALUES('6', 'Harry', 'Kane', TO_DATE('28-07-1993', 'DD-MM-YYYY'), 'Striker', 'English', '2004', '2009', '4');
INSERT INTO Players VALUES('7', 'Jordi', 'Alba', TO_DATE('21-03-1989', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '2012', '2007', '3');
INSERT INTO Players VALUES('8', 'Bruno', 'Fernandes', TO_DATE('08-09-1994', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '2020', '2012', '1');
INSERT INTO Players VALUES('9', 'Jan', 'Oblak', TO_DATE('07-01-1993', 'DD-MM-YYYY'), 'Goalkeeper', 'Slovenian', '2014', '2009', '10');
INSERT INTO Players VALUES('10', 'Jadon', 'Sancho', TO_DATE('25-03-2000', 'DD-MM-YYYY'), 'Right Winger', 'English', '2017', '2017', '2');
INSERT INTO Players VALUES('11', 'Lorenzo', 'Insigne', TO_DATE('04-06-1991', 'DD-MM-YYYY'), 'Left Winger', 'Italian', '2006', '2010', '20');
INSERT INTO Players VALUES('12', 'Sadio', 'Mane', TO_DATE('10-04-1992', 'DD-MM-YYYY'), 'Left Winger', 'Senegalese', '2016', '2011', '11');
INSERT INTO Players VALUES('13', 'Thomas', 'Muller', TO_DATE('13-09-1989', 'DD-MM-YYYY'), 'Attacking Midfielder', 'German', '2000', '2008', '12');
INSERT INTO Players VALUES('14', 'Romelu', 'Lukaku', TO_DATE('13-05-1993', 'DD-MM-YYYY'), 'Striker', 'Belgian', '2019', '2009', '19');
INSERT INTO Players VALUES('15', 'Ibrahima', 'Konate', TO_DATE('25-05-1999', 'DD-MM-YYYY'), 'Center Back', 'French', '2017', '2016', '14');
INSERT INTO Players VALUES('16', 'Ruslan', 'Malinovskiy', TO_DATE('04-05-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'Ukrainian', '2019', '2011', '18');
INSERT INTO Players VALUES('17', 'Lucas', 'Ocampos', TO_DATE('11-07-1994', 'DD-MM-YYYY'), 'Left Winger', 'Argentinian', '2019', '2011', '17');
INSERT INTO Players VALUES('18', 'Sergio', 'Aguero', TO_DATE('02-06-1988', 'DD-MM-YYYY'), 'Striker', 'Argentinian', '2011', '2003', '5');
INSERT INTO Players VALUES('19', 'Jasper', 'Cillesen', TO_DATE('22-04-1989', 'DD-MM-YYYY'), 'Goalkeeper', 'Dutch', '2019', '2010', '13');
INSERT INTO Players VALUES('20', 'Marcus', 'Thuram', TO_DATE('06-08-1997', 'DD-MM-YYYY'), 'Striker', 'French', '2019', '2014', '16');
INSERT INTO Players VALUES('21', 'Timothy', 'Fosu-Mensah', TO_DATE('02-01-1998', 'DD-MM-YYYY'), 'Right Back', 'Dutch', '2021', '2016', '15');
INSERT INTO Players VALUES('22', 'Vinicius', 'Junior', TO_DATE('12-07-2000', 'DD-MM-YYYY'), 'Left Winger', 'Brazilian', '2018', '2017', '9');
INSERT INTO Players VALUES('23', 'Robert', 'Lewandowski', TO_DATE('21-08-1988', 'DD-MM-YYYY'), 'Striker', 'Polish', '2014', '2005', '12');
INSERT INTO Players VALUES('24', 'Frenkie', 'de Jong', TO_DATE('12-05-1997', 'DD-MM-YYYY'), 'Central Midfielder', 'Dutch', '2019', '2015', '3');
INSERT INTO Players VALUES('25', 'Franck Yannick', 'Kessie', TO_DATE('19-12-1996', 'DD-MM-YYYY'), 'Central Midfielder', 'Ivorian', '2019', '2015', '6');
INSERT INTO Players VALUES('26', 'Hirving', 'Lozano', TO_DATE('30-07-1995', 'DD-MM-YYYY'), 'Right Winger', 'Mexican', '2019', '2014', '20');
INSERT INTO Players VALUES('27', 'Toby', 'Alderweireld', TO_DATE('02-03-1989', 'DD-MM-YYYY'), 'Center Back', 'Belgian', '2015', '2008', '4');
INSERT INTO Players VALUES('28', 'Erling Braut', 'Haalland', TO_DATE('21-07-2000', 'DD-MM-YYYY'), 'Striker', 'Norwegian', '2020', '2015', '2');
INSERT INTO Players VALUES('29', 'Gianluigi', 'Buffon', TO_DATE('28-01-1978', 'DD-MM-YYYY'), 'Goalkeeper', 'Italian', '2001', '1995', '7');
INSERT INTO Players VALUES('30', 'Joao', 'Felix', TO_DATE('10-11-1999', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '2019', '2016', '10');
INSERT INTO Players VALUES('31', 'Leon', 'Goretzka', TO_DATE('06-02-1995', 'DD-MM-YYYY'), 'Central Midfielder', 'German', '2018', '2012', '12');
INSERT INTO Players VALUES('32', 'Fabio Henrique', 'Tavares', TO_DATE('23-10-1993', 'DD-MM-YYYY'), 'Defensive Midfielder', 'Brasilian', '2018', '2012', '11');
INSERT INTO Players VALUES('33', 'Christian', 'Eriksen', TO_DATE('14-02-1992', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Dannish', '2020', '2010', '19');
INSERT INTO Players VALUES('34', 'Marcus', 'Rashford', TO_DATE('31-10-1997', 'DD-MM-YYYY'), 'Left Winger', 'English', '2005', '2015', '1');
INSERT INTO Players VALUES('35', 'Ruben', 'Dias', TO_DATE('14-05-1997', 'DD-MM-YYYY'), 'Center Back', 'Portugese', '2020', '2015', '5');
INSERT INTO Players VALUES('36', 'Duvan', 'Zapata', TO_DATE('01-04-1991', 'DD-MM-YYYY'), 'Striker', 'Columbian', '2018', '2008', '18');
INSERT INTO Players VALUES('37', 'Leon', 'Bailey', TO_DATE('09-08-1997', 'DD-MM-YYYY'), 'Left Winger', 'Jamaican', '2017', '2015', '15');
INSERT INTO Players VALUES('38', 'Nicolo', 'Barella', TO_DATE('07-02-1997', 'DD-MM-YYYY'), 'Central Midfielder', 'Italian', '2020', '2015', '19');
INSERT INTO Players VALUES('39', 'Gianluigi', 'Donnarumma', TO_DATE('25-02-1999', 'DD-MM-YYYY'), 'Goalkeeper', 'Italian', '2013', '2015', '6');
INSERT INTO Players VALUES('40', 'Jose', 'Gaya', TO_DATE('25-05-1995', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '2006', '2012', '13');
INSERT INTO Players VALUES('41', 'Carlos Henrique', 'Casemiro', TO_DATE('23-02-1992', 'DD-MM-YYYY'), 'Defensive Midfielder', 'Brasilian', '2013', '2010', '9');
INSERT INTO Players VALUES('42', 'Hugo', 'Lloris', TO_DATE('26-12-1986', 'DD-MM-YYYY'), 'Goalkeeper', 'French', '2021', '2005', '4');
INSERT INTO Players VALUES('43', 'Mason', 'Greenwood', TO_DATE('01-10-2001', 'DD-MM-YYYY'), 'Striker', 'English', '2007', '2018', '1');
INSERT INTO Players VALUES('44', 'Ivan', 'Rakitic', TO_DATE('10-03-1988', 'DD-MM-YYYY'), 'Central Midfielder', 'Croatian', '2020', '2005', '17');
INSERT INTO Players VALUES('45', 'Dani', 'Olmo', TO_DATE('07-05-1998', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Spanish', '2020', '2015', '14');
INSERT INTO Players VALUES('46', 'Lionel', 'Messi', TO_DATE('24-06-1987', 'DD-MM-YYYY'), 'Right Winger', 'Argentinian', '2000', '2003', '3');
INSERT INTO Players VALUES('47', 'Alassane', 'Plea', TO_DATE('10-03-1993', 'DD-MM-YYYY'), 'Striker', 'French', '2018', '2010', '16');
INSERT INTO Players VALUES('48', 'Joshua', 'Kimmich', TO_DATE('08-02-1995', 'DD-MM-YYYY'), 'Defensive Midfielder', 'German', '2015', '2013', '12');
INSERT INTO Players VALUES('49', 'Karim', 'Benzema', TO_DATE('19-12-1987', 'DD-MM-YYYY'), 'Striker', 'French', '2009', '2004', '9');
INSERT INTO Players VALUES('50', 'Aaron', 'Wan-Bissaka', TO_DATE('26-11-1997', 'DD-MM-YYYY'), 'Right Back', 'English', '2019', '2016', '1');

SELECT * FROM Teams;
SELECT * FROM Managers;
SELECT * FROM Players;
SELECT * FROM Teams, Managers WHERE manager_id = id_manager;
SELECT * FROM Teams, Managers, Players WHERE team_id = id_team AND manager_id = id_manager;
/*******************************************************************************************************************************
            2.1.
*******************************************************************************************************************************/
    SELECT manager_name, manager_surname, manages_since
    FROM Managers
    WHERE (manages_since - (2021 - manager_age)) < 50 AND ((2021- manages_since) >= 5);
    
    SELECT player_name, player_surname,
    CASE
        WHEN EXTRACT(MONTH FROM birthdate) >= 4 THEN 2020 - EXTRACT(YEAR FROM birthdate)
        ELSE 2021 - EXTRACT(YEAR FROM birthdate)
    END AS age
    FROM Players
    WHERE player_name LIKE 'C%' OR player_name LIKE 'J%'
    ORDER BY player_name ASC;
/*******************************************************************************************************************************
            2.2.
*******************************************************************************************************************************/
    SELECT player_name, player_surname, manager_name, manager_surname, manager_nationality AS nationality, team_name 
    FROM Players, Managers, Teams
    WHERE manager_nationality = player_nationality AND team_id = id_team AND manager_id = id_manager;
    
    SELECT player_name, player_surname, team_name
    FROM Players, Teams
    WHERE (started_career - at_club_since) > 0 AND team_id = id_team;
/*******************************************************************************************************************************
            2.3.
*******************************************************************************************************************************/
    /*SELECT COUNT(player_id) AS player_quantity, team_name
    FROM Teams, Players
    WHERE team_id = id_team
    GROUP BY team_name
    ORDER BY player_quantity DESC; */

    SELECT COUNT(player_id) AS player_quantity, team_name
    FROM Teams, Players
    WHERE team_id = id_team
    GROUP BY team_name
    HAVING COUNT(player_id) >= 3
    ORDER BY player_quantity DESC;
    
    /*SELECT COUNT(manager_id) AS manager_quantity, manager_nationality
    FROM Managers
    GROUP BY manager_nationality
    ORDER BY manager_quantity;*/ 
    
    SELECT COUNT(manager_id) AS manager_quantity, manager_nationality
    FROM Managers
    GROUP BY manager_nationality
    HAVING COUNT(manager_id) = 1
    ORDER BY manager_quantity;
/*******************************************************************************************************************************
            2.4.
*******************************************************************************************************************************/
    SELECT player_name AS name, player_surname AS surname, position, (SELECT team_name
                                                            FROM Teams
                                                            WHERE team_id = id_team
                                                            ) AS team
    FROM Players
    WHERE position = 'Left Back' OR position = 'Right Back' OR position = 'Center Back'
    ORDER BY player_name ASC;
/*******************************************************************************************************************************
            2.5.
*******************************************************************************************************************************/
    SELECT player_name AS name, player_surname AS surname, team_name, (started_career - at_club_since) AS years_at_clubs_academy, (2021 - started_career) AS years_at_first_team
    FROM Players, (SELECT * FROM Teams WHERE hometown IN ('Manchester', 'Milano'))
    WHERE team_id = id_team AND (started_career - at_club_since) > 0
/*******************************************************************************************************************************
            2.6.
*******************************************************************************************************************************/
  SELECT manager_name, manager_surname, manager_nationality, manager_age
  FROM Managers
  WHERE (manager_age < 40 OR manager_age > 55) AND manager_id IN (SELECT id_manager
                                                                  FROM Teams
                                                                  WHERE country IN ('Germany', 'England'));
/*******************************************************************************************************************************
            2.7.
*******************************************************************************************************************************/
SELECT * FROM Teams
PIVOT(
      COUNT(team_id)
      FOR foundation_year IN('1899', '1900', '1901')
          )ORDER BY team_name ASC;
/*******************************************************************************************************************************
            2.8.
*******************************************************************************************************************************/
    SELECT manager_name, manager_surname
    FROM Managers
    WHERE EXISTS (SELECT team_name 
                  FROM Teams
                  WHERE foundation_year <= 1900
                  AND manager_id = id_manager);
/*******************************************************************************************************************************
            2.9.
*******************************************************************************************************************************/
    SELECT player_name AS name, player_surname AS surname, team_name, (2021 - at_club_since) AS years_spent_at_the_club
    FROM Players, Teams
    WHERE (2021 - at_club_since) >= 10 AND team_id = id_team
    UNION
    SELECT manager_name AS name, manager_surname AS surname, team_name, (2021 - manages_since) AS years_spent_at_the_club
    FROM Managers, Teams
    WHERE (2021 - manages_since) >= 10 AND manager_id = id_manager
    ORDER BY years_spent_at_the_club DESC;
/*******************************************************************************************************************************
            2.10.
*******************************************************************************************************************************/
  SELECT manager_name, manager_surname, manager_nationality, manager_age
  FROM Managers
  WHERE (manager_age < 40 OR manager_age > 55) AND manager_id IN (SELECT id_manager
                                                                  FROM Teams
                                                                  WHERE country IN ('Germany', 'England'));
                                                                    
    SELECT manager_name, manager_surname, manager_nationality, manager_age
    FROM Managers, (SELECT id_manager
                    FROM Teams
                     WHERE country IN ('Germany', 'England'))
    WHERE (manager_age < 40 OR manager_age > 55) AND manager_id = id_manager;
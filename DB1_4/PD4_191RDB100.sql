DROP TABLE Players;
DROP TABLE Stadium;
DROP TABLE Teams;
DROP TABLE Managers;
DROP TABLE Championship;

CREATE TABLE Managers(
    manager_id                  number          NOT NULL,
    manager_name                varchar2(25)    NOT NULL,
    manager_surname             varchar2(35)    NOT NULL,
    manager_nationality         varchar2(25), 
    manager_wage                number          CHECK(manager_wage >= 0),
    manager_age                 number(2)       CHECK(manager_age >= 0),
    manages_since               number(4)       CHECK(manages_since > 0 and manages_since <= 2021),
    CONSTRAINT managers_pk PRIMARY KEY(manager_id)
);

CREATE TABLE Championship(
    championship_id             number          NOT NULL,
    championship_name           varchar(50)     NOT NULL    UNIQUE,
    total_team_count            number(2)       NOT NULL    CHECK(total_team_count > 0), 
    CONSTRAINT championship_pk PRIMARY KEY(championship_id)
);

CREATE TABLE Teams(
    team_id                     number          NOT NULL,
    team_name                   varchar2(35)    NOT NULL    UNIQUE,
    hometown                    varchar2(30),
    country                     varchar2(30),
    stadium                     varchar2(40)    NOT NULL,
    capacity                    number(6)       CHECK(capacity >= 0),
    foundation_year             number(4) CHECK (foundation_year > 0 and foundation_year <= 2021), 
    id_manager                  number,
    id_championship             number,
    CONSTRAINT teams_pk PRIMARY KEY(team_id),
    CONSTRAINT teams_managers_fk FOREIGN KEY (id_manager) REFERENCES Managers (manager_id),
    CONSTRAINT teams_championship_fk FOREIGN KEY (id_championship) REFERENCES Championship (championship_id)
);

CREATE TABLE Players(
    player_id                   number          NOT NULL,
    player_name                 varchar2(25)    NOT NULL,
    player_surname              varchar2(35)    NOT NULL,
    birthdate                   date            NOT NULL,
    position                    varchar2(30),
    player_nationality          varchar2(25),
    player_wage                 number          CHECK(player_wage >= 0),
    at_club_since               number(4) CHECK (at_club_since > 0 AND at_club_since <= 2021),
    started_career              number(4) CHECK (started_career > 0 AND started_career <= 2021),
    id_team                     number          NOT NULL,
    CONSTRAINT players_pk PRIMARY KEY(player_id),
    CONSTRAINT players_teams_fk FOREIGN KEY (id_team) REFERENCES Teams (team_id)
);

CREATE TABLE Stadium(
    record_id                   number          NOT NULL,
    stadium                     varchar2(40)    NOT NULL,
    record_year                 number(4)       CHECK (record_year > 0 AND record_year <= 2021),
    attendance                  number(6)       CHECK(attendance >= 0),
    average_low_ticket_price    number(6)       CHECK(average_low_ticket_price >= 0),
    id_team                     number          NOT NULL,
    CONSTRAINT stadium_pk PRIMARY KEY(record_id),
    CONSTRAINT stadium_teams_fk FOREIGN KEY (id_team) REFERENCES Teams (team_id)
);

INSERT INTO Managers VALUES('1', 'Jose', 'Mourinho', 'Portugese', '332000', '58', '2019');
INSERT INTO Managers VALUES('2', 'Andrea', 'Pirlo', 'Italian', '166000', '41', '2020');
INSERT INTO Managers VALUES('3', 'Diego', 'Simeone', 'Argentinian', '464000', '50', '2011');
INSERT INTO Managers VALUES('4', 'Stefano', 'Pioli', 'Italian', '42000', '55', '2019');
INSERT INTO Managers VALUES('5', 'Ole Gunnar', 'Solskjaer', 'Norwegian', '204000', '48', '2018');
INSERT INTO Managers VALUES('6', 'Ronald', 'Koeman', 'Dutch', '215000', '58', '2020');
INSERT INTO Managers VALUES('7', 'Zinadine', 'Zidane', 'French', '232000', '48', '2019');
INSERT INTO Managers VALUES('8', 'Jurgen', 'Klopp', 'German', '222000', '53', '2015');
INSERT INTO Managers VALUES('9', 'Dean', 'Smith', 'English', '36000', '50', '2018');
INSERT INTO Managers VALUES('10', 'Edin', 'Terzic', 'German', '29000', '38', '2020');
INSERT INTO Managers VALUES('11', 'Hansi', 'Flick', 'German', '312000', '56', '2019');
INSERT INTO Managers VALUES('12', 'Pep', 'Guardiola', 'Spanish', '332000', '50', '2016');
INSERT INTO Managers VALUES('13', 'Julen', 'Lopetegui', 'Spanish', '220000', '54', '2019');
INSERT INTO Managers VALUES('14', 'Gian Piero', 'Gasperini', 'Italian', '190000', '63', '2016');
INSERT INTO Managers VALUES('15', 'Antonio', 'Conte', 'Italian', '322000', '51', '2019');
INSERT INTO Managers VALUES('16', 'Marco', 'Rose', 'German', '73000', '44', '2019');
INSERT INTO Managers VALUES('17', 'Hannes', 'Wolf', 'German', '29000', '39', '2021');
INSERT INTO Managers VALUES('18', 'Gennaro', 'Gattuso', 'Italian', '129000', '43', '2019');
INSERT INTO Managers VALUES('19', 'Javi', 'Gracia', 'Spanish', '117000', '50', '2020');
INSERT INTO Managers VALUES('20', 'Julian', 'Nagelsmann', 'German', '94000', '33', '2019');

INSERT INTO Championship VALUES('1', 'Premier League', '20');
INSERT INTO Championship VALUES('2', 'Bundesliga', '18');
INSERT INTO Championship VALUES('3', 'Seria A', '20');
INSERT INTO Championship VALUES('4', 'La Liga', '20');

INSERT INTO Teams VALUES('1', 'Manchester United', 'Manchester', 'England', 'Old Trafford', '76000', '1878', '5', '1');
INSERT INTO Teams VALUES('2', 'Borussia Dortmund', 'Dortmund', 'Germany', 'Signal Iduna Park', '81365', '1909', '10', '2');
INSERT INTO Teams VALUES('3', 'FC Barcelona', 'Barcelona', 'Spain', 'Camp Nou', '99354', '1899', '6', '4');
INSERT INTO Teams VALUES('4', 'Tottenham Hotspur', 'London', 'England', 'New White Hart Lane', '62303', '1882', '1', '1');
INSERT INTO Teams VALUES('5', 'Manchester City', 'Manchester', 'England', 'Etihad Stadium', '55097', '1880', '12', '1');
INSERT INTO Teams VALUES('6', 'AC Milan', 'Milano', 'Italy', 'San Siro', '80018', '1899', '4', '3');
INSERT INTO Teams VALUES('7', 'Juventus', 'Turin', 'Italy', 'Allianz Stadium', '41507', '1897', '2', '3');
INSERT INTO Teams VALUES('8', 'Aston Villa', 'Birmingham', 'England', 'Villa Park', '42785', '1874', '9', '1');
INSERT INTO Teams VALUES('9', 'Real Madrid', 'Madrid', 'Spain', 'Estadio Santiago Bernabeu', '81044', '1902', '7', '4');
INSERT INTO Teams VALUES('10', 'Atletico de Madrid', 'Madrid', 'Spain', 'Wanda Metropolitano', '68456', '1903', '3', '3');
INSERT INTO Teams VALUES('11', 'Liverpool FC', 'Liverpool', 'England', 'Anfield', '53394', '1892', '8', '1');
INSERT INTO Teams VALUES('12', 'FC Bayern Munich', 'Munich', 'Germany', 'Allianz Arena', '75000', '1900', '11', '2');
INSERT INTO Teams VALUES('13', 'Valencia CF', 'Valencia', 'Spain', 'Mestalla', '48600', '1919', '19', '4');
INSERT INTO Teams VALUES('14', 'Red Bull Leipzig', 'Leipzig', 'Germany', 'Red Bull Arena', '42959', '2009', '20', '2');
INSERT INTO Teams VALUES('15', 'Bayer 04 Leverkusen', 'Leverkusen', 'Germany', 'BayArena', '30810', '1904', '17', '2');
INSERT INTO Teams VALUES('16', 'Borussia Monchengladbach', 'Monchengladbach', 'Germany', 'Borussia-Park', '54022', '1900', '16', '2');
INSERT INTO Teams VALUES('17', 'Sevilla FC', 'Seville', 'Spain', 'Estadio Ramon Sanchez Pizjuan', '42714', '1890', '13', '4');
INSERT INTO Teams VALUES('18', 'Atalanta BC', 'Bergamo', 'Italy', 'Gewiss Stadium', '21300', '1907', '14', '3');
INSERT INTO Teams VALUES('19', 'Internazionale', 'Milano', 'Italy', 'Stadio Giuseppe Meazza', '80018', '1908', '15', '3');
INSERT INTO Teams VALUES('20', 'Napoli', 'Naples', 'Italy', 'Stadio Diego Armando Maradona', '54726', '1926', '18', '3');

INSERT INTO Players VALUES('1', 'Cristiano', 'Ronaldo', TO_DATE('05-02-1985', 'DD-MM-YYYY'), 'Striker', 'Portugese', '577000', '2018', '2002', '7');
INSERT INTO Players VALUES('2', 'Paul', 'Pogba', TO_DATE('15-03-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'French', '335000', '2016', '2011', '1');
INSERT INTO Players VALUES('3', 'Jack', 'Grealish', TO_DATE('10-09-1995', 'DD-MM-YYYY'), 'Attacking Midfielder', 'English', '41000', '2001', '2012', '8');
INSERT INTO Players VALUES('4', 'Zlatan', 'Ibrahimovic', TO_DATE('03-10-1981', 'DD-MM-YYYY'), 'Striker', 'Swedish', '120000', '2020', '1999', '6');
INSERT INTO Players VALUES('5', 'Sergio', 'Ramos', TO_DATE('30-03-1986', 'DD-MM-YYYY'), 'Center Back', 'Spanish', '390000', '2005', '2003', '9');
INSERT INTO Players VALUES('6', 'Harry', 'Kane', TO_DATE('28-07-1993', 'DD-MM-YYYY'), 'Striker', 'English', '231000', '2004', '2009', '4');
INSERT INTO Players VALUES('7', 'Jordi', 'Alba', TO_DATE('21-03-1989', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '203000', '2012', '2007', '3');
INSERT INTO Players VALUES('8', 'Bruno', 'Fernandes', TO_DATE('08-09-1994', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '208000', '2020', '2012', '1');
INSERT INTO Players VALUES('9', 'Jan', 'Oblak', TO_DATE('07-01-1993', 'DD-MM-YYYY'), 'Goalkeeper', 'Slovenian', '313000', '2014', '2009', '10');
INSERT INTO Players VALUES('10', 'Jadon', 'Sancho', TO_DATE('25-03-2000', 'DD-MM-YYYY'), 'Right Winger', 'English', '185000', '2017', '2017', '2');
INSERT INTO Players VALUES('11', 'Lorenzo', 'Insigne', TO_DATE('04-06-1991', 'DD-MM-YYYY'), 'Left Winger', 'Italian', '173000', '2006', '2010', '20');
INSERT INTO Players VALUES('12', 'Sadio', 'Mane', TO_DATE('10-04-1992', 'DD-MM-YYYY'), 'Left Winger', 'Senegalese', '115000', '2016', '2011', '11');
INSERT INTO Players VALUES('13', 'Thomas', 'Muller', TO_DATE('13-09-1989', 'DD-MM-YYYY'), 'Attacking Midfielder', 'German', '298000', '2000', '2008', '12');
INSERT INTO Players VALUES('14', 'Romelu', 'Lukaku', TO_DATE('13-05-1993', 'DD-MM-YYYY'), 'Striker', 'Belgian', '231000', '2019', '2009', '19');
INSERT INTO Players VALUES('15', 'Ibrahima', 'Konate', TO_DATE('25-05-1999', 'DD-MM-YYYY'), 'Center Back', 'French', '42000', '2017', '2016', '14');
INSERT INTO Players VALUES('16', 'Ruslan', 'Malinovskiy', TO_DATE('04-05-1993', 'DD-MM-YYYY'), 'Central Midfielder', 'Ukrainian', '29000', '2019', '2011', '18');
INSERT INTO Players VALUES('17', 'Lucas', 'Ocampos', TO_DATE('11-07-1994', 'DD-MM-YYYY'), 'Left Winger', 'Argentinian', '110000', '2019', '2011', '17');
INSERT INTO Players VALUES('18', 'Sergio', 'Aguero', TO_DATE('02-06-1988', 'DD-MM-YYYY'), 'Striker', 'Argentinian', '265000', '2011', '2003', '5');
INSERT INTO Players VALUES('19', 'Jasper', 'Cillesen', TO_DATE('22-04-1989', 'DD-MM-YYYY'), 'Goalkeeper', 'Dutch', '90000', '2019', '2010', '13');
INSERT INTO Players VALUES('20', 'Marcus', 'Thuram', TO_DATE('06-08-1997', 'DD-MM-YYYY'), 'Striker', 'French', '62000', '2019', '2014', '16');
INSERT INTO Players VALUES('21', 'Timothy', 'Fosu-Mensah', TO_DATE('02-01-1998', 'DD-MM-YYYY'), 'Right Back', 'Dutch', '16500', '2021', '2016', '15');
INSERT INTO Players VALUES('22', 'Vinicius', 'Junior', TO_DATE('12-07-2000', 'DD-MM-YYYY'), 'Left Winger', 'Brazilian', '227000', '2018', '2017', '9');
INSERT INTO Players VALUES('23', 'Robert', 'Lewandowski', TO_DATE('21-08-1988', 'DD-MM-YYYY'), 'Striker', 'Polish', '406000', '2014', '2005', '12');
INSERT INTO Players VALUES('24', 'Frenkie', 'de Jong', TO_DATE('12-05-1997', 'DD-MM-YYYY'), 'Central Midfielder', 'Dutch', '203000', '2019', '2015', '3');
INSERT INTO Players VALUES('25', 'Franck Yannick', 'Kessie', TO_DATE('19-12-1996', 'DD-MM-YYYY'), 'Central Midfielder', 'Ivorian', '37000', '2019', '2015', '6');
INSERT INTO Players VALUES('26', 'Hirving', 'Lozano', TO_DATE('30-07-1995', 'DD-MM-YYYY'), 'Right Winger', 'Mexican', '110000', '2019', '2014', '20');
INSERT INTO Players VALUES('27', 'Toby', 'Alderweireld', TO_DATE('02-03-1989', 'DD-MM-YYYY'), 'Center Back', 'Belgian', '92000', '2015', '2008', '4');
INSERT INTO Players VALUES('28', 'Erling Braut', 'Haalland', TO_DATE('21-07-2000', 'DD-MM-YYYY'), 'Striker', 'Norwegian', '162000', '2020', '2015', '2');
INSERT INTO Players VALUES('29', 'Gianluigi', 'Buffon', TO_DATE('28-01-1978', 'DD-MM-YYYY'), 'Goalkeeper', 'Italian', '47000', '2001', '1995', '7');
INSERT INTO Players VALUES('30', 'Joao', 'Felix', TO_DATE('10-11-1999', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Portugese', '250000', '2019', '2016', '10');
INSERT INTO Players VALUES('31', 'Leon', 'Goretzka', TO_DATE('06-02-1995', 'DD-MM-YYYY'), 'Central Midfielder', 'German', '202000', '2018', '2012', '12');
INSERT INTO Players VALUES('32', 'Fabio Henrique', 'Tavares', TO_DATE('23-10-1993', 'DD-MM-YYYY'), 'Defensive Midfielder', 'Brasilian', '115000', '2018', '2012', '11');
INSERT INTO Players VALUES('33', 'Christian', 'Eriksen', TO_DATE('14-02-1992', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Dannish', '280000', '2020', '2010', '19');
INSERT INTO Players VALUES('34', 'Marcus', 'Rashford', TO_DATE('31-10-1997', 'DD-MM-YYYY'), 'Left Winger', 'English', '208000', '2005', '2015', '1');
INSERT INTO Players VALUES('35', 'Ruben', 'Dias', TO_DATE('14-05-1997', 'DD-MM-YYYY'), 'Center Back', 'Portugese', '133000', '2020', '2015', '5');
INSERT INTO Players VALUES('36', 'Duvan', 'Zapata', TO_DATE('01-04-1991', 'DD-MM-YYYY'), 'Striker', 'Columbian', '64000', '2018', '2008', '18');
INSERT INTO Players VALUES('37', 'Leon', 'Bailey', TO_DATE('09-08-1997', 'DD-MM-YYYY'), 'Left Winger', 'Jamaican', '43000', '2017', '2015', '15');
INSERT INTO Players VALUES('38', 'Nicolo', 'Barella', TO_DATE('07-02-1997', 'DD-MM-YYYY'), 'Central Midfielder', 'Italian', '92000', '2020', '2015', '19');
INSERT INTO Players VALUES('39', 'Gianluigi', 'Donnarumma', TO_DATE('25-02-1999', 'DD-MM-YYYY'), 'Goalkeeper', 'Italian', '225000', '2013', '2015', '6');
INSERT INTO Players VALUES('40', 'Jose', 'Gaya', TO_DATE('25-05-1995', 'DD-MM-YYYY'), 'Left Back', 'Spanish', '67000', '2006', '2012', '13');
INSERT INTO Players VALUES('41', 'Carlos Henrique', 'Casemiro', TO_DATE('23-02-1992', 'DD-MM-YYYY'), 'Defensive Midfielder', 'Brasilian', '227000', '2013', '2010', '9');
INSERT INTO Players VALUES('42', 'Hugo', 'Lloris', TO_DATE('26-12-1986', 'DD-MM-YYYY'), 'Goalkeeper', 'French', '115000', '2021', '2005', '4');
INSERT INTO Players VALUES('43', 'Mason', 'Greenwood', TO_DATE('01-10-2001', 'DD-MM-YYYY'), 'Striker', 'English', '87000', '2007', '2018', '1');
INSERT INTO Players VALUES('44', 'Ivan', 'Rakitic', TO_DATE('10-03-1988', 'DD-MM-YYYY'), 'Central Midfielder', 'Croatian', '132000', '2020', '2005', '17');
INSERT INTO Players VALUES('45', 'Dani', 'Olmo', TO_DATE('07-05-1998', 'DD-MM-YYYY'), 'Attacking Midfielder', 'Spanish', '23000', '2020', '2015', '14');
INSERT INTO Players VALUES('46', 'Lionel', 'Messi', TO_DATE('24-06-1987', 'DD-MM-YYYY'), 'Right Winger', 'Argentinian', '565000', '2000', '2003', '3');
INSERT INTO Players VALUES('47', 'Alassane', 'Plea', TO_DATE('10-03-1993', 'DD-MM-YYYY'), 'Striker', 'French', '60000', '2018', '2010', '16');
INSERT INTO Players VALUES('48', 'Joshua', 'Kimmich', TO_DATE('08-02-1995', 'DD-MM-YYYY'), 'Defensive Midfielder', 'German', '202000', '2015', '2013', '12');
INSERT INTO Players VALUES('49', 'Karim', 'Benzema', TO_DATE('19-12-1987', 'DD-MM-YYYY'), 'Striker', 'French', '192000', '2009', '2004', '9');
INSERT INTO Players VALUES('50', 'Aaron', 'Wan-Bissaka', TO_DATE('26-11-1997', 'DD-MM-YYYY'), 'Right Back', 'English', '104000', '2019', '2016', '1');

INSERT INTO Stadium VALUES('1', 'Old Trafford', '2019', '75498', '99', '1');
INSERT INTO Stadium VALUES('2', 'Old Trafford', '2018', '75976', '87', '1');
INSERT INTO Stadium VALUES('3', 'Old Trafford', '2017', '76000', '94', '1');
INSERT INTO Stadium VALUES('4', 'Signal Iduna Park', '2019', '80820', '99', '2');
INSERT INTO Stadium VALUES('5', 'Signal Iduna Park', '2018', '79496', '92', '2');
INSERT INTO Stadium VALUES('6', 'Signal Iduna Park', '2017', '79653', '83', '2');
INSERT INTO Stadium VALUES('7', 'Camp Nou', '2019', '75208', '68', '3');
INSERT INTO Stadium VALUES('8', 'Camp Nou', '2018', '65731', '76', '3');
INSERT INTO Stadium VALUES('9', 'Camp Nou', '2017', '77461', '57', '3');
INSERT INTO Stadium VALUES('10', 'New White Hart Lane', '2019', '54216', '65', '4');
INSERT INTO Stadium VALUES('11', 'New White Hart Lane', '2018', '59837', '89', '4');
INSERT INTO Stadium VALUES('12', 'New White Hart Lane', '2017', '31639', '77', '4');
INSERT INTO Stadium VALUES('13', 'Etihad Stadium', '2019', '53130', '59', '5');
INSERT INTO Stadium VALUES('14', 'Etihad Stadium', '2018', '52812', '52', '5');
INSERT INTO Stadium VALUES('15', 'Etihad Stadium', '2017', '53019', '61', '5');
INSERT INTO Stadium VALUES('16', 'San Siro', '2019', '54651', '28', '6');
INSERT INTO Stadium VALUES('17', 'San Siro', '2018', '52690', '34', '6');
INSERT INTO Stadium VALUES('18', 'San Siro', '2017', '40294', '35', '6');
INSERT INTO Stadium VALUES('19', 'Allianz Stadium', '2019', '39193', '128', '7');
INSERT INTO Stadium VALUES('20', 'Allianz Stadium', '2018', '38948', '136', '7');
INSERT INTO Stadium VALUES('21', 'Allianz Stadium', '2017', '39294', '151', '7');
INSERT INTO Stadium VALUES('22', 'Villa Park', '2019', '36029', '60', '8');
INSERT INTO Stadium VALUES('23', 'Villa Park', '2018', '32097', '61', '8');
INSERT INTO Stadium VALUES('24', 'Villa Park', '2017', '32107', '68', '8');
INSERT INTO Stadium VALUES('25', 'Estadio Santiago Bernabeu', '2019', '60598', '67', '9');
INSERT INTO Stadium VALUES('26', 'Estadio Santiago Bernabeu', '2018', '65027', '53', '9');
INSERT INTO Stadium VALUES('27', 'Estadio Santiago Bernabeu', '2017', '68896', '75', '9');
INSERT INTO Stadium VALUES('28', 'Wanda Metropolitano', '2019', '56055', '44', '10');
INSERT INTO Stadium VALUES('29', 'Wanda Metropolitano', '2018', '55487', '40', '10');
INSERT INTO Stadium VALUES('30', 'Wanda Metropolitano', '2017', '44678', '36', '10');
INSERT INTO Stadium VALUES('31', 'Anfield', '2019', '52983', '66', '11');
INSERT INTO Stadium VALUES('32', 'Anfield', '2018', '53049', '62', '11');
INSERT INTO Stadium VALUES('33', 'Anfield', '2017', '53016', '49', '11');
INSERT INTO Stadium VALUES('34', 'Allianz Arena', '2019', '75000', '56', '12');
INSERT INTO Stadium VALUES('35', 'Allianz Arena', '2018', '75000', '50', '12');
INSERT INTO Stadium VALUES('36', 'Allianz Arena', '2017', '75000', '54', '12');
INSERT INTO Stadium VALUES('37', 'Mestalla', '2019', '39566', '42', '13');
INSERT INTO Stadium VALUES('38', 'Mestalla', '2018', '38699', '47', '13');
INSERT INTO Stadium VALUES('39', 'Mestalla', '2017', '33936', '49', '13');
INSERT INTO Stadium VALUES('40', 'Red Bull Arena', '2019', '38380', '64', '14');
INSERT INTO Stadium VALUES('41', 'Red Bull Arena', '2018', '39397', '48', '14');
INSERT INTO Stadium VALUES('42', 'Red Bull Arena', '2017', '41454', '53', '14');
INSERT INTO Stadium VALUES('43', 'BayArena', '2019', '27990', '43', '15');
INSERT INTO Stadium VALUES('44', 'BayArena', '2018', '28415', '40', '15');
INSERT INTO Stadium VALUES('45', 'BayArena', '2017', '28428', '47', '15');
INSERT INTO Stadium VALUES('46', 'Borussia-Park', '2019', '49765', '65', '16');
INSERT INTO Stadium VALUES('47', 'Borussia-Park', '2018', '50986', '62', '16');
INSERT INTO Stadium VALUES('48', 'Borussia-Park', '2017', '51494', '67', '16');
INSERT INTO Stadium VALUES('49', 'Estadio Ramon Sanchez Pizjuan', '2019', '36052', '47', '17');
INSERT INTO Stadium VALUES('50', 'Estadio Ramon Sanchez Pizjuan', '2018', '33069', '52', '17');
INSERT INTO Stadium VALUES('51', 'Estadio Ramon Sanchez Pizjuan', '2017', '32837', '57', '17');
INSERT INTO Stadium VALUES('52', 'Gewiss Stadium', '2019', '18284', '80', '18');
INSERT INTO Stadium VALUES('53', 'Gewiss Stadium', '2018', '17921', '64', '18');
INSERT INTO Stadium VALUES('54', 'Gewiss Stadium', '2017', '16946', '84', '18');
INSERT INTO Stadium VALUES('55', 'Stadio Giuseppe Meazza', '2019', '58789', '39', '19');
INSERT INTO Stadium VALUES('56', 'Stadio Giuseppe Meazza', '2018', '57529', '38', '19');
INSERT INTO Stadium VALUES('57', 'Stadio Giuseppe Meazza', '2017', '46620', '33', '19');
INSERT INTO Stadium VALUES('58', 'Stadio Diego Armando Maradona', '2019', '29000', '56', '20');
INSERT INTO Stadium VALUES('59', 'Stadio Diego Armando Maradona', '2018', '43050', '61', '20');
INSERT INTO Stadium VALUES('60', 'Stadio Diego Armando Maradona', '2017', '36605', '60', '20');

    SELECT * FROM Teams;
    SELECT * FROM Managers;
    SELECT * FROM Players;
    SELECT * FROM Stadium;
    SELECT * FROM Championship;
    SELECT * FROM Teams, Managers WHERE manager_id = id_manager;
    SELECT * FROM Teams, Managers, Players WHERE team_id = id_team AND manager_id = id_manager;
/********************************************************************************************************************************************************************
1.) Hierarhiskie vaicajumi
********************************************************************************************************************************************************************/
    SELECT player_id, player_surname, id_team
    FROM Players
    CONNECT BY NOCYCLE PRIOR player_id = PRIOR id_team;
    
    SELECT player_id, player_surname, id_team, LEVEL, CONNECT_BY_ISCYCLE AS cycle, SYS_CONNECT_BY_PATH(player_surname, '/') AS path
    FROM Players
    CONNECT BY NOCYCLE PRIOR player_id = PRIOR id_team;
    
    SELECT player_id, player_surname, id_team
    FROM Players
    START WITH id_team > 17
    CONNECT BY NOCYCLE PRIOR player_id = PRIOR id_team
    ORDER SIBLINGS BY id_team;
/********************************************************************************************************************************************************************
2.) Faktoru analizes vaicajumi vienai tabulai
********************************************************************************************************************************************************************/
    SELECT record_year, id_team, ROUND(AVG(average_low_ticket_price), 2) AS ticket_price
    FROM Stadium
    WHERE id_team BETWEEN 15 AND 20
    GROUP BY CUBE(id_team, record_year)
    ORDER BY id_team, record_year;
    
    SELECT record_year, id_team, ROUND(AVG(average_low_ticket_price), 2) AS ticket_price
    FROM Stadium
    WHERE id_team BETWEEN 15 AND 20
    GROUP BY ROLLUP(id_team, record_year)
    ORDER BY id_team, record_year;
    
    SELECT record_year, id_team, ROUND(AVG(attendance), 0) AS attendance,
    GROUPING(id_team) AS g_id,
    GROUPING(record_year) AS g_ry
    FROM Stadium
    WHERE (id_team BETWEEN 5 AND 10) AND record_year IN ('2017', '2018')
    GROUP BY CUBE(id_team, record_year)
    ORDER BY id_team, record_year;

    SELECT record_year, id_team, ROUND(AVG(attendance), 0) AS attendance,
    GROUPING(id_team) AS g_id,
    GROUPING(record_year) AS g_ry
    FROM Stadium
    WHERE id_team BETWEEN 5 AND 10
    GROUP BY CUBE(id_team, record_year)
    HAVING GROUPING(id_team) = 1 OR GROUPING(record_year) = 1
    ORDER BY id_team, record_year;
    
    SELECT record_year, id_team, ROUND(AVG(average_low_ticket_price), 2) AS ticket_price,
    GROUPING_ID(record_year, id_team) AS grouping_id,
    GROUP_ID() AS group_id
    FROM Stadium
    WHERE record_year IN('2018', '2019')
    GROUP BY GROUPING SETS(record_year, CUBE(record_year, id_team))
    ORDER BY record_year, id_team;
    
    SELECT record_year, id_team, ROUND(AVG(average_low_ticket_price), 2) AS ticket_price,
    GROUPING_ID(record_year, id_team) AS grouping_id,
    GROUP_ID() AS group_id
    FROM Stadium
    WHERE record_year IN('2018', '2019')
    GROUP BY GROUPING SETS(record_year, id_team)
    ORDER BY record_year, id_team;
/********************************************************************************************************************************************************************
3.) Vaicajumi tabulu zvaigznes shemai
********************************************************************************************************************************************************************/
    SELECT championship_id, COUNT(DISTINCT team_id) AS team_count, position, SUM(player_wage) AS wage,
    GROUPING(position) AS g_pos
    FROM Teams, Championship, Players
    WHERE championship_id = id_championship AND team_id = id_team AND championship_id IN ('1', '2')
    GROUP BY CUBE(championship_id, position)
    ORDER BY g_pos, championship_id;
    
    SELECT championship_id, team_name, position, SUM(player_wage) AS wage,
    GROUPING(position) AS g_pos
    FROM Teams, Championship, Players
    WHERE championship_id = id_championship AND team_id = id_team AND championship_id IN ('3', '4')
    GROUP BY GROUPING SETS(championship_id, team_name, position);
/********************************************************************************************************************************************************************
4.) Virtualas daudzdimensiju tabulas vaicajumi ar SQL Model klauzulas izmantosanu
********************************************************************************************************************************************************************/
    SELECT stadium, record_year, id_team, attendance 
    FROM Stadium
    MODEL PARTITION BY(stadium) DIMENSION BY(record_year, id_team)
    MEASURES(attendance)
    RULES();
    
    SELECT stadium, record_year, id_team, ROUND(attendance, 0) AS attendance
    FROM Stadium
    WHERE id_team = 2
    MODEL PARTITION BY(stadium) DIMENSION BY(record_year, id_team)
    MEASURES(attendance)
    RULES(attendance['2020', 2] = AVG(attendance)[record_year BETWEEN 2017 and 2019, 2]);
    
    SELECT stadium, record_year, id_team, attendance 
    FROM Stadium
    WHERE id_team = 2
    MODEL PARTITION BY(stadium) DIMENSION BY(record_year, id_team)
    MEASURES(attendance)
    RULES(UPDATE attendance['2019', 2] = 80000);
/********************************************************************************************************************************************************************
5.) Vaicajumi ar analizes funkciju izmantosanu
********************************************************************************************************************************************************************/
    SELECT id_team, player_name, player_surname, player_wage,
    ROUND(player_wage*100/SUM(player_wage) OVER(PARTITION BY id_team), 2) AS wage_percent,
    RANK() OVER(PARTITION BY id_team ORDER BY player_wage) AS rank,
    DENSE_RANK() OVER(PARTITION BY id_team ORDER BY player_wage) AS d_rank,
    ROW_NUMBER() OVER(PARTITION BY id_team ORDER BY player_wage) AS r_number,
    MIN(player_wage) KEEP(DENSE_RANK FIRST ORDER BY player_wage) OVER(PARTITION BY id_team) AS min_wage,
    MAX(player_wage) KEEP(DENSE_RANK LAST ORDER BY player_wage) OVER(PARTITION BY id_team) AS max_wage,
    WIDTH_BUCKET(player_wage, 80000, 600000, 5) AS width_bucket
    FROM Players
    WHERE id_team <= 5;
    
    SELECT id_team, player_name, player_surname, player_wage,
    NTILE(5) OVER(ORDER BY player_surname) AS group_num
    FROM Players
    WHERE id_team <= 5;
/********************************************************************************************************************************************************************
6.) Vaicajumi ar loga (windowing) funkciju izmantosanu
********************************************************************************************************************************************************************/
    SELECT country, team_name, manager_name, manager_surname, manager_wage,
    MAX(manager_wage) OVER (PARTITION BY country ORDER BY manager_wage DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_wage,
    SUM(manager_wage) OVER(PARTITION BY country ORDER BY manager_wage ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS sum_wage
    FROM Managers, Teams
    WHERE manager_id = id_manager AND country IN('England', 'Germany');
    
    SELECT country, team_name, player_name, player_surname, player_wage,
    FIRST_VALUE(player_wage) OVER(PARTITION BY team_name) AS f_value,
    LAST_VALUE(player_wage) OVER(PARTITION BY team_name) AS l_value
    FROM PLayers, Teams
    WHERE team_id = id_team AND country IN('Spain', 'Italy');
/********************************************************************************************************************************************************************
7.) Vaicajumi ar WITH prieksraksta izmantosanu
********************************************************************************************************************************************************************/
    SELECT 'OVERALL', SUM(wage) AS wage, ROUND(AVG(wage), 2) AS average_wage, SUM(player_count) AS players
    FROM(SELECT team_name, SUM(player_wage) AS wage, COUNT(player_id) AS player_count
          FROM Teams, Players
          WHERE team_id = id_team
          GROUP BY team_name)
    UNION ALL
    SELECT team_name, SUM(player_wage), ROUND(AVG(player_wage), 2), COUNT(player_id)
    FROM Teams, Players
    WHERE team_id = id_team
    GROUP BY team_name
    ORDER BY wage DESC;
    
    WITH english_managers AS(SELECT manager_name, manager_surname, manager_nationality, manager_wage, team_name, country
                             FROM Managers, Teams
                             WHERE manager_id = id_manager AND (manager_nationality = 'German' OR country = 'Germany')
                             ORDER BY manager_surname ASC)
    SELECT * FROM english_managers;
/********************************************************************************************************************************************************************
8.) Rekursivie vaicajumi ar WITH prieksraksta izmantosanu
********************************************************************************************************************************************************************/
    WITH
        Avg_ticket_price AS
        (SELECT stadium, ROUND(AVG(average_low_ticket_price), 2) AS ticket_price
        FROM Stadium
        GROUP BY stadium),
    
        Avg_attendance AS
        (SELECT stadium, ROUND(AVG(attendance), 0) AS stadium_attendance
        FROM Stadium
        GROUP BY stadium)

    SELECT P.stadium, P.ticket_price, A.stadium_attendance
    FROM Avg_ticket_price P, Avg_attendance A
    WHERE P.stadium = A.stadium;
  
  WITH 
      TC(team_id, team_name, id_championship) AS (
      SELECT team_id, team_name, id_championship
      FROM Teams
      WHERE team_id = 1
      UNION ALL
      SELECT TC1.team_id, TC1.team_name, TC1.id_championship
      FROM Teams TC1, TC
      WHERE TC1.id_championship = TC.team_id
    )

    SEARCH DEPTH FIRST BY team_id SET depth_set
    CYCLE team_id SET cycle_set TO 1 DEFAULT 0
    SELECT team_id, team_name, id_championship, cycle_set
    FROM TC
    ORDER BY depth_set;

  WITH 
      TC(team_id, team_name, id_championship) AS (
      SELECT team_id, team_name, id_championship
      FROM Teams
      WHERE team_id = 1
      UNION ALL
      SELECT TC1.team_id, TC1.team_name, TC1.id_championship
      FROM Teams TC1, TC
      WHERE TC1.id_championship = TC.team_id
    )

    SEARCH BREADTH FIRST BY team_id SET breadth_set
    CYCLE team_id SET cycle_set TO 1 DEFAULT 0
    SELECT team_id, team_name, id_championship, cycle_set
    FROM TC
    ORDER BY breadth_set;

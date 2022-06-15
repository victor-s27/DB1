DROP TABLE Teams;
DROP TABLE Teams_upd;

CREATE TABLE Teams(
    team_id                     number          NOT NULL,
    team_name                   varchar2(35)    NOT NULL    UNIQUE,
    hometown                    varchar2(30),
    country                     varchar2(30),
    stadium                     varchar2(40)    NOT NULL,
    capacity                    number(6)       CHECK(capacity >= 0),
    foundation_year             number(4) CHECK (foundation_year > 0 and foundation_year <= 2021),
    changed_value               varchar2(20),           
    CONSTRAINT teams_pk PRIMARY KEY(team_id)
);

CREATE TABLE Teams_upd(
    team_id                     number          NOT NULL,
    team_name                   varchar2(35)    NOT NULL    UNIQUE,
    hometown                    varchar2(30),
    country                     varchar2(30),
    stadium                     varchar2(40)    NOT NULL,
    capacity                    number(6)       CHECK(capacity >= 0),
    foundation_year             number(4) CHECK (foundation_year > 0 and foundation_year <= 2021),
    changed_value               varchar2(20)        
);

INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(1, 'Manchester United', 'Manchester', 'England', 'Old Trafford', 76000, 1878);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(2, 'FC Barcelona', 'Barcelona', 'Spain', 'Camp Nou', 99354, 1899);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(3, 'Manchester City', 'Manchester', 'England', 'Etihad Stadium', 55097, 1880);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(4, 'AC Milan', 'Milano', 'Italy', 'San Siro', 80018, 1899);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(5, 'Real Madrid', 'Madrid', 'Spain', 'Estadio Santiago Bernabeu', 81044, 1902);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(6, 'FC Bayern Munich', 'Munich', 'Germany', 'Allianz Arena', 75000, 1900);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(7, 'Internazionale', 'Milano', 'Italy', 'Stadio Giuseppe Meazza', 80018, 1908);

SELECT * FROM Teams;
/********************************************************************************************************************************************************************
Kursors
********************************************************************************************************************************************************************/ 
DECLARE
CURSOR cursor_team_name IS
SELECT team_name, country
FROM Teams
WHERE foundation_year <= 1900;
TYPE type_1 IS VARRAY(7) OF cursor_team_name%rowtype;
name_type type_1 := type_1();
i NUMBER DEFAULT 1;
BEGIN
    FOR r IN cursor_team_name LOOP
    name_type.extend;
    name_type(i) := r;
    DBMS_OUTPUT.PUT_LINE(name_type(i).team_name || ' ' || name_type(i).country);
    i := i + 1;
    END LOOP;
END;
/********************************************************************************************************************************************************************
Insert tipa trigeris
********************************************************************************************************************************************************************/
CREATE OR REPLACE TRIGGER insert_record
BEFORE INSERT ON Teams FOR EACH ROW
WHEN(new.team_id > 0)
BEGIN
    IF :new.capacity = 1 THEN
    :new.capacity := DBMS_RANDOM.VALUE(10000, 50000);
    :new.changed_value := 1;
    ELSIF :new.capacity = 2 THEN
    :new.capacity := DBMS_RANDOM.VALUE(50000, 100000);
    :new.changed_value := 2;
    ELSE :new.capacity := DBMS_RANDOM.VALUE(10000, 100000);
    :new.changed_value := 3;
    END IF;
END;
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(8, 'Liverpool FC', 'Liverpool', 'England', 'Anfield', 1, 1882);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(9, 'Bayer 04 Leverkusen', 'Leverkusen', 'Germany', 'BayArena', 2, 1904);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(10, 'Atletico de Madrid', 'Madrid', 'Spain', 'Wanda Metropolitano', 3, 1903);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(11, 'Juventus', 'Turin', 'Italy', 'Allianz Stadium', DBMS_RANDOM.VALUE(1, 2), 1897);

SELECT * FROM Teams;
/********************************************************************************************************************************************************************
Update tipa trigeris
********************************************************************************************************************************************************************/
CREATE OR REPLACE TRIGGER update_table
AFTER UPDATE ON Teams
FOR EACH ROW
BEGIN
    INSERT INTO Teams_upd VALUES(:new.team_id, :new.team_name, :new.hometown, :new.country, :new.stadium, :new.capacity, :new.foundation_year, 'Random value');
END;   

UPDATE Teams SET capacity = DBMS_RANDOM.VALUE(10000, 20000) WHERE team_id = 8;
UPDATE Teams SET capacity = DBMS_RANDOM.VALUE(20000, 30000) WHERE team_id = 9;
UPDATE Teams SET capacity = DBMS_RANDOM.VALUE(30000, 40000) WHERE team_id = 10;
UPDATE Teams SET capacity = DBMS_RANDOM.VALUE(40000, 50000) WHERE team_id = 11;

SELECT * FROM Teams;
SELECT * FROM Teams_upd;
/********************************************************************************************************************************************************************
Function example
********************************************************************************************************************************************************************/
CREATE OR REPLACE FUNCTION man_utd_name
RETURN VARCHAR IS
tn VARCHAR(35);
    BEGIN
        SELECT team_name INTO tn
        FROM Teams
        WHERE team_id = 1;
        RETURN tn;
    END;
/ 
CREATE OR REPLACE FUNCTION man_utd_hometown
RETURN VARCHAR IS
ht VARCHAR(30);
    BEGIN
        SELECT hometown INTO ht
        FROM Teams
        WHERE team_id = 1;
        RETURN ht;
    END;
/
CREATE OR REPLACE FUNCTION man_utd_country
RETURN VARCHAR IS
ct VARCHAR(30);
    BEGIN
        SELECT country INTO ct
        FROM Teams
        WHERE team_id = 1;
        RETURN ct;
    END;
/
CREATE OR REPLACE FUNCTION man_utd_stadium
RETURN VARCHAR IS
st VARCHAR(40);
    BEGIN
        SELECT stadium INTO st
        FROM Teams
        WHERE team_id = 1;
        RETURN st;
    END;
/   
CREATE OR REPLACE FUNCTION man_utd_capacity
RETURN NUMBER IS
cp NUMBER;
    BEGIN
        SELECT capacity INTO cp
        FROM Teams
        WHERE team_id = 1;
        RETURN cp;
    END;
/   
DECLARE
    n VARCHAR(35);
    h VARCHAR(30);
    c VARCHAR(30);
    s VARCHAR(40);
    cp NUMBER;
    BEGIN
        n := man_utd_name();
        h := man_utd_hometown();
        c := man_utd_country();
        s := man_utd_stadium();
        cp := man_utd_capacity();
        DBMS_OUTPUT.PUT_LINE(n || ' is a team based in ' || h || ', ' || c || '. ');
        DBMS_OUTPUT.PUT_LINE(n || ' plays at the stadium called ' || s || '. Its total capacity is estimated at ' || cp || '. ');
    END;
/ 
/********************************************************************************************************************************************************************
WITH for two functions
********************************************************************************************************************************************************************/
WITH
    FUNCTION max_capacity RETURN NUMBER IS
    maxc NUMBER;
    BEGIN
        SELECT MAX(capacity) INTO maxc
        FROM Teams
        WHERE country IN ('England', 'Germany');
        RETURN maxc;
    END;
    
    FUNCTION min_capacity RETURN NUMBER IS
    minc NUMBER;
    BEGIN
        SELECT MIN(capacity) INTO minc 
        FROM Teams
        WHERE country IN ('England', 'Germany');
        RETURN minc ;
    END;
    
    FUNCTION english_and_german_teams RETURN NUMBER IS
    gt NUMBER;
    BEGIN
        SELECT COUNT(team_id) INTO gt
        FROM Teams
        WHERE country IN ('England', 'Germany');
        RETURN gt;
    END;
    
SELECT max_capacity(), min_capacity(), english_and_german_teams()
FROM DUAL;
/********************************************************************************************************************************************************************
WITH function and procedure
********************************************************************************************************************************************************************/
DROP TABLE Teams;
CREATE TABLE Teams(
    team_id                     number          NOT NULL,
    team_name                   varchar2(35)    NOT NULL    UNIQUE,
    hometown                    varchar2(30),
    country                     varchar2(30),
    stadium                     varchar2(40)    NOT NULL,
    capacity                    number(6)       CHECK(capacity >= 0),
    foundation_year             number(4) CHECK (foundation_year > 0 and foundation_year <= 2021),
    changed_value               varchar2(20),           
    CONSTRAINT teams_pk PRIMARY KEY(team_id)
);

INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(1, 'Manchester United', 'Manchester', 'England', 'Old Trafford', 76000, 1878);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(2, 'FC Barcelona', 'Barcelona', 'Spain', 'Camp Nou', 99354, 1899);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(3, 'Manchester City', 'Manchester', 'England', 'Etihad Stadium', 55097, 1880);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(4, 'AC Milan', 'Milano', 'Italy', 'San Siro', 80018, 1899);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(5, 'Real Madrid', 'Madrid', 'Spain', 'Estadio Santiago Bernabeu', 81044, 1902);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(6, 'FC Bayern Munich', 'Munich', 'Germany', 'Allianz Arena', 75000, 1900);
INSERT INTO Teams(team_id, team_name, hometown, country, stadium, capacity, foundation_year) VALUES(7, 'Internazionale', 'Milano', 'Italy', 'Stadio Giuseppe Meazza', 80018, 1908);

WITH
    PROCEDURE procedure_capacity(n IN NUMBER, cp OUT NUMBER) IS
    BEGIN
        SELECT capacity INTO cp
        FROM Teams 
        WHERE team_id = n; 
        DBMS_OUTPUT.put_line('Team with id ' || n || ' plays at the stadium with capacity of ' || cp || '. (Output of procedure)');  
    END;

    FUNCTION function_capacity(n IN NUMBER) RETURN NUMBER IS
    c	NUMBER;
    BEGIN
        procedure_capacity(n, c);
               DBMS_OUTPUT.put_line('Team with id ' || n || ' plays at the stadium with capacity of ' || c || '. (Output of function)');  
        RETURN c;
    END;

SELECT function_capacity(1)
FROM   DUAL;
/********************************************************************************************************************************************************************
Dynamic PL/SQL - DBMS SQL
********************************************************************************************************************************************************************/
DECLARE
    cursor_id   INTEGER;
    i       	INTEGER;
    s_name		VARCHAR2(40);
    st_select   VARCHAR2(100);    
    
    BEGIN
        cursor_id := DBMS_SQL.OPEN_CURSOR;
        st_select := 'SELECT stadium from Teams_upd';
        DBMS_SQL.PARSE(cursor_id, st_select, DBMS_SQL.NATIVE);
        DBMS_SQL.DEFINE_COLUMN(cursor_id, 1, s_name, 40);
        i := DBMS_SQL.EXECUTE(cursor_id);
        LOOP
        IF DBMS_SQL.FETCH_ROWS(cursor_id) = 0 THEN EXIT;
        END IF;
        DBMS_SQL.COLUMN_VALUE(cursor_id, 1, s_name);
        DBMS_OUTPUT.PUT_LINE(s_name);
        END LOOP;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_SQL.CLOSE_CURSOR(cursor_id);
    END;
/********************************************************************************************************************************************************************
Dynamic PL/SQL - DBMS SQL
********************************************************************************************************************************************************************/
CREATE OR REPLACE PROCEDURE delete_rows(n IN NUMBER) AS
    cursor_id   INTEGER;
    i           INTEGER;
    BEGIN
        cursor_id := DBMS_SQL.OPEN_CURSOR;
        DBMS_SQL.PARSE(cursor_id, 'DELETE FROM Teams_upd WHERE capacity < :x', DBMS_SQL.NATIVE);
        DBMS_SQL.BIND_VARIABLE(cursor_id, ':x', n);
        DBMS_OUTPUT.PUT_LINE(DBMS_SQL.EXECUTE(cursor_id));
        DBMS_SQL.CLOSE_CURSOR(cursor_id);
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_SQL.CLOSE_CURSOR(cursor_id);
    END;

    BEGIN
        delete_rows(20000);
    END;
    
SELECT * FROM Teams_upd;
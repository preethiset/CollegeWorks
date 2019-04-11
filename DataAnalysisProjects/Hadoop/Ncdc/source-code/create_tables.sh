# /bin/bash/
#mysql connection
dbstring="mysql -uroot -pready2go -Dpsr_ncdc -h127.0.0.1 -A"


echo "CREATE TABLE 1950_psr(id int(11) NOT NULL auto_increment, USAF int(11) NOT NULL , WBAN int(11) NOT NULL ,
obs_da_dt varchar(20) NOT NULL, lati int(6) not null, longi int(7) not null, elev int(5) NOT NULL,win_dir int(4) NOT NULL, qc_wind_dir varchar(1) NOT NULL,
sky int(5) not null, qc_sky varchar(1) not null, visib int(6) not null, qc_visib varchar(1) not null, air_temp int(5) NOT NULL ,
qc_air_temp int(1) NOT NULL, dew_temp int(5) NOT NULL, qc_dew_temp varchar(1) not null, atm_press int(5) not null,
qc_atm_press varchar(1) not null, primary key (id))" > table.sql

$dbstring  < table.sql


echo "CREATE TABLE 1986_psr(id int(11) NOT NULL auto_increment, tempid int(4) NOT NULL , USAF varchar(6) NOT NULL , WBAN varchar(5) NOT NULL ,
obs_date varchar(16) NOT NULL, obs_time varchar(4) NOT NULL, lati int(6) not null, longi int(7) not null, elev int(5) NOT NULL,win_dir int(4) NOT NULL, qc_wind_dir varchar(1) NOT NULL,
sky int(5) not null, qc_sky varchar(1) not null, visib int(6) not null, qc_visib varchar(1) not null, air_temp int(5) NOT NULL ,
qc_air_temp varchar(1) NOT NULL, dew_temp int(5) NOT NULL, qc_dew_temp varchar(1) not null, atm_press int(5) not null,
qc_atm_press varchar(1)not null, primary key (id))" > table.sql

$dbstring  < table.sql
#Exit Connection
exit

import pymysql
#python 2.7.2 wouldn't let accomplish parser() open(filename..) as input therefore using pymysql rather than using import mysqldb
import datetime
import sys
#note to self: sys is a special module to pass command line args
import os
#passing file name as args. note to self:that sys.arg[0] is the file itself
filename = sys.argv[1]
#passing table name as args
tablename = sys.argv[2]
#Exception Handling
print (filename)
if (os.path.isfile(filename) == False):
    print ('\n' +filename+ ' File does not exist')
    sys.exit()
else:
    print ('\n File exists')
#Establishing MySQl Connection Settings
databasename = 'ncdc_psr'
host = 'localhost'
user = 'root'
password = 'ready2go'
#Connecting to database
conn = pymysql.connect(host,user,password,databasename)
cursor = conn.cursor()
print ("Opened database successfully");
#data being parsed from text input

def parser():

    with open(filename, 'r', encoding='latin_1') as input:

            for line in input:

                #parsing variables according to ncdc schema

                global usaf, wban,obs_da_dt, lati,longi , elev ,win_dir , qc_wind_dir ,sky , qc_sky , visib , qc_visib , air_temp ,qc_air_temp , dew_temp , qc_dew_temp , atm_press , qc_atm_press

                usaf = line[4:10]

                wban = line[10:15]

                obs_da_dt = line[15:27]

                dt = datetime.datetime.strptime(obs_da_dt,"%Y%m%d%H%M")

                dt = dt.strftime('%Y-%m-%d-%H-%M')

                lati = line[28:34]

                longi = line[34:41]

                elev = line[46:51]

                win_dir = line[61:64]

                qc_wind_dir = line[64:65]

                sky = line[72:76]

                qc_sky = line[76:77]

                visib= line[78:83]

                qc_visib = line[83:84]

                air_temp = line[87:92]

                qc_air_temp = line[92:93]

                dew_temp = line[93:98]

                qc_dew_temp = line[98:99]

                atm_press = line[99:104]

                qc_atm_press = line[104:105]

                #calling insert function

                insert()

            #closing input fn

            input.close()

#Inserting into tables

def insert():

    if (tablename == '1950_psr'):

        cursor.execute("INSERT INTO 1950_psr (usaf,wban,obs_da_dt,lati,longi,elev,win_dir,qc_wind_dir, sky,qc_sky,visib,qc_visib,air_temp,qc_air_temp,dew_temp,qc_dew_temp,atm_press,qc_atm_press)VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(USAF,WBAN,obs_da_dt,lati,longi,elev,win_dir,qc_wind_dir, sky,qc_sky,visib,qc_visib,air_temp,qc_air_temp,dew_temp,qc_dew_temp,atm_press,qc_atm_press))


    elif (tablename == '1986_psr'):

        cursor.execute("INSERT INTO 1986_psr (usaf,wban,obs_da_dt,lati,longi,elev,win_dir,qc_wind_dir, sky,qc_sky,visib,qc_visib,air_temp,qc_air_temp,dew_temp,qc_dew_temp,atm_press,qc_atm_press)VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(USAF,WBAN,obs_da_dt,lati,longi,elev,win_dir,qc_wind_dir, sky,qc_sky,visib,qc_visib,air_temp,qc_air_temp,dew_temp,qc_dew_temp,atm_press,qc_atm_press))

parser()

#Saving & closing

conn.commit()

    conn.close()

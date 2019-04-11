import pymysql

#Establishing MySQl Connection Settings
databasename = 'psr_ncdc'
host = 'localhost'
user = 'root'
password = 'ready2go'
conn = pymysql.connect(host,user,password,databasename)
cursor = conn.cursor()
print ("Opened database successfully");
#sql statements
sql = "SELECT year(dt) AS YEAR, max(air_temp) AS MAX_TEMP from 1950_psr WHERE air_temp != 9999 GROUP BY year(dt)"
sql1 = "SELECT year(dt) AS YEAR, max(air_temp) AS MAX_TEMP from 1986_psr WHERE air_temp != 9999 GROUP BY year(dt)"
#list for storing sql queries
list = [sql,sql1]

#select fn
def select():
    for l in list:
        #calling cursor to execute
        cursor.execute(l)
        max = cursor.fetchall()
        print(max[0])
        print(max[1])

select()

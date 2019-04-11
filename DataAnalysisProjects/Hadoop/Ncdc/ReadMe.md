## Week-05
#Phase1

*1950.txt*
![1950.text output](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/1950txt-output.JPG)
--------------------------------------------------------
*1986.txt*
![1986.text output](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/1986txt-output.JPG)
---------------------------------------------------------
#Phase2

*5086.txt*
![5086.text output](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/5086-output.JPG)
------------------------------------------------------------
#### Phase3
*1.MySQL already installed. Tried again using the script below (placed in the folder source-code) *
## mysql-install.sh

#### command: sh mysql-install.sh

*2.Created database as ncdc_psr using the script below (placed in the folder source-code)*
## creatdb.sh

*database*
![psr_ncdc](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/database_created.JPG)

#### command: createdb.sh

*2.Created tables for housing 1950 & 1986 data using the script below (placed in the folder source-code)*

## create_tables.sh

#### command: sh create_tables.sh
#####P.S the scripts doesn't give any messages like 'tables created'. but does its work.tried adding echo messages.was not fruitful.

*mysql-1950-table-schema*

![1950.text table shema](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/desc1950.JPG)

*Parsed the table 1950_psr using the script below (placed in the folder souce-code)*

##parser.py
##### command: python3 parser.py 1950.txt(filename) 1950_psr(tablename)

*1950-loaded*

![1950 loaded](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/1950_loaded.JPG)

*mysql-1986-table-schema*

![1986.text table schema](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/desc1986.JPG)


*1986-loaded*

![1986 loaded](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/1986_loaded.JPG)

4*Found the maximum temparature of two tables (1950_psr and 1986_psr using the below script*
##Maxtemp_50_86.py
#### command: python3 Maxtemp_50_86.py

*maxtemp-output*

![Maximum of 1950 1986](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/maxtemp-output.JPG)

*5.Created the 3rd table 5086 to house the combined data of 1950_psr and 1986_psr

##create_tables.sh
####command: sh create_tables.sh


![5086.text table schema](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/desc5086.JPG)

*loaded the table by parser script below*
##parser.py 
#### command : python3 parser.py 5086.txt 5086_psr

*5086-loaded*

![5086 loaded](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/5086_loaded.JPG)

*found the maximum temp of 5086_psr using below script*
##Maxtemp_5086.py
####command: python3 Maxtemp_5086.py

*maxtemp-5086output*

![Maximum of 5086](https://github.com/illinoistech-itm/psethuragunathan/blob/master/itmd-521/images/maxtemp-5086output.JPG)


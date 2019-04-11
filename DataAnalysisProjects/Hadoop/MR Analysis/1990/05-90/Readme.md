## source *1990.txt* from /user/controller/ncdc/1990/1990.txt

## Experiment 5 - Number of Reducers 1, Intermediate Compression Snappy Codec on, Combiner off

## File Name -MaxTempRed1Snappy.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red1snappyon.jar MaxTempRed1Snappy.class

## mr Job Run

### hadoop jar maxtemp-red1snappyon.jar MaxTempRed1Snappy /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/8

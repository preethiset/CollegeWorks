


## source *1990.txt*

## Experiment 1 - Number of Reducers 2, Intermediate Compression off, Combiner off

## File Name -MaxTempReducer2.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red2.jar MaxTempReducer2.class

## mr Job Run

### hadoop jar maxtemp-red1.jar MaxTempReducer2 /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/3

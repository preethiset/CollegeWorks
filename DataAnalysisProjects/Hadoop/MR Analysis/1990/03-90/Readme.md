## Source *1990.txt*

## Experiment 3 - Number of Reducers 4, Intermediate Compression off, Combiner off

## File Name -MaxTempReducer4.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red4.jar MaxTempReducer4.class

## mr Job Run

### hadoop jar maxtemp-red4.jar MaxTempReducer4 /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/4

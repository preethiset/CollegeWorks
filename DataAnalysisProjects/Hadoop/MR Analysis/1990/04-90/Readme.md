## Source *1990.txt*

## Experiment 4 - Number of Reducers 8, Intermediate Compression off, Combiner off

## File Name -MaxTempReducer8.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red8.jar MaxTempReducer8.class

## mr Job Run

### hadoop jar maxtemp-red8.jar MaxTempReducer8 /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/7

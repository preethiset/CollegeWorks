## Job1

## source *1990.txt*

## Experiment 1 - Number of Reducers 1, Intermediate Compression off, Combiner off

## File Name -MaxTempReducer.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTempReducer*.java

## Instructions to Jar file

### jar cf maxtemp-red1.jar MaxTempReducer*.class

## mr Job Run 

### hadoop jar maxtemp-red1.jar MaxTempReducer /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/2

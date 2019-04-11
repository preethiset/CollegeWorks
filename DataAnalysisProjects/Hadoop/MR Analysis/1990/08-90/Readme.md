## Source /user/controller/ncdc/1990/1990.txt*

## Experiment 8 - Number of Reducers 8, Intermediate Compression Snappy Codec on, Combiner off

## File Name -MaxTempRed8Snappy.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red8snappyon.jar MaxTempRed8Snappy.class

## mr Job Run

### hadoop jar maxtemp-red8snappyon.jar MaxTempRed8Snappy /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/11

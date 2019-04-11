
## Source /user/controller/ncdc/1990/1990.txt* 

## Experiment 7 - Number of Reducers 4, Intermediate Compression Snappy Codec on, Combiner off

## File Name -MaxTempRed4Snappy.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red4snappyon.jar MaxTempRed4Snappy.class

## mr Job Run

### hadoop jar maxtemp-red4snappyon.jar MaxTempRed4Snappy /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/10

## Source /user/controller/ncdc/1990/1990.txt*

## Experiment 13 - Number of Reducers 1, Intermediate Compression Gzip Codec on, Combiner off

## File Name -MaxTempRed1Gzip.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red1GzipOn.jar MaxTempRed1Gzip.class

## mr Job Run

### hadoop jar maxtemp-red1GzipOn.jar MaxTempRed1Gzip /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/17

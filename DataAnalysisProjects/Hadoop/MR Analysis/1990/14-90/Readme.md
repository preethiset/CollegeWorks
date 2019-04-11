## Source /user/controller/ncdc/1990/1990.txt*

## Experiment 14 - Number of Reducers 2, Intermediate Compression Gzip Codec on, Combiner off

## File Name -MaxTempRed2Gzip.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red2GzipOn.jar MaxTempRed2Gzip.class

## mr Job Run

### hadoop jar maxtemp-red2GzipOn.jar MaxTempRed2Gzip /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/18

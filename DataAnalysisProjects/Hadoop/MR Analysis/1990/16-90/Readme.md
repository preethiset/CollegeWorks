## Source /user/controller/ncdc/1990/1990.txt*

## Experiment 16 - Number of Reducers 8, Intermediate Compression Gzip Codec on, Combiner off

## File Name -MaxTempRed8Gzip.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red8GzipOn.jar MaxTempRed8Gzip.class

## mr Job Run

### hadoop jar maxtemp-red8GzipOn.jar MaxTempRed8Gzip /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/20

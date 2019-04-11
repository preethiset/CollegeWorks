## Source /user/controller/ncdc/1990/1990.txt*

## Experiment 17 - Number of Reducers 1, Intermediate Compression Gzip Codec on, Combiner on

## File Name -MaxTempRed1GzipComb.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red1GzipCombOn.jar MaxTempRed1GzipComb.class

## mr Job Run

### hadoop jar maxtemp-red1GzipCombOn.jar MaxTempRed1GzipComb /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/21

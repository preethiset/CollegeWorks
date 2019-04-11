### Source /user/controller/ncdc/1980/1980.txt*

## Experiment 17 - Number of Reducers 1, Intermediate Compression on- Gzip Codec, Combiner on

## File Name -MaxTempRed1GzipComb80.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red1gzip_comb80.jar MaxTempRed1GzipComb80.class

## mr Job Run

### hadoop jar maxtemp-red1gzip_comb80.jar MaxTempRed1GzipComb80 /user/controller/ncdc/1980/1980.txt /output/psr/ncdc/1980/24

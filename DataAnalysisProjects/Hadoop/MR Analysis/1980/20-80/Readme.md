### Source /user/controller/ncdc/1980/1980.txt*

## Experiment 20 - Number of Reducers 8, Intermediate Compression on- Gzip Codec, Combiner on

## File Name -MaxTempRed8GzipComb80.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red8gzip_comb80.jar MaxTempRed8GzipComb80.class

## mr Job Run

### hadoop jar maxtemp-red8gzip_comb80.jar MaxTempRed8GzipComb80 /user/controller/ncdc/1980/1980.txt /output/psr/ncdc/1980/27

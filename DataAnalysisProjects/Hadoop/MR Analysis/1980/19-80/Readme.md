### Source /user/controller/ncdc/1980/1980.txt*

## Experiment 19 - Number of Reducers 4, Intermediate Compression on- Gzip Codec, Combiner on

## File Name -MaxTempRed4GzipComb80.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red4gzip_comb80.jar MaxTempRed4GzipComb80.class

## mr Job Run

### hadoop jar maxtemp-red4gzip_comb80.jar MaxTempRed4GzipComb80 /user/controller/ncdc/1980/1980.txt /output/psr/ncdc/1980/26

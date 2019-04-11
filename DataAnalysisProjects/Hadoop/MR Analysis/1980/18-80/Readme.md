### Source /user/controller/ncdc/1980/1980.txt*

## Experiment 18 - Number of Reducers 2, Intermediate Compression on- Gzip Codec, Combiner on

## File Name -MaxTempRed2GzipComb80.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red2gzip_comb80.jar MaxTempRed2GzipComb80.class

## mr Job Run

### hadoop jar maxtemp-red2gzip_comb80.jar MaxTempRed2GzipComb80 /user/controller/ncdc/1980/1980.txt /output/psr/ncdc/1980/25

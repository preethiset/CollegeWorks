### Source /user/controller/ncdc/1980/1980.txt*

## Experiment 16 - Number of Reducers 8, Intermediate Compression on- Gzip Codec, Combiner off

## File Name -MaxTempRed8Gzip80.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red8gzip80.jar MaxTempRed8Gzip80.class

## mr Job Run

### hadoop jar maxtemp-red8gzip80.jar MaxTempRed8Gzip80 /user/controller/ncdc/1980/1980.txt /output/psr/ncdc/1980/23

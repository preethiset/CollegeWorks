## Source /user/controller/ncdc/1990/1990.txt*

## Experiment 11 - Number of Reducers 4, Intermediate Compression Snappy Codec on, Combiner on

## File Name -MaxTempRed4SnapComb.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red4snapcomb.jar MaxTempRed4SnapComb.class

## mr Job Run

### hadoop jar maxtemp-red4snapcomb.jar MaxTempRed4SnapComb /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/15

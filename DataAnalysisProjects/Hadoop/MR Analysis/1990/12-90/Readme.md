## Source /user/controller/ncdc/1990/1990.txt*

## Experiment 12 - Number of Reducers 8, Intermediate Compression Snappy Codec on, Combiner on

## File Name -MaxTempRed8SnapComb.java

## Instructions to compile

### hadoop.com.sun.tools.javac.Main MaxTemp*.java

## Instructions to Jar file

### jar cf maxtemp-red8snapcomb.jar MaxTempRed8SnapComb.class

## mr Job Run

### hadoop jar maxtemp-red8snapcomb.jar MaxTempRed8SnapComb /user/controller/ncdc/1990/1990.txt /output/psr/ncdc/1990/16

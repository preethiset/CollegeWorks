// cc MaxTemperature Application to find the maximum temperature in the weather dataset
// vv MaxTemperature
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.compress.CompressionCodec;

import org.apache.hadoop.io.compress.SnappyCodec;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class MaxTempRed1Snappy {

  public static void main(String[] args) throws Exception {
    if (args.length != 2) {
      System.err.println("Usage: MaxTemperature <input path> <output path>");
      System.exit(-1);
    }

    //turning compressioncodec Snappy on
       Configuration conf = new Configuration();
       conf.setBoolean("Job.map.output.compress", true);
       conf.setClass("Job.map.output.compress.codec",
		    SnappyCodec.class, CompressionCodec.class);

    Job job = new Job(conf);
    job.setJarByClass(MaxTempRed1Snappy.class);
    job.setNumReduceTasks(1);
    job.setJobName("psr_90_red1_snappyon_cmb0");

    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    
    job.setMapperClass(MaxTemperatureMapper.class);
    job.setReducerClass(MaxTemperatureReducer.class);

    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
  
}
// ^^ MaxTemperature

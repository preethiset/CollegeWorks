// cc MaxTemperatureWithCombiner Application to find the maximum temperature, using a combiner function for efficiency
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.compress.CompressionCodec;
import org.apache.hadoop.io.compress.GzipCodec;
//import org.apache.hadoop.io.compress.SnappyCodec;
//import org.apache.hadoop.util.Tool;
//import org.apache.hadoop.util.ToolRunner;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

// vv MaxTemperatureWithCombiner
public class MaxTempRed4GzipComb {

  public static void main(String[] args) throws Exception {
    if (args.length != 2) {
      System.err.println("Usage: MaxTemperatureWithCombiner <input path> " +
          "<output path>");
      System.exit(-1);
    }
    	Configuration conf = new Configuration();
        conf.setBoolean("Job.map.output.compress", true);
	conf.setClass("Job.map.output.compress.codec",
			GzipCodec.class, CompressionCodec.class);


    Job job = new Job(conf);
    job.setJarByClass(MaxTempRed4GzipComb.class);
    job.setNumReduceTasks(4);
    job.setJobName("psr_90_red4Gzip_CombOn");

    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    
    job.setMapperClass(MaxTemperatureMapper.class);
    job.setCombinerClass(MaxTemperatureReducer.class);
    job.setReducerClass(MaxTemperatureReducer.class);

    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  
  }
}
// ^^ MaxTemperatureWithCombiner

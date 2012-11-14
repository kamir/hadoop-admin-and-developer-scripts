/*
 * 
 */
package tutorial.io;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

/**
 *
 * @author kamir
 */
public class SimpleSequenceFileLoader {
   
    public static void main() throws IOException { 
        
        String baseIn = "/home/kamir/data";
        
        Configuration config = new Configuration();
        FileSystem fs = FileSystem.get(config);
        
        String file = "in.dat";

        Path path = new Path( baseIn + "/" + file );
        
//        
//        List<NamedVector> vector = new LinkedList<NamedVector>();
//    NamedVector v1;
//    v1 = new NamedVector(new DenseVector(new double[] {0.1, 0.2, 0.5}), "Item number one");
//    vector.add(v1);
//
//
//
//    //write a SequenceFile form a Vector
//    SequenceFile.Writer writer = new SequenceFile.Writer(fs, config, path, Text.class, VectorWritable.class);
//    VectorWritable vec = new VectorWritable();
//    for(NamedVector v:vector){
//        vec.set(v);
//        writer.append(new Text(v.getName()), v);
//    }
//    writer.close();
        
    }
    
}

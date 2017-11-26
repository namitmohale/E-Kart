
package dal;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import opennlp.tools.cmdline.postag.POSModelLoader;
import opennlp.tools.postag.POSModel;
import opennlp.tools.postag.POSTaggerME;
import opennlp.tools.tokenize.WhitespaceTokenizer;
import opennlp.tools.util.ObjectStream;
import opennlp.tools.util.PlainTextByLineStream;

public class NPLAlgo {

    public List<String> GetAdjPhrases(String commentsTxtmsg) throws IOException {
        List<String> adjPhrases = new ArrayList<String>();
        POSModel model = new POSModelLoader().load(new File("en-pos-maxent.bin"));
        POSTaggerME tagger = new POSTaggerME(model);
        if (commentsTxtmsg.trim().length() == 0) {
            commentsTxtmsg = "This is not  a product. she is most slim girl. that is fantastic movies.";
        }
        ObjectStream<String> lineStream = new PlainTextByLineStream(
                new StringReader(commentsTxtmsg));
        String line;
        while ((line = lineStream.read()) != null) {
            String whitespaceTokenizerLine[] = WhitespaceTokenizer.INSTANCE.tokenize(line);
            String[] tags = tagger.tag(whitespaceTokenizerLine);
             System.out.println("------------------In Comment We Found Adj---------------");
            for (int currentTag = 0; currentTag < tags.length; currentTag++) {
           // System.out.println(whitespaceTokenizerLine[currentTag].toString()+"-->"+tags[currentTag].toString().toUpperCase());
             //|| (tags[currentTag].toUpperCase() == null ? "RB" == null : tags[currentTag].toUpperCase().equals("RB"))|| (tags[currentTag].toUpperCase() == null ? "RB" == null : tags[currentTag].toUpperCase().equals("RB"))
                if ((tags[currentTag].toUpperCase() == null ? "JJ" == null : tags[currentTag].toUpperCase().equals("JJ")) || (tags[currentTag].toUpperCase() == null ? "JJR" == null : tags[currentTag].toUpperCase().equals("JJR")) ) {
                    adjPhrases.add(whitespaceTokenizerLine[currentTag].toString());
                   
                    System.out.println(whitespaceTokenizerLine[currentTag].toString()+"-->"+tags[currentTag].toString().toUpperCase());
                }
            }
            System.out.println("--------------------------------------------------------------------");
        }
        //this return the list of adjective word
        return adjPhrases;
    }

    public static void main(String[] asrg) throws IOException {
        NPLAlgo objnlp = new NPLAlgo();
        objnlp.GetAdjPhrases("");

    }
}

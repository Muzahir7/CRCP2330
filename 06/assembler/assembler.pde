import java.util.*;


//variables to contain .asm and .hack strings
  String asmCode[]; //array for loading in the asm code
  String binCode[]; // array for dumping in the bin code
  String filename = "";  //put the . asm file absolute path in between the quotes
  

//dictionaries to hold hack bit commands  of jump, dest, comp, and symbols
Dictionary jumpDict = new Hashtable();
Dictionary destDict = new Hashtable();
Dictionary compDict = new Hashtable();
Dictionary symbolsDict = new Hashtable();
 

void setup() {
  
//putting the key-value pair in jumpDict
//jumpDict.put("Apple", "A fruit");
jumpDict.put("JGT", "001");
jumpDict.put("JEQ", "010");
jumpDict.put("JGE", "011");
jumpDict.put("JLT", "100");
jumpDict.put("JLE", "110");
jumpDict.put("JNE", "101");
jumpDict.put("JMP", "111");

//putting the key-value pair in destDict
destDict.put("M", "001");
destDict.put("D", "010");
destDict.put("MD", "011");
destDict.put("A", "100");
destDict.put("AD", "110");
destDict.put("AM", "101");
destDict.put("AMD", "111");

//putting the key-value pair in compDict
compDict.put("0", "110101010");
compDict.put("1", "110111111");
compDict.put("-1", "110111010");
compDict.put("D", "110001100");
compDict.put("A", "110110000");
compDict.put("!D", "110001101");
compDict.put("!A", "110001111");
compDict.put("-D", "110001111");
compDict.put("-A", "110110011");
compDict.put("D+1", "110011111");
compDict.put("A+1", "110110111");
compDict.put("D-1", "110001110");
compDict.put("A-1", "110110010");
compDict.put("D+A", "110000010");
compDict.put("D-A", "110010011");
compDict.put("A-D", "110000111");
compDict.put("D&A", "110000000");
compDict.put("D|A", "110010101");
compDict.put("M", "111110000");
compDict.put("!M", "111110001");
compDict.put("-M", "111110011");
compDict.put("M+1", "111110111");
compDict.put("M-1", "111110010");
compDict.put("D+M", "111000010");
compDict.put("D-M", "111010011");
compDict.put("M-D", "111000111");
compDict.put("D&M", "111000000");
compDict.put("D|M", "111010101");


}//setup ends

void draw() {
  
println(jumpDict.get("JMP"));
}

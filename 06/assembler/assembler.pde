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

}//setup ends

void draw() {
  
println(jumpDict.get("Apple"));
}

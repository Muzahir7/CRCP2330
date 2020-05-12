import java.util.*;


//variables to contain .asm and .hack strings
  String asmCode[]; //array for loading in the asm code
  String asmArr[];
  Vector<String> asmVec= new Vector<String>(); //create a vector to store cleaned asm code
  String binCode[]; // array for dumping in the bin code
  String filename = "C:/SMU/Creative_Computing/Nand_to_Tetris/nand2tetris/projects/06/add/Add.asm";  //put the . asm file absolute path in between the quotes
  int nextAddr = 16;

//dictionaries to hold hack bit commands  of jump, dest, comp, and symbols

HashMap<String, String> jumpDict = new HashMap<String, String>(); 
HashMap<String, String> destDict = new HashMap<String, String>();
HashMap<String, String> compDict = new HashMap<String, String>();
HashMap<String, String> symDict = new HashMap<String, String>();
 

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

//putting the key-value pair in symDict
symDict.put("SP", "0");
symDict.put("LCL", "1");
symDict.put("ARG", "2");
symDict.put("THIS", "3");
symDict.put("THAT", "4");
symDict.put("R0", "0");
symDict.put("R1", "1");
symDict.put("R2", "2");
symDict.put("R3", "3");
symDict.put("R4", "4");
symDict.put("R5", "5");
symDict.put("R6", "6");
symDict.put("R7", "7");
symDict.put("R8", "8");
symDict.put("R9", "9");
symDict.put("R10", "10");
symDict.put("R11", "11");
symDict.put("R12", "12");
symDict.put("R13", "13");
symDict.put("R14", "14");
symDict.put("R15", "15");
symDict.put("SCREEN", "16384");
symDict.put("KBD", "24576");

/// Rest of the code for the process goes below

loadData(); //calling the load function
//have the loaded .asm file in asmCode[]. Now, need to clean the empty lines and lines that start with comment
// or anything after the comments.

cleanData();
//you have the clean data in the asmVec

parseLabels();
//labels are parsed and symbols are stored in symDict

println(to_15_bit_str("25"));
println(isNumeric("2555858T"));
println(symDict);

println(parseInsA("@SCREEN"));
println(parseInsC("D;JEQ"));

}//setup ends

void draw() {
  

}// draw ends

// This function loads the asm code form .asm file into the array of strings
// asmCode[]. each line of code stores in an element of the array

void loadData(){
  asmCode = loadStrings(filename); // loads each line from input file into an elemenet of asmCode
} // load data ends

void cleanData(){
  //removes comments and empty spaces from the asmCode string array
  for (String line : asmCode){
    String[] arrOfStr = line.split("//", 2); //ignore the elem at index 1. work with the element at index 0
    arrOfStr[0] = arrOfStr[0].replaceAll("\\s", "");
    if (arrOfStr[0].isEmpty()){
      //ignore it
    }
    else {
      //remove the white spaces from the arrOfStr[0] and put it in the vector
      arrOfStr[0] = arrOfStr[0].replaceAll("\\s", "");
      asmVec.add(arrOfStr[0]);  // adds the cleaned code to the asmVec
    }
  } //for loop ends 
  
  //Converting Vector to String Array
    asmArr = asmVec.toArray(new String[asmVec.size()]);
    
} // cleanData ends

void parseLabels(){
  //parses the labels and updates the symDict
  int lineNum = 0;
  for (int i = 0; i < asmArr.length; i++){
      if (asmArr[i].startsWith("(")){
        String sym = asmArr[i].substring(1, asmArr[i].length()-1);
        symDict.put(sym, Integer.toString(lineNum));
      }
      else{
        lineNum++;
      }
    }
}

//pads zeros at left of the string
String padLeftZeros(String str, int n) {
  return String.format("%1$" + n + "s", str).replace(' ', '0');
}

//Converts a given string to binary left padded to 15 bits
String to_15_bit_str(String str){
  String bin = Integer.toBinaryString(Integer.parseInt(str));
  return padLeftZeros(bin, 15);
}

//translates a A instrction to binary
String parseInsA(String str){
  String line = str.substring(1);
  if (isNumeric(line)){
    //line contains a string with numbers
    return "0" + to_15_bit_str(line);
  }
  else if (!symDict.containsKey(line)){ //if ssymDict doesn't contain the key
    //add the new symbol in the dictionary
    symDict.put(line, Integer.toString(nextAddr));
    nextAddr++;
  }
  return "0" + to_15_bit_str(symDict.get(line));
}

//translates c-instruction to binary
String parseInsC(String line){
  String jump = "000";
  String dest = "000";
  
  //Handle jump
  String[] arrOfStr = line.split(";"); 
  if (arrOfStr.length == 2){  //if its a jump
    jump = jumpDict.get(arrOfStr[1]);
  }
  
  //Handle dest
  String[] arrOfStr2 = arrOfStr[0].split("="); 
  if (arrOfStr2.length == 2){
    dest = destDict.get(arrOfStr2[0]);
  }
  
  //Handle comp
  String comp = compDict.get(arrOfStr2[arrOfStr2.length-1]);
  
  return "1" + comp + dest + jump;
  
}


//Borrowed from: https://www.techiedelight.com/determine-string-valid-number-java/
//checks if a string is numeric
boolean isNumeric(String s) {
    if (s == null || s.equals("")) {
      return false;
    }

    for (int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      if (c < '0' || c > '9') {
        return false;
      }
    }
    return true;
}
  
  
 

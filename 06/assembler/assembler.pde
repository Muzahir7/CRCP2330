import java.util.*;


//variables to contain .asm and .hack strings
  String asmCode[]; //array for loading in the asm code
  String binCode[]; // array for dumping in the bin code
  String filename = "C:/SMU/Creative_Computing/Nand_to_Tetris/nand2tetris/projects/06/add/Add.asm";  //put the . asm file absolute path in between the quotes
  

//dictionaries to hold hack bit commands  of jump, dest, comp, and symbols
Dictionary jumpDict = new Hashtable();
Dictionary destDict = new Hashtable();
Dictionary compDict = new Hashtable();
Dictionary symDict = new Hashtable();
 

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
    if (arrOfStr[0] == null || arrOfStr[0] == ""){
      //ignore it
    }
    else {
      //remove the white spaces from the arrOfStr[0] and put it in the vector
      arrOfStr[0] = arrOfStr[0].replaceAll("\\s", "");
      
    }
    println(arrOfStr[0]);
  } //for loop ends 
} // cleanData ends 

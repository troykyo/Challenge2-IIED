//Adjust Tables to include user number
//Then merge then all on the command line with cat New1-20173311449.csv New2-20173311454.csv New3-20173311510.csv New4-20173311513.csv New5-20173311528.csv New6-620173311535.csv New7-20173311538.csv New8-\ 20173311545.csv New9-20173311550.csv New10-20173311554.csv New11-20173311558.csv New12-2017331163.csv New13-20173311610.csv New14-20173311613.csv New15-20173311616.csv New16-20173311618.csv New17-20173311621.csv New18-20173311627.csv New19-20173311630.csv New20-20173311632.csv New21\ -\ 20173311636.csv New22\ -\ 20173311639.csv New23\ -\ 20173311653.csv New24\ -\ 20173311655.csv New25\ -\ 20173311657.csv > Master.csv


Table sourceTable;
Table referenceTable;
Table finalTable;
float newtons = 0;
float mm = 0;
float stiffness = 0;
float maxNewtons = 0;
int volt = 0;
int state = 0;
int counter;
int index=0;
float mapIndex = 0;
int refMax = 0;
int arrayCounter = 0;
float arrayAvg = 0;
int source = 0;
int sourceIndex = 1;
int arrayS[] = new int[1000];
float sourcearrayS[]= new float[50];
int sensor=1;
String press = "";
String buttonPress = "";
String sourceFile = "User Test 1/FinalMasterMonday.csv";
String referenceFile = "Pressure tests/MasterPressureVolt.csv";
String path = "/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/"; 

void setup() {

  sourceTable = loadTable(path+sourceFile, "header");
  referenceTable = loadTable(path+referenceFile, "header");
  finalTable = new Table();
  println(sourceTable.getRowCount() + " total rows in sourceage table");
  println(referenceTable.getRowCount() + " total rows in pressure table");
  refMax=referenceTable.getRowCount();

  finalTable.addColumn("Button", Table.INT);
  finalTable.addColumn("Voltage", Table.INT);
  finalTable.addColumn("Stiffness", Table.FLOAT);
 


    for (int sensor =1; sensor<5; sensor++) { 
      for (int i = 0; i < 1023; i++) {
        index=i;
        arrayCounter=0;
        arrayAvg=0;
        counter = 0;
        for (TableRow row : referenceTable.rows ()) {
          counter++; 
          volt = row.getInt("Voltage"); 
          state = row.getInt("Sensor"); 
          if ((sensor == state )&&(index==volt)&&(index>0) && row.getFloat("Stiff")>0 && row.getFloat("Stiff")<300) {
            arrayS[arrayCounter] = counter ; 
            arrayAvg = arrayAvg+row.getFloat("Stiff");
            println (state +" " + index + " " + arrayS[arrayCounter] + " " +row.getFloat("Stiff")+" "); 
            arrayCounter++;
          }
        }
        arrayAvg=arrayAvg/arrayCounter;
        println(arrayAvg);
        println("");
        TableRow newRow = finalTable.addRow();        
        newRow.setInt("Voltage", index);
        newRow.setInt("Button", sensor);
        newRow.setFloat("Stiffness", arrayAvg);
        
      }
    }
  saveTable(finalTable, "/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/MasterLookup.csv");
}

/*

 
 
 println (""); 
 
 for (TableRow row : sourceTable.rows ()) {
 counter++; 
 source = row.getInt("20"); 
 row.setInt("Sensor", sensor); 
 if (source == 1) {
 sourcearrayS[sourceIndex]=counter; 
 print(sourcearrayS[sourceIndex] + " "); 
 sourceIndex++;
 }
 }
 println(""); 
 
 for (arrayCounter = 1; arrayCounter<21; arrayCounter++) {
 counter = sourcearrayS[arrayCounter]; 
 if ((arrayS[arrayCounter] != 0) && (sourcearrayS[arrayCounter] !=0) && (arrayS[arrayCounter+1] != 0) && (sourcearrayS[arrayCounter+1] !=0)) { 
 for (counter = counter; counter < sourcearrayS[arrayCounter+1]; counter++) {
 mapIndex = map(counter, sourcearrayS[arrayCounter], sourcearrayS[arrayCounter+1], arrayS[arrayCounter], arrayS[arrayCounter+1]); 
 index = int(mapIndex); 
 print (index); 
 newtons = referenceTable.getFloat(index, "Newton"); 
 mm = referenceTable.getFloat(index, "mm"); 
 stiffness = newtons/mm; 
 println (" " + counter + " Newtons:" + newtons + " MM:" + mm + " Stiffness:" + stiffness); 
 sourceTable.setFloat(counter, "Newtons", newtons); 
 sourceTable.setFloat(counter, "MM", mm); 
 sourceTable.setFloat(counter, "Stiff", stiffness);
 }
 }
 }
 saveTable(sourceTable, path+"Pressure"+sourceFile);
 }
 
 
 newtons = row.getFloat("Newton");
 mm = row.getFloat("mm");
 stiffness = newtons/mm;
 row.setFloat("stiff", stiffness);
 
 for (int i = 1; i<50; i++) {
 print(arrayS[i] + " ");
 table.setInt(i, "arrayS", arrayS[i]);
 }
 
 
 if (newtons > maxNewtons) {
 maxNewtons = newtons;
 state = 1;
 //print("*");
 } else if ((newtons > 80) && ( newtons < maxNewtons) && (state == 1)) {
 println("");
 //println (newtons + " " +maxNewtons);
 row.setInt("peak", 1); 
 println(counter+"\t"+ maxNewtons);
 arrayS[arrayCounter] = counter;
 arrayCounter++;
 state = 0;
 } else {
 if (newtons == 0) {
 //print("!");
 maxNewtons = 0;
 state = 1;
 }
 }
 */

//Adjust Tables to include user number
//Then merge then all on the command line with cat New1-20173311449.csv New2-20173311454.csv New3-20173311510.csv New4-20173311513.csv New5-20173311528.csv New6-620173311535.csv New7-20173311538.csv New8-\ 20173311545.csv New9-20173311550.csv New10-20173311554.csv New11-20173311558.csv New12-2017331163.csv New13-20173311610.csv New14-20173311613.csv New15-20173311616.csv New16-20173311618.csv New17-20173311621.csv New18-20173311627.csv New19-20173311630.csv New20-20173311632.csv New21\ -\ 20173311636.csv New22\ -\ 20173311639.csv New23\ -\ 20173311653.csv New24\ -\ 20173311655.csv New25\ -\ 20173311657.csv > Master.csv


Table voltTable;
Table pressureTable;
float newtons = 0;
float mm = 0;
float stiffness = 0;
float maxNewtons = 0;
int state = 0;
int counter;
int index=0;
float mapIndex = 0;
int arrayCounter = 1;
int volt = 0;
int voltIndex = 1;
int peaks[] = new int[50];
int voltPeaks[]= new int[50];
String voltFile = "3Volt.csv";
String pressureFile = "3Pressure.csv";
String path = "/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/Pressure tests/"; 

void setup() {

  voltTable = loadTable(path+voltFile, "header");
  pressureTable = loadTable(path+pressureFile, "header");

  println(voltTable.getRowCount() + " total rows in voltage table");
  println(pressureTable.getRowCount() + " total rows in pressure table");

  for (int i = 1; i<21; i++) {
    peaks[i] = pressureTable.getInt(i, "Peaks");
    print(peaks[i] + " ");
  }

  println ("");

  for (TableRow row : voltTable.rows ()) {
    counter++;
    volt = row.getInt("20");
    if (volt == 1) {
      voltPeaks[voltIndex]=counter;
      print(voltPeaks[voltIndex] + " ");
      voltIndex++;
    }
  }
  println("");

  for (arrayCounter = 1; arrayCounter<21; arrayCounter++) {
    counter = voltPeaks[arrayCounter];
    if ((peaks[arrayCounter] != 0) && (voltPeaks[arrayCounter] !=0) && (peaks[arrayCounter+1] != 0) && (voltPeaks[arrayCounter+1] !=0)) { 
      for (counter = counter ;counter < voltPeaks[arrayCounter+1];counter++){
      mapIndex = map(counter, voltPeaks[arrayCounter], voltPeaks[arrayCounter+1], peaks[arrayCounter], peaks[arrayCounter+1]);
      index = int(mapIndex);
      print (index);
      newtons = pressureTable.getFloat(index, "Newton");
      mm = pressureTable.getFloat(index, "mm");
      stiffness = pressureTable.getFloat(index, "stiff");
      println (" " + counter + " Newtons:" + newtons + " MM:" + mm + " Stiffness:" + stiffness);
      
      }
    }
  }
  //saveTable(table, path+"Pressure"+voltFile);
}

/*
      newtons = row.getFloat("Newton");
 mm = row.getFloat("mm");
 stiffness = newtons/mm;
 row.setFloat("stiff", stiffness);
 
 for (int i = 1; i<50; i++) {
 print(peaks[i] + " ");
 table.setInt(i, "Peaks", peaks[i]);
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
 peaks[arrayCounter] = counter;
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

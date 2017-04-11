//Adjust Tables to include user number
//Then merge then all on the command line with cat New1-20173311449.csv New2-20173311454.csv New3-20173311510.csv New4-20173311513.csv New5-20173311528.csv New6-620173311535.csv New7-20173311538.csv New8-\ 20173311545.csv New9-20173311550.csv New10-20173311554.csv New11-20173311558.csv New12-2017331163.csv New13-20173311610.csv New14-20173311613.csv New15-20173311616.csv New16-20173311618.csv New17-20173311621.csv New18-20173311627.csv New19-20173311630.csv New20-20173311632.csv New21\ -\ 20173311636.csv New22\ -\ 20173311639.csv New23\ -\ 20173311653.csv New24\ -\ 20173311655.csv New25\ -\ 20173311657.csv > Master.csv
  

Table table;

Table voltTable;
Table pressureTable;
float newtons = 0;
float mm = 0;
float stiffness = 0;
float maxNewtons = 0;
int state = 0;
int counter;
int arrayCounter = 1;
int volt = 0;
int volts[] = new int[50];
int pressure[]= new int[50];
String voltFile = "4Volt.csv";
String pressureFile = "3Pressure.csv";
String path = "/Users/svandestar/Documents/Challenge2-IIED/pTest/mapStiff/"; 

void setup() {

  voltTable = loadTable(path+voltFile, "header");
  pressureTable = loadTable(path+pressureFile, "header");
  println(voltTable.getRowCount() + " total rows in voltage table");
  println(pressureTable.getRowCount() + " total rows in pressure table");

  for (int i = 1; i<14744; i++) {
    volts[i] = voltTable.getInt(i,1);
      for (int j = 1; j<495998; j++) {
        pressure[i] = pressureTable.getInt(j,2);
 
      if (volts[i] == 1728 && pressure[i] == 1728){
        println("Joe");
        return;
    }
  }
 } 
    //saveTable(table, path+"Pressure"+voltFile);  
}
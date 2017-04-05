//Adjust Tables to include user number
//Then merge then all on the command line with cat New1-20173311449.csv New2-20173311454.csv New3-20173311510.csv New4-20173311513.csv New5-20173311528.csv New6-620173311535.csv New7-20173311538.csv New8-\ 20173311545.csv New9-20173311550.csv New10-20173311554.csv New11-20173311558.csv New12-2017331163.csv New13-20173311610.csv New14-20173311613.csv New15-20173311616.csv New16-20173311618.csv New17-20173311621.csv New18-20173311627.csv New19-20173311630.csv New20-20173311632.csv New21\ -\ 20173311636.csv New22\ -\ 20173311639.csv New23\ -\ 20173311653.csv New24\ -\ 20173311655.csv New25\ -\ 20173311657.csv > Master.csv


Table table;
Table maxTable;
String file = "Master.csv";
String path;
int userRef = 0;
int pressureRef = 0;
int conditionRef = 0;
int [][]MaxArray= { 
  {
    0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0
  }
  , {
    0, 0, 0, 0, 0, 0
  }
};
int pressureMax=0;

void setup() {
  maxTable = new Table();
  maxTable.addColumn("MaxPressure");
  maxTable.addColumn("Condition");
  maxTable.addColumn("Pressure");
  maxTable.addColumn("User");

  table = loadTable("/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/"+file, "header");
  println(table.getRowCount() + " total rows in table"); 
  //Arduino Time, Sensor 1, Sensor 2, Sensor 3, Sensor 4, Processing Time, Frame #, Condition, Pressure

  for (int user = 1; user < 26; user++) {
    for (TableRow row : table.rows ()) {

      userRef = row.getInt(9);
      pressureRef = row.getInt(8);
      conditionRef = row.getInt(7);
      for  (int condition = 1; condition < 5; condition++) {
        for  (int pressure = 1; pressure < 4; pressure++) {
          if ((user == userRef ) && (condition==conditionRef) && (pressure==pressureRef)) {
            pressureMax = row.getInt(condition);
            if (pressureMax > MaxArray[condition][pressure]) {
              MaxArray[condition][pressure] = pressureMax;
            }
          }
        }
      }
    }
      for  (int condition = 1; condition < 5; condition++) {
        for  (int pressure = 1; pressure < 4; pressure++) {
          TableRow maxRow = maxTable.addRow();
          maxRow.setInt("User", user);
          maxRow.setInt("Condition", condition);
          maxRow.setInt("Pressure", pressure);
          maxRow.setInt("MaxPressure", MaxArray[condition][pressure]);
          println(maxRow.getInt("MaxPressure")+ "\t" +maxRow.getInt("User")+ "\t" +maxRow.getInt("Condition")+ "\t" +maxRow.getInt("Pressure")+ "\t");
        }
      }
    
    for  (int condition = 1; condition < 5; condition++) {
      for  (int pressure = 1; pressure < 4; pressure++) {
        MaxArray [condition][pressure] = 0;
      }
    }
  }
  saveTable(maxTable, "/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/NewMax"+file);
}


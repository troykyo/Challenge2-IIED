//Adjust Tables to include user number
//Then merge then all on the command line with cat New1-20173311449.csv New2-20173311454.csv New3-20173311510.csv New4-20173311513.csv New5-20173311528.csv New6-620173311535.csv New7-20173311538.csv New8-\ 20173311545.csv New9-20173311550.csv New10-20173311554.csv New11-20173311558.csv New12-2017331163.csv New13-20173311610.csv New14-20173311613.csv New15-20173311616.csv New16-20173311618.csv New17-20173311621.csv New18-20173311627.csv New19-20173311630.csv New20-20173311632.csv New21\ -\ 20173311636.csv New22\ -\ 20173311639.csv New23\ -\ 20173311653.csv New24\ -\ 20173311655.csv New25\ -\ 20173311657.csv > Master.csv


Table table;
int user = 1;
String file[] = {
  "0", "1-20173311449.csv", "2-20173311454.csv", "3-20173311510.csv", "4-20173311513.csv", "5-20173311528.csv", "6-620173311535.csv", "7-20173311538.csv", "8- 20173311545.csv", "9-20173311550.csv", "10-20173311554.csv", "11-20173311558.csv", "12-2017331163.csv", "13-20173311610.csv", "14-20173311613.csv", "15-20173311616.csv", "16-20173311618.csv", "17-20173311621.csv", "18-20173311627.csv", "19-20173311630.csv", "20-20173311632.csv", "21 - 20173311636.csv", "22 - 20173311639.csv", "23 - 20173311653.csv", "24 - 20173311655.csv", "25 - 20173311657.csv"
};
String path;
void setup() {
  for (user = 1; user < 26; user++) {
    table = loadTable("/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/"+file[user], "header");

    println(table.getRowCount() + " total rows in table"); 
    //Arduino Time, Sensor 1, Sensor 2, Sensor 3, Sensor 4, Processing Time, Frame #, Condition, Pressure

    table.addColumn("User", Table.INT);

    for (TableRow row : table.rows ()) {

      row.setInt(9, user);
      table.trim();
      
      println(row.getString(0) + "\t" +row.getString(1)+ "\t" +row.getString(2)+ "\t" +row.getString(3)+ "\t" +row.getString(4)+ "\t" +row.getString(5)+ "\t" +row.getString(6)+ "\t" +row.getString(7)+ "\t" +row.getString(8)+ "\t" +row.getString(9));
    }
    saveTable(table, "/Users/troy/Google Drive/TUe/Insights into Expirimental Data/Challenge2-IIED/Challenge2-IIED/User Test 1/New"+file[user]);
  }
}


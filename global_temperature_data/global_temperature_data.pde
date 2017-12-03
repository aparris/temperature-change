//variables that can be modified at the outset:

int g=0; //variable to change green value in background (constant throughout)
int b=100; //variable to change blue value in background (constant throughout)
float newTemp = 3; //set temperature goal for year 2117 between -2 and 3 C

int y =0; //to begin iteration through data
int yearFuture = 2016; //first year we don't have the data for
float newTempColor = map (newTemp, -2, 3, 0, 255); //scale temperature for color
float newTempColorStart;  //the temperature that changes each year
Table table; //data
float Starting; //2016 starting temperature 
 
void setup () {
size (750,750);
textSize (50);
table = loadTable ("avgTemp_NASA.csv", "header") ;
newTempColorStart= map (table.getFloat(136,1), -2,3,0,255);
Starting = newTempColorStart;
}

void draw () {
float temp = table.getFloat(y,1);
float tempNew = map (temp,-2,3,0,255);
background (tempNew, g, b);
String year = table.getString (y,0);
text (year, 600, 700);
delay(100);

if (y<136) {
  y=y+1; 
}

else {
  if (newTempColorStart<=newTempColor){
  newTempColorStart=newTempColorStart+((newTempColor-Starting)/102);
  background (newTempColorStart, 0, 100);
//print (yearFuture);
//print ("_");
//print (newTempColorStart);
//print ("  ");
   delay (100);
   if (yearFuture<2117) 
   {yearFuture=yearFuture+1;
    text (yearFuture, 600, 700);}
}

else {
  background (newTempColor, g, b);
}
 
}
  
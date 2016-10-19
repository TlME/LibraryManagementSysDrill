	import java.util.Random;

public class LibGen {
	public static void main (String[] arg){
      Random random = new Random();
      loans(3500,10,random);
      loans(3501,3,random);
      loans(3502,6,random);
      loans(3503,2,random);
      loans(3504,1,random);
      loans(3505,3,random);
      loans(3506,9,random);
      loans(3507,6,random);   
    
  }
  
  public static int sRI(int aStart, int aEnd, Random aRandom){
    if (aStart > aEnd) {
      throw new IllegalArgumentException("Start cannot exceed End.");
    }
    //get the range, casting to long to avoid overflow problems
    long range = (long)aEnd - (long)aStart + 1;
    // compute a fraction of the range, 0 <= frac < range
    long fraction = (long)(range * aRandom.nextDouble());
    int randomNumber =  (int)(fraction + aStart);    
    return randomNumber;
  }
  
  public static void log(String aMessage){
    System.out.println(aMessage);
  }
  public static void books(int lib, int num){
		for (int i= 0; i < num; i++){
			if (i<10){
				System.out.print("(10"+i+","+lib+","+(i%3 + 2)+"),");
			}
			else{
				System.out.print("(1"+i+","+lib+","+(i%3 + 2)+"),");
			}
		}
	}
   public static void loans(int cardNo, int booksOut, Random rand){
      for (int i=0; i <= booksOut; i++){
         int dayOut = sRI(1,15,rand);
         int dayDue = dayOut + sRI(5,14,rand);
         System.out.print("("+sRI(100,123,rand)+","+(sRI(2,6,rand)*5)+","+
            cardNo+","+"'2016-10-"+dayOut+"',"+"'2016-10-"+dayDue+"'),");
      }
      System.out.println();
   } 
}
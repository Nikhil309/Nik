class Calculation {
	
		   int z;
		   //function for addition
		   public void addition(int x, int y) {
			   z = x + y;
			   System.out.println("The sum of the given numbers:"+z);
		   }
			//function for substraction
		   public void Subtraction(int x, int y) {
			   z = x - y;
			   System.out.println("The difference between the given numbers:"+z);
		   }
		}

		 class My_Calculation1 extends Calculation {
		   public void multiplication(int x, int y) {
			   z = x * y;
		       System.out.println("The product of the given numbers:"+z);
		   }
			
		   public static void main(String args[]) {
			   int a = 20, b = 10;
			   My_Calculation1 cal = new My_Calculation1();
			   cal.addition(a, b);
			   cal.Subtraction(a, b);
			   cal.multiplication(a, b);
		   }
		}






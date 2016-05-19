public class euler5 
{
	public static void main(String[] args)
	{
		divisible();
	}
	
	private static void divisible()
	{
		boolean evenlyDivis = true;
		long n = 0;
		for(long x = 21; x <= 500000000l; x++)
		{
			evenlyDivis = true;
			if(x == 500000000l)
			{
				System.out.println("Done");
			}
			for(long i = 2; i <= 20; i++)
			{
				n = x % i;
				if(n != 0)
				{
					evenlyDivis = false;
					break;
				}
			}
			if(evenlyDivis)
			{
				System.out.println(x + " is evenly divisible");
			}
		}
	}
}

public class euler5 
{
	public static void main(String[] args)
	{
		int div = Integer.parseInt(args[0]);
		long limit = Long.parseLong(args[1]);
		divisible(div, limit);
	}
	
	private static long divisible(int div, long limit)
	{
		boolean evenlyDivis = true;
		long n = 0;
		for(long x = div+1; x <= limit; x++)
		{
			evenlyDivis = true;
			for(long i = 2; i <= div; i++)
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
				return(x);
			}
		}
		return 0;
	}
}

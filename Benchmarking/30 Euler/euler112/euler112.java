public class euler112
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		calc(limit);
	}
	
	private static boolean bouncy(int number)
	{
		boolean inc = false;
		boolean dec = false;
		
		int last = number % 10;
		number = number / 10;
		
		while(number > 0)
		{
			int next = number % 10;
			number = number / 10;
			
			if(next < last)
			{
				inc = true;
			}
			else if(next > last)
			{
				dec = true;
			}
			last = next;
			if(dec && inc)
			{
				return true;
			}
		}
		return dec && inc;
	}
	
	private static int calc(int limit)
	{
		int i = 99;
		int bouncies = 0;
		while(100 * bouncies < 99 * i)
		{
			i += 1;
			if(bouncy(i))
			{
				bouncies += 1;
			}
		}
		return i;
	}
}

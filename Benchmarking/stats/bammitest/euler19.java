public class euler19
{
	public static void main(String[] args)
	{
		int minYear = Integer.parseInt(args[0]);
		int maxYear = Integer.parseInt(args[1]);	
		calc(minYear, maxYear);
	}
	
	private static int calc(int minYear, int maxYear)
	{
		int count = 0;
		int daysMonth = 0;
		int passed = 1;
		for(int i = minYear; i <= maxYear; i++)
		{
			for(int j = 1; j <= 12; j++)
			{
				if(j == 4 || j == 6 || j == 9 || j == 11)
				{
					daysMonth = 30;
				}
				else if(j == 2)
				{
					if(i % 400 == 0 || (i % 4 == 0 && i % 100 == 0))
					{
						daysMonth = 29;
					}
					else
					{
						daysMonth = 2;
					}
				}
				else
				{
					daysMonth = 31;
				}
				if(passed % 7 == 0)
				{
					count += 1;
				}
				passed += daysMonth;
			}
		}
		return count;
	}
}

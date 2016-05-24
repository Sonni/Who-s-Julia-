public class euler21
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		System.out.println(amica(limit));
	}
	
	private static int sum_divisors(int n)
	{
		int sum = 0;
		int k = n - 1;
		for(int i = 1; i <= k; i++)
		{
			if(n % i == 0)
			{
				sum += i;
			}
		}
		return sum;
	}
	
	private static int amica(int a)
	{
		int amicable = 0;
		int sum = 0;
		for(int i = 1; i <= a; i++)
		{
			int b = sum_divisors(i);
			int c = sum_divisors(b);
			if(i == c && i != b)
			{
				amicable += 1;
				sum += i;
			}
		}
		return sum;
	}
}

public class euler12
{
	public static void main(String[] args)
	{
		int numDiv = Integer.parseInt(args[0]);
		System.out.println(triangular(numDiv));
	}
	
	private static int divisors(int n)
	{
		int numFactors = 0;
		int ceiling = 2147483647;
		for(int i = 1; i <= (int)Math.ceil(Math.sqrt(n)+1); i++)
		{
			if(n % i == 0)
			{
				numFactors += 2;
			}
			if (i * i == n)
			{
				numFactors -= 1;
			}
		}
		return numFactors;
	}
	
	private static int triangular(int numDiv)
	{
		int ceil = 32767;
		int count;
		int k;
		for(int n = 1; n <= ceil; n++)
		{
			k = (int)n * (n + 1) / 2;
			if(n % 2 == 0)
			{
				count = divisors(n / 2) * divisors(n + 1);
			}
			else
			{
				count = divisors(n) * divisors((n + 1) / 2);
			}
			if(count > numDiv)
			{
				return k;
			}
		}
		return 0;
	}
}

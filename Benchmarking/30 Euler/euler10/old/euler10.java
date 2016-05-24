public class euler10
{
	public static void main(String[] args)
	{
		long limit = Long.parseLong(args[0]);
		System.out.println(sumPrime(limit));
	}
	
	private static boolean isPrime(long x)
	{
		long divisor = 2;
		boolean prime = true;
		while(divisor < x)
		{
			if(x % divisor == 0)
			{
				prime = false;
				break;
			}
			divisor += 1;
		}
		return prime;
	}
	
	private static long sumPrime(long n)
	{
		long sum = 0;
		for(long i = 2; i < n; i++)
		{
			if(isPrime(i))
			{
				sum += i;
			}
		}
		return sum;
	}
}

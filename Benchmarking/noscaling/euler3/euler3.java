import java.util.*;

public class euler3
{
	public static void main (String[] args)
	{
		prime_factors(Long.parseLong(args[0]));
	}
	
	private static List<Long> prime_factors(long n)
	{
		List<Long> factors = new ArrayList<>();
		long d = 2;
		while(n > 1)
		{
			while(n % d == 0)
			{
				factors.add(d);
				n /= d;
			}
			d += 1;
		}
		return factors;
	}
}

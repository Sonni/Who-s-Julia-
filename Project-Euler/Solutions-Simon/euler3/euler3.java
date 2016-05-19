import java.util.*;

public class euler3
{
	public static void main (String[] args)
	{
		System.out.println(prime_factors(600851475143l));
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

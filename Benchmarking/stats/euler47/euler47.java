import java.util.*;
import java.math.*;

public class euler47
{
	public static void main(String[] args)
	{
		int cons = Integer.parseInt(args[0]);
		int dist = Integer.parseInt(args[1]);
		calc(cons, dist);
	}
	
	private static List<Integer> prime_factors(int n)
	{
		List<Integer> factors = new ArrayList<>();
		int d = 2;
		while(n > 1)
		{
			while(n % d == 0)
			{
				factors.add(d);
				n = n / d;
			}
			d += 1;
		}
		return factors;
	}
	
	private static int calc(int cons, int dist)
	{
		long m = 9223372036854775807l;
		int currentCons = 0;
		List<Integer> arr;
		for(int i = 1; i <= m; i++)
		{
			arr = new ArrayList<>(new LinkedHashSet<>(prime_factors(i)));
			if(arr.size() == dist)
			{
				currentCons += 1;
				if(currentCons == cons)
				{
					return i - (cons - 1);
				}
			}
			else
			{
				currentCons = 0;
			}
		}
		return 0;
	}
}

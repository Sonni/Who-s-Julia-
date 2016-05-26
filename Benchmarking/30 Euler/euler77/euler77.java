import java.util.*;

public class euler77
{
	public static void main(String[] args)
	{
		int ways = Integer.parseInt(args[0]);
		int limit = Integer.parseInt(args[1]);
		calc(ways, limit);
	}
	
	private static List<Integer> getPrimes(int size)
	{
		List<Boolean> array = new ArrayList<>();
		for(int i = 0; i <= size; i++)
		{
			array.add(true);
		}
		array.set(1, false);
		for(int i = 2; i <= size; i++)
		{
			if(array.get(i))
			{
				int j = i + i;
				while(j <= size)
				{
					array.set(j, false);
					j += i;
				}
			}
		}
		List<Integer> primeArray = new ArrayList<>();
		for(int i = 2; i <= size; i++)
		{
			if(array.get(i))
			{
				primeArray.add(i);
			}
		}
		return primeArray;
	}
	
	private static int calc(int ways, int limit)
	{
		List<Integer> primes = getPrimes(limit);
		int target = 2;
		List<Integer> way;
		while(true)
		{
			way = new ArrayList<>();
			for(int i = 0; i <= target + 1; i++)
			{
				way.add(0);
			}
			way.set(1, 1);
			for(int i = 0; i < primes.size(); i++)
			{
				for(int j = primes.get(i); j <= target; j++)
				{
					way.set(j + 1, way.get(j + 1) + way.get(j + 1 - primes.get(i)));
				}
			}
			if(way.get(target) > ways)
			{
				return target - 1;
			}
			target += 1;
		}
	}
}

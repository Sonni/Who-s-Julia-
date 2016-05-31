import java.util.*;

public class euler77
{
	public static void main(String[] args)
	{
		int ways = Integer.parseInt(args[0]);
		calc(ways);
	}
	
	private static List<Integer> getPrimes(int size)
	{
		ArrayList<Boolean> array = new ArrayList<Boolean>();
		for(int i = 0; i <= size; i++)
		{
			array.add(true);
		}
		array.set(1, false);
		int c = 1;
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
				c += 1;
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
	
	private static int calc(int ways)
	{
		int i = 2;
		while(true)
		{
			List<Integer> arr = new ArrayList<>();
			for(int j = 0; j <= i; j++)
			{
				arr.add(0);
			}
			arr.set(0, 1);
			List<Integer> primes = getPrimes(i);
			for(int p : primes)
			{
				for(int j = p; j < arr.size(); j++)
				{
					arr.set(j, arr.get(j) + arr.get(j - p));
				}
			}
			if(arr.get(i) > ways)
			{
				return i;
			}
			i += 1;
		}
	}
}

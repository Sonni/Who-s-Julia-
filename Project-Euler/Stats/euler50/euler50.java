import java.util.*;

public class euler50
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		System.out.println(calc(limit));
	}
	
	private static List<Boolean> getPrimes(int size)
	{
		List<Boolean> array = new ArrayList<>();
		for(int i = 0; i <= size; i++)
		{
			array.add(true);
		}
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
		return array;
	}
	
	private static int calc(int limit)
	{
		List<Boolean> primes = getPrimes(limit);
		int maxSeq = 0;
		int maxPrime = 0;
		for(int i = 2; i < limit; i++)
		{
			int sum = 0;
			int seq = 0;
			for(int j = i; j < limit; j++)
			{
				if(primes.get(j))
				{
					sum += j;
					seq += 1;
					if(sum > limit)
					{
						break;
					}
					if(primes.get(sum))
					{
						if(seq > maxSeq)
						{
							maxSeq = seq;
							maxPrime = sum;
						}
					}
				}
			}
		}
		return maxPrime;
	}
}

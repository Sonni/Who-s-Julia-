import java.util.*;

public class euler35
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		calc(limit);
	}
	
	private static PrimeResult getPrimes(int size)
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
		return new PrimeResult(array, primeArray);
	}
	
	private static String rotate(String s)
	{
		String first = s.substring(0, 1);
		String last = s.substring(1, s.length());
		return last + first;
	}
	
	private static int calc(int limit)
	{
		PrimeResult pr = getPrimes(limit);
		ArrayList<Boolean> primesBool = pr.getBool();
		List<Integer> primes = pr.getPrimes();
		int count = 0;
		for(int p : primes)
		{
			String s = String.valueOf(p);
			int l = s.length();
			boolean circPrime = true;
			for(int i = 1; i < l; i++)
			{
				s = rotate(s);
				int n = Integer.parseInt(s);
				if(!primesBool.get(n))
				{
					circPrime = false;
					break;
				}
			}
			if(circPrime)
			{
				count += 1;
			}
		}
		return count;
	}
	
	private static class PrimeResult
	{
		ArrayList<Boolean> bools;
		List<Integer> primes;
		
		public ArrayList<Boolean> getBool()
		{
			return bools;
		}
		public List<Integer> getPrimes()
		{
			return primes;
		}		
		public PrimeResult(ArrayList<Boolean> b, List<Integer> p)
		{
			bools = b;
			primes = p;
		}
	}
}

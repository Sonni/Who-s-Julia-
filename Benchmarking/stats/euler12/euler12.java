import java.util.*;

public class euler12
{
	public static void main(String[] args)
	{
		int divisors = Integer.parseInt(args[0]);
		calc(divisors);
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
	
	private static int calc(int div)
	{
  		int limit = 2147483647;
  		int i = 0;
		int countDiv = 0;
		List<Integer> fact = prime_factors(i);
		List<Integer> distinct = new ArrayList<>(new LinkedHashSet<>(fact));
		List<Integer> countExp = new ArrayList<>();
		HashMap<Integer, Integer> dict = new HashMap<>();
  		for(int n = 1; n <= limit; n++)
  		{
  			i += n;
  			countDiv = 1;
  			fact = prime_factors(i);
  			distinct = new ArrayList<>(new LinkedHashSet<>(fact));
  			countExp = new ArrayList<>();
  			dict = new HashMap<>();
  			for(int num : distinct)
  			{
  				for(int j = 0; j < fact.size(); j++)
  				{
  					if(num == fact.get(j))
  					{
  						if(dict.containsKey(num))
  						{
  							dict.put(num, dict.get(num) + 1);
  						}
  						else
  						{
  							dict.put(num, 1);
  						}
  					}
  				}
  			}
			for(int k : dict.keySet())
			{
				countDiv *= (dict.get(k) + 1);
			}
			if(countDiv > div)
			{
				return i;
			}
  		}
  		return 0;
	}
}

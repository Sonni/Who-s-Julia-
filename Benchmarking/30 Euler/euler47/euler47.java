import java.util.*;

public class euler47
{
	public static void main(String[] args)
	{
		int cons = Integer.parseInt(args[0]);
		int limit = Integer.parseInt(args[1]);
		calc(limit, cons);
	}
	
	private static int numFactors(int number, List<Integer> primeList)
	{
		int nod = 0;
		boolean pf = false;
		int remain = number;
		for(int i = 0; i < primeList.size(); i++)
		{
			if(primeList.get(i) * primeList.get(i) > number)
			{
				nod += 1;
				return nod;
			}
			pf = false;
			while(remain % primeList.get(i) == 0)
			{
				pf = true;
				remain = remain / primeList.get(i);
			}
			if(pf)
			{
				nod += 1;
			}
			if(remain == 1)
			{
				return nod;
			}
		}
		return nod;
	}
	
	private static List<Integer> getPrimes(int size)
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
	
	private static int calc(int limit, int consec)
	{
		List<Integer> primeList = getPrimes(limit);
		int targetpf = consec;
		int targetcons = consec;
		int cons = 1;
		int result = 1;
		while(cons < targetcons)
		{
			result += 1;
			if(numFactors(result, primeList) >= targetpf)
			{
				cons += 1;
			}
			else
			{
				cons = 0;
			}
		}
		return result-3;
	}
}

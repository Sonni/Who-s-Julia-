import java.util.*;

public class euler35
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		calc(limit);
	}
	
	private static ArrayList<Boolean> getPrimes(int size)
	{
		ArrayList<Boolean> array = new ArrayList<>();
		for(int i = 0; i <= size; i++)
		{
			array.add(true);
		}
		for(int i = 2; i <= size; i++)
		{
			if(array.get(i) == true)
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
		int count = 0;
		ArrayList<Boolean> primes = getPrimes(limit);
		
		for(int num = 2; num <= limit; num++)
		{
			boolean q = false;
			String snum = String.valueOf(num);
			for(int i = 0; i < snum.length(); i++)
			{
				int index = Integer.parseInt(snum.substring(i) + snum.substring(0, i));
				if(primes.get(index))
				{
					q = true;
				}
				else
				{
					q = false;
					break;
				}
			}
			if(q)
			{
				count += 1;
			}
		}
		return count;
	}
}

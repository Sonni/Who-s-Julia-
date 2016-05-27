import java.util.*;

public class euler23
{
	public static void main(String[] args)
	{
		int sum = 0;
		for(int i : get_list(28123))
		{
			sum += i;
		}
		System.out.println(sum);
	}
	
	private static int sum_divisors(int n)
	{
		int sum = 1;
		int limit = (int)Math.floor(n * 0.5) + 1;
		for(int i = 2; i < limit; i++)
		{
			if(n % i == 0)
			{
				sum += i;
			}
		}
		return sum;
	}
	
	private static boolean is_abundant(int n)
	{
		if(sum_divisors(n) > n)
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	
	private static ArrayList<Integer> find_abundants(int limit)
	{
		ArrayList<Integer> abundants = new ArrayList<>();
		for(int i = 1; i <= limit; i++)
		{
			if(is_abundant(i))
			{
				abundants.add(i);
			}
		}
		return abundants;
	}
	
	private static ArrayList<Integer> get_list(int limit)
	{
		ArrayList<Integer> abds = find_abundants(limit);
		ArrayList<Integer> list = new ArrayList<>();
		for(int i = 1; i < limit; i++)
		{
			list.add(i);
		}
		for(int x : abds)
		{
			for(int y : abds)
			{
				if(x + y >= limit)
				{
					break;
				}
				list.set(x+y-1, 0);
			}
		}
		return list;
	}
}

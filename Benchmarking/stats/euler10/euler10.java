import java.util.*;

public class euler10
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		long sum = 0l;
		for(int i : getPrimes(limit))
		{
			sum += i;
		}
		System.out.println(sum);
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
}

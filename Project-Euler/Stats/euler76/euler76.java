import java.util.*;

public class euler76
{
	public static void main(String[] args)
	{
		int target = Integer.parseInt(args[0]);
		System.out.println(calc(target));
	}
	
	private static int calc(int target)
	{
		List<Integer> ways = new ArrayList<>();
		for(int i = 0; i <= target + 1; i++)
		{
			ways.add(1);
		}
		for(int i = 2; i < target; i++)
		{
			for(int j = i; j <= target; j++)
			{
				ways.set(j + 1, ways.get(j + 1) + ways.get(j + 1 - i));
			}
		}
		return ways.get(ways.size() - 1);
	}
}

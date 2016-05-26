import java.util.*;

public class euler31
{
	public static void main(String[] args)
	{
		int target = Integer.parseInt(args[0]);
		calc(target);
	}
	
	private static int calc(int target)
	{
		int[] coinSizes = new int[]{1, 2, 5, 10, 20, 50, 100, 200};
		ArrayList<Integer> ways = new ArrayList<>();
		for(int i = 0; i <= target; i++)
		{
			ways.add(0);
		}
		ways.set(0, 1);
		for(int i = 0; i < coinSizes.length; i++)
		{
			for(int j = coinSizes[i]; j < target + 1; j++)
			{
				ways.set(j, ways.get(j) + ways.get(j - coinSizes[i]));
			}
		}
		return ways.get(ways.size() - 1);
	}
}

import java.util.*;

public class euler52
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		calc(limit);
	}
	
	private static int calc(int limit)
	{
		int num = 0;
		for(int i = 5; i <= limit; i++)
		{
			String[] x1 = String.valueOf(i).split("");
			String[] x2 = String.valueOf(i * 2).split("");
			String[] x3 = String.valueOf(i * 3).split("");
			String[] x4 = String.valueOf(i * 4).split("");
			String[] x5 = String.valueOf(i * 5).split("");
			String[] x6 = String.valueOf(i * 6).split("");
			Arrays.sort(x1);
			Arrays.sort(x2);
			Arrays.sort(x3);
			Arrays.sort(x4);
			Arrays.sort(x5);
			Arrays.sort(x6);
			boolean sameDigits = false;
			if(Arrays.deepEquals(x1, x2) && Arrays.deepEquals(x2, x3) && Arrays.deepEquals(x3, x4) && Arrays.deepEquals(x4, x5) && Arrays.deepEquals(x5, x6))
			{
				sameDigits = true;
				num = i;
			}
		}
		return num;
	}
}

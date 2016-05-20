public class euler6
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		System.out.println(diffe(limit));
	}
	
	private static int diffe(int n)
	{
		int sumDigitsSquare = 0;
		int sumNumberSquare = 0;
		int temp = 0;
		for(int i = 1; i <= n; i++)
		{
			sumDigitsSquare += pow(i, 2);
		}
		for(int i = 1; i <= n; i++)
		{
			temp += i;
		}
		sumNumberSquare = pow(temp, 2);
		int res = sumNumberSquare - sumDigitsSquare;
		if(res < 0)
		{
			return res * -2;
		}
		else
		{
			return res;
		}
	}
	
	private static int pow(int a, int b)
	{
		int r = a;
		for(int i = 1; i < b; i++)
		{
			r *= r;
		}
		return r;
	}
}

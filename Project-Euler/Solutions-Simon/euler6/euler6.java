public class euler6
{
	public static void main(String[] args)
	{
		diffe(100);
	}
	
	private static void diffe(int n)
	{
		int sumFirst = 0;
		int temp = 0;
		for(int i = 1; i <= n; i++)
		{
			sumFirst += pow(i, 2);
		}
		for(int i = 1; i <= n; i++)
		{
			temp += i;
		}
		int sumSecond = pow(temp, 2);
		int difference = sumSecond - sumFirst;
		System.out.println("sumFirst: " + sumFirst);
		System.out.println("sumSecond: " + sumSecond);
		System.out.println("Difference: " + difference);
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

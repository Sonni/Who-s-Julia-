public class euler1 {
	public static void main (String[] args)
	{
		System.out.println(f1(1000));
	}
	
	private static int f1 (int n)
	{
		int sum = 0;
		for (int i = 1; i < n; i++)
		{
			if (i % 3 == 0 || i % 5 == 0)
			{
				sum += i;
			} 
		}
		return sum;
	}
}

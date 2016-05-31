public class euler1 {
	public static void main (String[] args)
	{
		//f1(Integer.parseInt(args[0]));
		f1(Long.parseLong(args[0]));
	}

	private static long f1 (long n)
	{
		long sum = 0;
		for (long i = 1; i < n; i++)
		{
			if (i % 3 == 0 || i % 5 == 0)
			{
				sum += i;
			}
		}
		return sum;
	}
}

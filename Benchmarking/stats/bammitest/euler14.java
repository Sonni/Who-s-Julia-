public class euler14
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		seq(limit);
	}
	
	private static long seq(int n)
	{
		long max = 0;
		long maxNumber = 0;
		long countSeq;
		long temp;
		long current;
		for(int i = 1; i < n+1; i++)
		{
			countSeq = 1;
			temp = i;
			current = i;
			while(current != 1)
			{
				if(current % 2 == 0)
				{
					current = current / 2;
					countSeq += 1;
				}
				else
				{
					current = 3 * current + 1;
					countSeq += 1;
				}				
			}
			if(countSeq > max)
			{
				max = countSeq;
				maxNumber = temp;
			}
		}
		return maxNumber;
	}
}

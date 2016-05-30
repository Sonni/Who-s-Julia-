public class euler76
{
	public static void main(String[] args)
	{
		int target = Integer.parseInt(args[0]);
		System.out.println(calc(target, target - 1));
	}
	
	private static int calc(int target, int k)
	{
		if(target == 0 || k == 1)
		{
			return 1;
		}
		else if(target < 0 || k <= 0)
		{
			return 0;
		}
		return calc(target, k - 1) + calc(target - k, k);
	}
}

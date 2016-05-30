public class euler31
{
	public static void main(String[] args)
	{
		int target = Integer.parseInt(args[0]);
		System.out.println(calc(target));
	}
	
	private static int calc(int target)
	{
		int result = 0;
		for(int i = target; i >= 0; i -= target)
		{
			for(int j = i; j >= 0; j -= 100)
			{
				for(int k = j; k >= 0; k -= 50)
				{
					for(int x = k; x >= 0; x -= 20)
					{
						for(int y = x; y >= 0; y -= 10)
						{
							for(int z = y; z >= 0; z -= 5)
							{
								for(int w = z; w >= 0; w -= 2)
								{
									result += 1;
								}
							}
						}
					}
				}
			}
		}
		return result;
	}
}

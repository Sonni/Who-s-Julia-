public class euler36
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		System.out.println(calc(limit));
	}
	
	private static int createPalindrome(int input, int base, boolean isOdd)
	{
		int n = input;
		int palin = input;
		if(isOdd)
		{
			n = n / base;
		}
		while(n > 0)
		{
			palin = palin * base + (n % base);
			n = n / base;
		}
		return palin;
	}
	
	private static boolean isPalindrome(int number, int base)
	{
		int reversed = 0;
		int k = number;
		while(k > 0)
		{
			reversed = base * reversed + (k % base);
			k = k / base;
		}
		if(number == reversed)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	private static int calc(int limit)
	{
		int result = 0;
		for(int j = 1; j <= 2; j++)
		{
			boolean isOdd;
			if(j % 2 == 0)
			{
				isOdd = false;
			}
			else
			{
				isOdd = true;
			}
			int i = 1;
			int number;
			while((number = createPalindrome(i, 10, isOdd)) < limit)
			{
				if(isPalindrome(number, 2))
				{
					result += number;
				}
				i += 1;
			}
		}
		return result;
	}
}

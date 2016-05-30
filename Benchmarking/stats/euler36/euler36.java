import java.util.*;

public class euler36
{
	public static void main(String[] args)
	{
		int limit = Integer.parseInt(args[0]);
		calc(limit);
	}
	
	private static boolean isPalindrome(String s)
	{
		int i = 0;
		int j = s.length() - 1;
		boolean isPal = true;
		while(i <= j - 1)
		{
			if(s.charAt(i) == s.charAt(j))
			{
				i += 1;
				j -= 1;
			}
			else
			{
				isPal = false;
				return isPal;
			}
		}
		return isPal;
	}
	
	private static String binary(int n)
	{
		List<String> bina = new ArrayList<>();
		while(n > 0)
		{
			if(n % 2 == 0)
			{
				bina.add("0");
			}
			else
			{
				bina.add("1");
			}
			n = n / 2;
		}
		String s = "";
		for(String i : bina)
		{
			s = i + s;
		}
		return s;
	}
	
	private static int calc(int limit)
	{
		int sum = 0;
		for(int i = 1; i <= limit; i++)
		{
			String b = binary(i);
			if(isPalindrome(String.valueOf(i)) && isPalindrome(b))
			{
				System.out.println(String.valueOf(i) + " " + b);
				sum += i;
			}
		}
		return sum;
	}
}

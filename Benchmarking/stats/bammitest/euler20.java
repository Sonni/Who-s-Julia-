import java.math.*;

public class euler20
{
	public static void main(String[] args)
	{
		int num = Integer.parseInt(args[0]);
		sum_digits(fact(num));
	}
	
	private static int sum_digits(BigInteger l)
	{
		int sum = 0;
		String s = String.valueOf(l);
		for(int i = 0; i < s.length(); i++)
		{
			sum += Character.getNumericValue(s.charAt(i));
		}
		return sum;
	}
	
	private static BigInteger fact(int n)
	{
		BigInteger res = BigInteger.valueOf(1);
		for(int i = n; i >= 1; i--)
		{
			res = res.multiply(BigInteger.valueOf(i));
		}
		return res;
	}
}

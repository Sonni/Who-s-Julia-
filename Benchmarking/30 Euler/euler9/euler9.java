import java.util.*;

public class euler9
{
	public static void main(String[] args)
	{
		long number = Long.parseLong(args[0]);
        pytha(number);
	}
	
	private static long pytha(long number)
	{
		HashMap<String, Long> dicto = new HashMap<>();
		long range = (long) Math.floor(number / 2);
		for(long a = 1; a < range; a++)
		{
			for(long b = a + 1; b < range; b++)
			{
				long c = number - a - b;
				if(a * a + b * b == c * c)
				{
					dicto.put("a", a);
					dicto.put("b", b);
					dicto.put("c", c);
				}
			}
		}
		
		long x = dicto.get("a") * dicto.get("b") * dicto.get("c");
		return x;
	}
}

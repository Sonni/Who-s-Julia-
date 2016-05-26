import java.util.*;

public class euler2
{
	public static void main (String[] args)
	{
		fibo(Integer.parseInt(args[0]));
	}
	
	private static int fibo(int n)
	{
		List<Integer> array = new ArrayList<>();
		array.add(1);
		array.add(1);
		boolean go = true; 
		int s = 0;
		int i = 2;
		int x = 0;
		while(go)
		{
			x = array.get(i-2) + array.get(i-1);
			if(x<n)
			{
				array.add(x);
				i += 1;
				if(x % 2 == 0)
				{
					s += x;
				}
			}
			else
			{
				go = false;
			}
		}
		return s;
	}
}

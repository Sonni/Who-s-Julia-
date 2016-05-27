import java.util.*;

public class euler4
{
	public static void main(String[] args)
	{
		int min = Integer.parseInt(args[0]);
		int max = Integer.parseInt(args[1]);
		System.out.println(checkNumber(min, max));
	}
	
	private static List<Integer> digitsInArray(int n)
	{
		List<Integer> arr = new ArrayList<>();
		int d;
		int k;
		while(n > 0)
		{
			d = (int) Math.floor(n / 10);
			k = n - d * 10;
			n = d;
			arr.add(k);
		}
		Collections.reverse(arr);
		return arr;
	}
	
	private static boolean isPalindrome(List<Integer> array)
	{
		int i = 0;
		int j = array.size()-1;
		boolean isPal = true;
		while(i <= j)
		{
			if(array.get(i) == array.get(j))
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
	
	private static int checkNumber(int min, int max)
	{
		int maxNum = 0;
		boolean found = false;
		boolean cycleDone = false;
		int k;
		boolean result;
		while(!found)
		{
			for(int x = max; x >= min; x--)
			{
				for(int y = max; y >= min; y--)
				{
					k = x * y;
					result = isPalindrome(digitsInArray(k));
					if(result && k > maxNum)
					{
						maxNum = k;
						found = true;
					}
				}
			}
			cycleDone = true;
			if(cycleDone && !found)
			{
				break;
			}
		}
		return maxNum;
	}
}

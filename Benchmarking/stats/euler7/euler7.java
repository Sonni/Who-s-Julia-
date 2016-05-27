import java.util.*;

public class euler7
{
	public static void main(String[] args)
	{
		int primeNumber = Integer.parseInt(args[0]);
		System.out.println(findPrime(primeNumber));
	}
	
	private static int findPrime(int primeNumber)
	{
		List<Integer> arrayPrimes = new ArrayList<>();
		int counter = 0;
		int number = 2;
		while(counter < primeNumber)
		{
			if(isPrime(number))
			{
				counter += 1;
				if(counter == primeNumber)
				{
					break;
				}
			}
			number += 1;
		}
		if(counter == primeNumber)
		{
			return number;
		}
		return 0;
	}
	
	private static boolean isPrime(int x)
	{
		int divisor = 2;
		boolean prime = true;
		while(divisor < x)
		{
			if(x % divisor ==0)
			{
				prime = false;
				break;
			}
			divisor += 1;
		}
		return prime;
	}
}

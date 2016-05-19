import java.util.*;

public class euler7
{
	public static void main(String[] args)
	{
		findPrime();
	}
	
	private static void findPrime()
	{
		List<Integer> arrayPrimes = new ArrayList<>();
		int counter = 0;
		int number = 2;
		int primeNumber = 10001;
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
		arrayPrimes.add(number);
		System.out.println(arrayPrimes.get(arrayPrimes.size() - 1));
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

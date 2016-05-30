import java.util.*;
import java.math.*;

public class euler15
{
	public static void main(String[] args)
	{
		int siz = Integer.parseInt(args[0]);
		System.out.println(calc(siz));
	}	
	
	private static BigInteger calc(int siz)
	{
		ArrayList<BigInteger> tmp = new ArrayList<>();
		for(int i = 0; i <= siz; i++)
		{
			tmp.add(BigInteger.valueOf(1));
		}
		ArrayList<ArrayList<BigInteger>> mat = new ArrayList<>();
		for(int i = 0; i <= siz; i++)
		{
			mat.add(new ArrayList<>(tmp));
		}
		
		for(int j = siz-1; j >= 0; j--)
		{
			for(int i = siz-1; i >= 0; i--)
			{
				mat.get(i).set(j, mat.get(i).get(j+1).add(mat.get(i+1).get(j)));
			}
		}
		
		return mat.get(0).get(0);
	}
}

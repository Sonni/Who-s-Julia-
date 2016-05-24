import java.io.*;

public class euler8
{
	public static void main(String[] args)
	{
		String str;
		try 
		(
			InputStream fis = new FileInputStream(args[0]);
			InputStreamReader isr = new InputStreamReader(fis);
			BufferedReader br = new BufferedReader(isr);
		) 
		{
			str = br.readLine();
			System.out.println(adja(str));
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	private static long adja(String str)
	{
		long currentProd = 1;
		long maxProd = 0;
		for(int i = 0; i < str.length()-12; i++)
		{
			for(int j = 0; j < 13; j++)
			{
				currentProd = currentProd * Character.getNumericValue(str.charAt(i+j));
			}
			if(i==88)
			{
				System.out.println(i);
				System.out.println(currentProd);
			}
			if(currentProd > maxProd)
			{
				maxProd = currentProd;
			}
			currentProd = 1;
		}
		return maxProd;
	}
}

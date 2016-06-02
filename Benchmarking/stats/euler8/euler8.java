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
			String line = null;
			long maxi = 0;
			while((line = br.readLine()) != null)
			{
				long temp = adja(line);
				if(temp > maxi){
					maxi = temp;
				}
			}
			//System.out.println(maxi);
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
			if(currentProd > maxProd)
			{
				maxProd = currentProd;
			}
			currentProd = 1;
		}
		return maxProd;
	}
}

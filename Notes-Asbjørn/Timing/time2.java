
public class time2
{
	public static void main (String[] args) throws InterruptedException
	{
                long tStart = System.currentTimeMillis();
		int t = 10000;
		while(true)
		{
			if(System.currentTimeMillis() - tStart > t)
			{
				break;
			}
		}
                System.out.println("10 second wait took " + (System.currentTimeMillis() - tStart) + "ms" );
	}
}

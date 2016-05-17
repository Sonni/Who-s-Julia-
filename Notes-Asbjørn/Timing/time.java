
public class time
{
	public static void main (String[] args) throws InterruptedException
	{
                long tStart = System.currentTimeMillis();
		Thread.sleep(10000);
                System.out.println("10 second wait took " + (System.currentTimeMillis() - tStart) + "ms" );
	}
}

import java.util.*;
import java.lang.management.*;

public class time2
{
	public static void main (String[] args) throws InterruptedException
	{
		long time = 0l;
		for(int i = 0; i < 5; i++)
		{
			if(i % 2 == 0)
			{
				time = bababa();
			}
			else
			{
				rarara();
			}
		}
        
        System.out.println("10 second wait took " + time/1000000 + "ms" );
	}
	
	private static long rarara()
	{
		ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
        long tStart = threadMXBean.getCurrentThreadCpuTime();
		Random rand = new Random();
		ArrayList<Integer> hej = new ArrayList<>();
		for(int i = 0; i < 100; i++)
		{
			hej.add(rand.nextInt(999) + i);
		}
		return threadMXBean.getCurrentThreadCpuTime() - tStart;
	}
	
	private static long bababa()
	{
		ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
        long tStart = threadMXBean.getCurrentThreadCpuTime();
		long t = 10000000000l;
		while(true)
		{
			if(threadMXBean.getCurrentThreadCpuTime() - tStart > t)
			{
				break;
			}
		}
		return threadMXBean.getCurrentThreadCpuTime() - tStart;
	}
}

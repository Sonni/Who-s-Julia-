import java.lang.reflect.Array;
import java.util.Arrays;

public class main
{

	public static void main(String[] args)
	{
		

		//doAndMeasure("Quicksort", main::run);
		run();
	}
	
	public static void run()
	{
		int[] a = new int[10];
		a[0] = 5;
		a[1] = 3;
		a[2] = 100;
		a[3] = -4032;
		a[4] = 8;
		a[5] = 10;
		a[6] = -4;
		a[7] = 59;
		a[8] = 0;
		a[9] = 6;
		
		quicksortDualPivot(a, 0, 9);

		System.out.println(Arrays.toString(a));
	}


	public static void quicksort(int[] a, int s, int e)
	{
		if (s < e)
		{
			final int pivot = a[e];
			int pointer = s;
			for (int i = s; i < e; i++)
			{
				if (a[i] <= pivot)
				{
					swap(a, pointer, i);
					pointer++;
				}
			}
			swap(a, pointer, e);
			
			quicksort(a, s, pointer - 1);
			quicksort(a, pointer, e);
		}
	}

	public static void quicksortDualPivot(int[] a, int s, int e) {
	    if (e > s) 
	    {
	        //use start and end elements as pivots (a[s] must be smaller than a[e])
	        if (a[s] > a[e]) 
	        	swap(a, s, e);
	        
	        final int leftPiv = a[s];
	        final int rightPiv = a[e];

	        // leftPiv < ]leftPoi;rightPoi[ < righPiv
	        int leftPoi = s + 1;  
	        int rightPoi = e - 1;
	        
	        int curEle = leftPoi; //curEle is the current element we're looking at
	        
	        while (curEle <= rightPoi) 
	        {
	            if (a[curEle] < leftPiv) 
	            {
	                swap(a, curEle, leftPoi);
	                leftPoi++;
	            } 
	            else if (a[curEle] >= rightPiv) 
	            {
	                while (a[rightPoi] > rightPiv && curEle < rightPoi) 
	                	rightPoi--;
	                
	                swap(a, curEle, rightPoi);
	                rightPoi--;
	                if (a[curEle] < leftPiv) 
	                {
	                    swap(a, curEle, leftPoi);
	                    leftPoi++;
	                }
	            }
	            curEle++;
	        }
	        leftPoi--; 
	        rightPoi++;

	        //swap the pivots
	        swap(a, s, leftPoi); 
	        swap(a, e, rightPoi);

	        quicksortDualPivot(a, s, leftPoi - 1);
	        quicksortDualPivot(a, leftPoi + 1, rightPoi - 1);
	        quicksortDualPivot(a, rightPoi + 1, e);
	    }
	}

	public static void swap(int[] a, int i, int j) 
	{
	    final int tmp = a[i]; 
	    a[i] = a[j]; 
	    a[j] = tmp;
	}
	
	public static void doAndMeasure(String caption, Runnable runnable)
	{
		long tStart = System.currentTimeMillis();
		runnable.run();
		System.out.println(caption + " took " + ((long)System.currentTimeMillis() - tStart) + "ms");
	}

}


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Random;

public class quicksort
{
    
    public static void main(String[] args)
    {
        try {
            quicksort.run(args[0]);
            //quicksort.run("dualquicksort", "data.txt");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    private static void run(String arg1) throws FileNotFoundException, IOException
    {
        int[] array;
        try (BufferedReader br = new BufferedReader(new FileReader(arg1))) {
            String line = br.readLine();
            String[] lines = line.split(" ");
            array = new int[lines.length];
            for (int i = 0; i < lines.length; i++)
            {
                array[i] = Integer.parseInt(lines[i]);
            }
        }

        
        int jumpLength = 125;
        int i = 0;
        boolean shouldBreak = false;
        while (true)
        {
            i += jumpLength;
            if (i > array.length - 1)
            {
                i = array.length - 1;
                shouldBreak = true;
            }
            quicksortDualPivot(array, 0, i);
            
            
            if (shouldBreak)
                break;
        }
        /*
        		if (arg1.equals("dualquicksort"))
        			quicksortDualPivot(array, 0, array.length - 1);
        		if (arg1.equals("quicksort"))
        			quicksort(array, 0, array.length - 1);*/
        
        //Arrays.sort(array);
        
        	//System.out.println(Arrays.toString(array));
    }
    
    
    private static void quicksort(int[] a, int s, int e)
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
    
    private static void quicksortDualPivot(int[] a, int s, int e) {
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
    
    private static void swap(int[] a, int i, int j)
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
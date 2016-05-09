function quicksort(a, s, e)
  if s < e
    pivot = a[e]
		pointer = s
		for i = s: e - 1
			if a[i] <= pivot
				swap(a, pointer, i)
				pointer += 1
			end
		end
		swap(a, pointer, e)

		quicksort(a, s, pointer - 1)
		quicksort(a, pointer, e)
  end
end

function quicksortDualPivot(a, s, e)
  if e > s

	  if (a[s] > a[e])
	    swap(a, s, e)
    end

	  leftPiv = a[s]
	  rightPiv = a[e]

	  leftPoi = s + 1
	  rightPoi = e - 1

	  curEle = leftPoi

	  while curEle <= rightPoi
	     if a[curEle] < leftPiv
	        swap(a, curEle, leftPoi)
	        leftPoi += 1
	     elseif a[curEle] >= rightPiv
	        while a[rightPoi] > rightPiv && curEle < rightPoi
	           rightPoi -= 1
          end

	        swap(a, curEle, rightPoi)
	        rightPoi -= 1
	        if (a[curEle] < leftPiv)
	            swap(a, curEle, leftPoi)
	            leftPoi += 1
          end
        end
	       curEle += 1
       end
	        leftPoi -= 1
	        rightPoi += 1

	        swap(a, s, leftPoi)
	        swap(a, e, rightPoi)

	        quicksortDualPivot(a, s, leftPoi - 1)
	        quicksortDualPivot(a, leftPoi + 1, rightPoi - 1)
	        quicksortDualPivot(a, rightPoi + 1, e)
  end
end

function swap(a, i, j)
  tmp = a[i]
  a[i] = a[j]
  a[j] = tmp
end

a = [5 3 100 -4032 8 10 -4 59 0 6]
quicksortDualPivot(a, 1, 10)
println(a)

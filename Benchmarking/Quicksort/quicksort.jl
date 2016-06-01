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

#Load input
f = open(ARGS[1])
s = readall(f)
ss = split(s)
data = []
for i = 1 : length(ss)
	push!(data, parse(Int32, ss[i]))
end
close(f)


jumpLength = 125
i = 0
shouldBreak = false;

while true
	i += jumpLength
	if i > length(data)
		i = length(data)
		shouldBreak = true
	end

	quicksortDualPivot(data, 1, i)

	if shouldBreak == true
		break
	end
end
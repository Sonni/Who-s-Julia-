#=
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
=#
#Answer:

#Terminal: Julia euler47.jl 4 1000000
cons = parse(Int, ARGS[1])
limit = parse(Int, ARGS[2])

function numFactors(number, primeList)
  nod = 0
  pf = false
  remain = number

  for i = 1 : length(primeList)
    if primeList[i] * primeList[i] > number
      nod += 1
      return nod
    end

    pf = false
    while rem(remain, primeList[i]) == 0
      pf = true
      remain = div(remain, primeList[i])
    end
    if pf
      nod += 1
    end

    if remain == 1
      return nod
    end
  end
  return nod
end

function getPrimes(size)
	array = fill(true, size)
	c = 1
	for i = 2 : size
		if array[i] == true
			j = i + i
			while j <= size
				array[j] = false
				j += i
			end
			c += 1
		end
	end
	primeArray = Int[]
	for i = 2 : size
		if(array[i])
			push!(primeArray, i)
		end
	end
	return primeArray
end

function calc(limit, consec)
  primeList = getPrimes(limit)
  targetpf = consec
  targetcons = consec
  cons = 1
  result = 1

  while cons < targetcons
    result += 1
    if numFactors(result, primeList) >= targetpf
      cons += 1
    else
      cons = 0
    end
  end
  return result-3
end

println(calc(limit, cons))
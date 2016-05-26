#=
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
=#
#Answer: 997651

#Terminal: Julia euler50.jl 1000000

limit = parse(Int, ARGS[1])

function getPrimes(size)
	array = fill(true, size)
	array[1] = false
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
  return array
end

function calc(limit)
  primes = getPrimes(limit)
  maxSeq = 0
  maxPrime = 0
  for i = 2 : limit - 1
    sum = 0
    seq = 0
    for j = i : limit - 1
      if primes[j] == true
        sum += j
        seq += 1
        if sum > limit
          break
        end
        if primes[sum] == true
          if seq > maxSeq
            maxSeq = seq
            maxPrime = sum
          end
        end
      end
    end
  end
  return maxPrime
end

calc(limit)

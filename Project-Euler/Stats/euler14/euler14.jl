#=
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=#
#Answer: 837799

#Terminal: Julia euler14.jl 1000000
limit = parse(Int, ARGS[1])
function seq(n)
  max = 0
  maxNumber = 0
  for i = 1 : n
    countSeq = 1
    temp = i
    current = i
    while current != 1
      if current % 2 == 0
        current = current / 2
        countSeq += 1
      else
        current = 3 * current + 1
        countSeq += 1
      end
    end
    if countSeq > max
      max = countSeq
      maxNumber = temp
    end
  end
  return maxNumber
end

println(seq(limit))

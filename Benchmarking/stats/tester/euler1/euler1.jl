#Find the sum of all the multiples of 3 or 5 below 1000.
#Answer: 233168

#Terminal: julia euler1.jl 1000
limit = parse(Int, ARGS[1])
function f1(n)
  sum = UInt128(0)
  for i = 1:n-1
      if i%3 == 0 || i%5 == 0
        sum += i
      end
  end
  return sum
end
f1(limit)

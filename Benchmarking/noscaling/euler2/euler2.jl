#=
  Fibonacci numbers
  By considering the terms in the Fibonacci sequence whose values
  do not exceed four million, find the sum of the even-valued terms.
=#
#Answer: 4613732

  #Terminal: julia euler2.jl 4000000
limit = parse(Int128, ARGS[1])

function fibo(n)
  array = Int128[1, 1]
  i = 3
  go = true
  sum = Int128(0)
  while go
    x = array[i-2] + array[i-1]
    if x < n
      push!(array, x)
      i += 1
      if x % 2 == 0
        sum += x
      end
    else
      go = false
    end
  end
  return sum
end

println(fibo(limit))

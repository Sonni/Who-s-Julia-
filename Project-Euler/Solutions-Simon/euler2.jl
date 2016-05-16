#=
  Fibonacci numbers
  By considering the terms in the Fibonacci sequence whose values
  do not exceed four million, find the sum of the even-valued terms.
=#
function printsum(a)
    # summary generates a summary of an object
    println(repr(a))
end

function fibo(n)
  array = Int64[1, 1]
  i = 3
  go = true
  sum = 0
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
#=
  for temp in array
    #println("hej")
    if temp % 2 == 0
      sum += temp
    end
  end
=#
println(sum)
printsum(array)
end

fibo(4_000_000)

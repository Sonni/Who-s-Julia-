#=
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
=#
#Answer: 1366

#Terminal: julia euler16.jl 2 1000
#args[1] = 2
#args[2] = 1000
num = parse(Int, ARGS[1])
power = parse(Int, ARGS[2])

#Guess on needed size for all inputs.
arrSize = power
arr = zeros(Int, arrSize)
#Setting number to num^1
arr[1] = num

function calc(arr)
  sum = 0
  carry = 0
  for i = 2 : power
    for j = 1 : length(arr)
      temp = arr[j] * 2
      if temp > 9
        arr[j] = temp % 10 + carry
        carry = 1
      else
        arr[j] = temp + carry
        carry = 0
      end
    end
  end

  for i = 1 : length(arr)
    sum += arr[i]
  end
  return sum
end

calc(arr)


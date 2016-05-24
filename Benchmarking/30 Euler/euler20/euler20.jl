#=
Problem 20
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
=#
#Answer: 648

#Terminal: Julia euler20.jl 100
num = parse(Int, ARGS[1])

arr = Int[]
push!(arr, 1)

function calc(arr, num)
  sum = 0
  carry = 0
  #for loop which calculates num! and puts number array.
  for i = 2 : num #i = current number to muliple with
    len = length(arr)
    for j = len : -1 : 1
      temp = arr[j] * i
      if temp > 9
        while temp > 9
          temp -= 10
          carry += 1
        end
        arr[j] = temp
        if j == len
          push!(arr, carry)
        else
          arr[j + 1] += carry
        end
        carry = 0
      else
        arr[j] = temp
      end
    end
    #For loop checking all elements in list if num > 9. Adds carry to the next number.
    for j = 1 : length(arr)
      temp = arr[j]
      if temp > 9
        while temp > 9
          temp -= 10
          carry += 1
        end
        arr[j] = temp
        if carry > 0 && j == length(arr)
          push!(arr, carry)
        elseif carry > 0
          arr[j + 1] += carry
        end
        carry = 0
      end
    end
  end
  #sums the digits in the array
  for i = 1 : length(arr)
    sum += arr[i]
  end
  return sum
end

println(calc(arr, num))































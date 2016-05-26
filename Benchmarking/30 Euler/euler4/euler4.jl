#=
A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
=#

#Answer: 906609

#Terminal: Julia euler4.jl 100 999
#Interval for calculating palindrome: 100-999 finds largest 3-digit palindrome.
min = parse(Int, ARGS[1])
max = parse(Int, ARGS[2])
function digitsInArray(n)
  arr = Int[]
  while n > 0
      d = round(Int, floor(n / 10))
      k = n - d * 10
      n = d
      push!(arr, k)
  end
  b = reverse(arr)
  return b
end

function isPalindrome(array)
  i = 1
  j = length(array)
  isPal = true
    while i <= j
      if array[i] == array[j]
        i += 1
        j -= 1
      else
        isPal = false
        return isPal
      end
    end
  return isPal
end

function checkNumber(min, max)
  maxNum = 0
  found = false
  cycleDone = false
  while !found
    for x in max:-1:min
      for y in max:-1:min
        k = x * y
        result = isPalindrome(digitsInArray(k))
        #println(k)
        if result
          if k > maxNum
            maxNum = k
            #println(max)
            #resultArray = [x, y]
            found = true
          end
        end
      end
    end
    cycleDone = true
    if cycleDone && !found
      break
    end
  end
  return maxNum
end

checkNumber(min, max)

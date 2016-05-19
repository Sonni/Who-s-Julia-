#=
A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
=#

#Answer: 906609

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
  #s = ""
    while i <= j
      if array[i] == array[j]
        i += 1
        j -= 1
        #a = array[i]
        #b = array[j]
      else
        isPal = false
        return isPal
      end
    end
  #=
  for c in array
    s = string(s, c)
  end
  =#
  return isPal
end

function checkNumber()
  resultArray = Int[]
  max = 0
  found = false
  cycleDone = false
  while !found
    for x in max:-1:min
      for y in max:-1:min
        k = x * y
        result = isPalindrome(digitsInArray(k))
        if result
          if k > max
            max = k
            resultArray = [x, y]
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
  a = resultArray[1]
  b = resultArray[2]
  res = a * b
  println("Largest palindrome: $a * $b = $res")
end

#println(@elapsed checkNumber())
checkNumber()

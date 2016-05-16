#=
A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
=#

#=
  functions
=#
function digitsInArray(number)
  array = Int64[]
  while number > 0
    d = number % 10
    push!(array, floor(Int, d))
    number = floor(number / 10)
  end
  reverse!(array)
  return array
end
println(digitsInArray(090090))

function isPalindrome(array)
  i = 1
  j = length(array)
  isPal = true
  s = ""
    while i <= j
      if array[i] == array[j]
        i += 1
        j -= 1
        a = array[i]
        b = array[j]
      else
        isPal = false
        break
      end
    end
  for c in array
    s = string(s, c)
  end
  return isPal
end

function checkNumber()
  resultArray = Int64[2]
  max = 0
  found = false
  cycleDone = false
  while !found
    for x in 999:-1:100
      for y in 999:-1:100
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
  println(resultArray)
end

#println(@elapsed checkNumber())
#@time checkNumber()

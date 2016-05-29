#=
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
=#
#Answer: 872187

#Terminal: julia euler36.jl 1000000
limit = parse(Int, ARGS[1])

function isPalindrome(s)
  #returns true if num is a palindrome
  if typeof(s) == Int
    s = string(s)
  end
  i = 1
  j = length(s)
  isPal = true
  while i <= j
    if s[i] == s[j]
      i += 1
      j -= 1
    else
      isPal = false
      return isPal
    end
  end
  return isPal
end

function binary(n)
  #Returns binary representation of n, as a string
  bina = Int8[]
  while n > 0
    if n % 2 == 0
      push!(bina, 0)
    else
      push!(bina, 1)
    end
    n = div(n, 2)
  end
  s = ""
  for i in bina
    s = string(i, s)
  end
  return s
end


function calc(limit)
  sum = UInt128(0)
  numbers = Int[]
  for i = 1 : limit
    b = binary(i) #Binary representation of i
    if isPalindrome(i) && isPalindrome(b)
      sum += i
      push!(numbers, i)
    end
  end
  return sum
end

println(calc(limit))





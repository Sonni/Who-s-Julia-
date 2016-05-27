#=
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
=#
#Answer: 872187

#Terminal: Julia euler36.jl 1000000

limit = parse(Int, ARGS[1])

function createPalindrome(input, base, isOdd)
  n = input
  palin = input
  if isOdd
    n = div(n, base)
  end

  while n > 0
    palin = palin * base + rem(n, base)
    n = div(n, base)
  end
  return palin
end

function isPalindrome(number, base)
  reversed = 0
  k = number
  while k > 0
    reversed  = base * reversed + rem(k, base)
    k = div(k, base)
  end
  if number == reversed
    return true
  else
    return false
  end
end

function calc(limit)
  result = 0

  for j = 1 : 2
    if j % 2 == 0
      isOdd = false
    else
      isOdd = true
    end
    i = 1
    while (number = createPalindrome(i, 10, isOdd)) < limit
      if isPalindrome(number, 2)
        result += number
      end
      i += 1
    end
  end
  return result
end

println(calc(limit))












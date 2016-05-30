#=
Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly 99%.
=#
#Answer: 1587000

#Terminal: julia euler11.jl 99.00
prop = parse(Float64, ARGS[1])
#num = parse(Int, ARGS[2])

function kind(n)
  #Returns -1 for decreasing
  #Returns 0 for bouncy
  #Returns 1 for increasing
  s = string(n)
  l = length(s)
  i = 1
  j = i + 1
  decr, bouncy, incr = false, false, false
  while j <= l
    a = parse(Int8, s[i])
    b = parse(Int8, s[j])
    if s[i] > s[j]
      decr = true
    elseif s[i] < s[j]
      incr = true
    end
    i += 1
    j += 1
  end
  if decr && incr
    return true #Number is bouncy
  end
  return false
end

function calc(prop)
  currentProp = Float64(0)
  i = UInt128(100) #Starting number
  countBouncy = 0
  while currentProp < prop
    if kind(i)
      countBouncy += 1
    end

    currentProp = (countBouncy * 100) / i

    if currentProp >= prop
      return i
    end
    i += 1
  end
  
  return "Proportion was not reached."
end

calc(prop)


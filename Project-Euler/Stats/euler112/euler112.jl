#=
Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly 99%.
=#
#Answer: 1587000

#Terminal: julia euler112.jl 10000000
limit = parse(Int, ARGS[1])

function bouncy(number)
  inc = false
  dec = false

  last = rem(number, 10)
  number = div(number, 10)

  while number > 0
    next = rem(number, 10)
    number = div(number, 10)

    if next < last
      inc = true
    elseif next > last
      dec = true
    end
    last = next

    if dec && inc
      return true
    end
  end
  return dec && inc
end

function calc(limit)
  i = 99
  bouncies = 0

  while 100 * bouncies < 99 * i
    i += 1
    if bouncy(i)
      bouncies += 1
    end
  end
  return i
end

println(calc(limit))
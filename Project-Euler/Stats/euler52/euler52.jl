#=
It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
=#
#Answer: 142857

#Terminal: Julia euler52.jl 1000000

limit = parse(Int, ARGS[1])

function calc(limit)
  num = 0
  for i = 5 : limit
    x1 = sort!(digits(i))
    x2 = sort!(digits(i * 2))
    x3 = sort!(digits(i * 3))
    x4 = sort!(digits(i * 4))
    x5 = sort!(digits(i * 5))
    x6 = sort!(digits(i * 6))

    sameDigits = false
    if x1 == x2 && x2 == x3 && x3 == x4 && x4 == x5 && x5 == x6
      sameDigits = true
      num = i
    end
  end
  return num
end

println(calc(limit))
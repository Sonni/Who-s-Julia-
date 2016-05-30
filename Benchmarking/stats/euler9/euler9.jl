#=
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=#
#Answer: 31875000

#Terminal: julia euler9.jl 1000
number = parse(Int, ARGS[1])

function pytha(number)
  dicto = Dict{ASCIIString, Int64}()
  for a = 1 : div(number, 3)
    for b = a + 1 : div(number, 2)
      c = number - a - b
      if a * a + b * b == c * c
        dicto["a"] = a
        dicto["b"] = b
        dicto["c"] = c
      end
    end
  end
  x = dicto["a"] * dicto["b"] * dicto["c"]
  return Int(x)
end
pytha(number)

#=
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=#

function pytha()
  dicto = Dict{ASCIIString, Int64}()
  number = 1000
  for a=1:number/3
    for b=a+1:number/2
      c = number - a - b
      if a*a + b*b == c*c
        #dicto = Dict([("a", a), ("b", b), ("c", c)])
        dicto["a"] = a
        dicto["b"] = b
        dicto["c"] = c
      end
    end
  end
  println(dicto)
  x = dicto["a"]*dicto["b"]*dicto["c"]
  #x = get!(dicto, "a", 1)*get!(dicto, "b", 1)*get!(dicto, "c", 1)
  return Int64(x)
end
println(pytha())

#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#
#Answer = 232_792_560

#Terminal: julia euler5.jl 20 5000000000
div = parse(Int, ARGS[1])
limit = parse(Int, ARGS[2])

function divisible(div, limit)
  for x = div + 1 : limit #start from above div
    evenlyDivis = true
    for i = 2 : div
      n = x % i
      if !(n == 0)
        evenlyDivis = false
        break
      end
    end
    if evenlyDivis
      return x
    end
  end
end

println(divisible(div, limit))

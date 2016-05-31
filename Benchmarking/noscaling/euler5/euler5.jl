#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#
#Answer = 232_792_560

#Terminal: julia euler5.jl 20 5000000000
divi = parse(Int, ARGS[1])
limit = parse(Int, ARGS[2])

function divisible(divi, limit)
  for x = divi + 1 : limit #start from above div
    evenlyDivis = true
    for i = 2 : divi
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

@time println(divisible(div, limit))

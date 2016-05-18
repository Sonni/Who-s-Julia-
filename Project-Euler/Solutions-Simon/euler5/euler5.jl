#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#

#Answer = 232_792_560
function divisible()
  for x = 21:500_000_000
    evenlyDivis = true
    if x == 500_000_000
      println("Done")
    end
    for i=2:20
      n = x % i
      if !(n == 0)
        #println("not zero")
        evenlyDivis = false
        break
      end
    end
    if evenlyDivis
      println("$x is evenly divisible")
    end
  end
end

divisible()

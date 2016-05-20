#=
A permutation is an ordered arrangement of objects.
For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
If all of the permutations are listed numerically or alphabetically,
we call it lexicographic order.
The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits
0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
=#
#Answer:


#NOTE NOT WORKING

#Terminal: Julia euler24.jl 1000000
numPerm = parse(Int, ARGS[1])
numbers = Int[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

res = Int[]

n = numPerm - 1
m = 362880 # factorial(9)

for i = 9 : -1 : 1
  d = round(Int, floor(n / m))
  n = round(Int, n - d * m)
  if d == 0
    d = 1
  end
  println(d)
  println(n)
  push!(res, numbers[d])
  deleteat!(numbers, d)
  m = m / i
  println(m)
end
push!(res, numbers[1])

println(res)
















#=
What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
=#
#Answer: 4782

fibTerm = parse(Int, ARGS[1])

a = zeros(Int, 5)
b = zeros(Int, 5)
c = zeros(Int, 6)
a[1] = 1
b[1] = 1
counter = 0

for i = 1 : 10
  for j = 1 : 5
    temp = a[j] + b[j]
    if temp > 9
      temp = temp % 10
      x = c[j+1] +1
      c[j] = temp
      c[j+1] = x
      println(c[j+1])
    else
      c[j] = temp #This is overriding
    end
  end
  for k = 1:5
    a[k] = b[k]
    b[k] = c[k]
  end
  println(c)
end
println(c)
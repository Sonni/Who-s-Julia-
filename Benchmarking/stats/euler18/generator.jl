#Terminal: julia gene.jl 299999999 2

lines = parse(Int, ARGS[1])
num = parse(Int, ARGS[2])

name = "data$num.txt"
println(name)
f = open(name, "w")

len = 1
for i=1: lines
  for j = 1 : len
    temp = rand(1:99)
    if temp < 10
      if j == len
        write(f, "0$temp", "\n")
      else
        write(f, "0$temp", " ")
      end
    elseif j == len
      write(f, "$temp", "\n")
    else
      write(f, "$temp", " ")
    end
  end
  len += 1
end

close(f)
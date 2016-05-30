#Terminal: julia gene.jl 299999999 2

size = parse(Int, ARGS[1])
num = parse(Int, ARGS[2])

name = "data$num.txt"
println(name)
f = open(name, "w")

for i=1: size
  for j = 1 : num
    temp = rand(1:9)
    write(f, "$temp", "")
  end
end

close(f)
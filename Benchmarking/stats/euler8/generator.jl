#Terminal: julia gene.jl 9999 1000 2

lines = parse(Int, ARGS[1])
num = parse(Int, ARGS[2])
str = parse(Int, ARGS[3])

name = "data$str.txt"
f = open(name, "w")

for i = 1 : (lines * str) / 10
  for j = 1 : num
    temp = rand(0:9)
    if j == 1
      while temp == 0
        temp = rand(0:9)
      end
    elseif j == num
      write(f, "$temp", "\n")
    else
      write(f, "$temp", "")
    end
  end
end

close(f)
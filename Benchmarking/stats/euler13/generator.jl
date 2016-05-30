#Terminal: julia generator.jl

lines = parse(Int, ARGS[1])
num = parse(Int, ARGS[2])

name = "data$num.txt"
f = open(name, "w")

for i=1: lines
  for j = 1 : 50
    temp = rand(0:9)
    if j == 1
      while temp == 0
        temp = rand(0:9)
      end
    elseif j == 50
      write(f, "$temp", "\n")
    else
      write(f, "$temp", "")
    end
  end
end

close(f)
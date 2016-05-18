size = parse(Int, ARGS[1])


a = rand(100:5000, size, size)

name = "mat$size.txt" 
println(name)
f = open(name, "w")

for i=1: size
	for j=1: size
		tmp = a[i, j]
		if j == size
			write(f, "$tmp", "\n")
		else
			write(f, "$tmp", " ")
		end
	end
end

close(f)

size = parse(Int, ARGS[1])

a = rand(-99999:99999, size)

name = "num$size.txt"
println(name)
f = open(name, "w")

for i=1: size
	tmp = a[i]
	if i != size 
		write(f, "$tmp", " ")
	else
		write(f, "$tmp") 
	end
end

close(f)

function count_heads(n)
    c::Int = 0
    for i=1:n
        c += rand(Bool)
    end
    c
end

a = count_heads(100000000)
b = count_heads(100000000)
c = count_heads(100000000)
d = count_heads(100000000)
println(a+b+c+d)

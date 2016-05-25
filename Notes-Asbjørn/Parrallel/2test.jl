function count_heads(n)
    c::Int = 0
    for i=1:n
        c += rand(Bool)
    end
    c
end

a = @spawn count_heads(100000000)
b = @spawn count_heads(100000000)
c = @spawn count_heads(100000000)
d = @spawn count_heads(100000000)
println(fetch(a)+fetch(b)+fetch(c)+fetch(d))

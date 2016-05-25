function solve(m, n) #m=color block size  n = black box size
  if m > n
    return 0
  end
  solutions = 0

  for i = m : n
    solutions += 1
    solutions += solve(m, n-i)
  end

  return solutions
end

function s(size, numColors)
  result = 0;
  for i = 0 : numColors
     result += solve(2+i, size)
  end
  return result
end

size = parse(Int32, ARGS[1])
numColors = parse(Int32, ARGS[2])

@time println(s(size, numColors))

function solve(tileSize, blockSize) #m=color block size  n = black box size
  if tileSize > blockSize
    return 0
  end
  solutions = 0

  for i = tileSize : blockSize
    solutions += 1
    solutions += solve(tileSize, blockSize-i)
  end

  return solutions
end

function calc(size)
  result = solve(2, size) #Red tiles
  result += solve(3, size) #Green tiles
  result += solve(4, size) #Blue tiles

  return result
end

size = parse(Int32, ARGS[1])

calc(size)
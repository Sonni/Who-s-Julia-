#Terminal: Julia euler11.jl 1000 4
matLength = parse(Int, ARGS[1])
numProd = parse(Int, ARGS[2])

function makeData(matLength)
  mat = zeros(Int, matLength, matLength)
  f = open(string("mat", matLength, ".txt"))

  j = 0

  for l in eachline(f)
    s = split(l)
    j += 1
    for i = 1 : length(s)
      mat[i, j] = parse(Int32, s[i])
    end
  end

  close(f)
  return mat
end

function a(mat, matLength, numProd)
  maxProd = Int64(0)

  for j = 1 : matLength - numProd
    for i = 1 : matLength
      #right/left
      prod = Int64(1)
      for k = 0 : numProd - 1
        prod *= mat[i, j + k]
      end
      if prod > maxProd
        maxProd = prod
      end
      #up/down
      prod = Int64(1)
      for k = 0 : numProd - 1
        prod *= mat[j + k, i]
      end
      if prod > maxProd
        maxProd = prod
      end
    end
  end

  #diagonal left->right
  for j = 1 : matLength - numProd
    for i = 1 : matLength - numProd
      prod = Int64(1)
      for k = 0 : numProd - 1
        prod *= mat[i + k, j + k]
      end
      if prod > maxProd
        maxProd = prod
      end
    end
  end

  #diagonal right->left
  for j = matLength : -1 : numProd
    for i = 1 : matLength - numProd
      prod = Int64(1)
      for k = 0 : numProd - 1
        prod *= mat[i + k, j - k]
      end
      if prod > maxProd
        maxProd = prod
      end
    end
  end

  return maxProd
end
@time data = makeData(matLength)
@time a(data, matLength, numProd)
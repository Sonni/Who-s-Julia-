#Terminal: Julia euler11.jl 1000 4
function a()

  maxProd = 0
  matLength = parse(Int, ARGS[1])
  numProd = parse(Int, ARGS[2])

  #mat = reshape(1:(matLength*matLength), matLength, matLength)
  mat = zeros(Int, matLength, matLength)

  f = open(string("mat", matLength, ".txt"))

  result = 0
  j = 0
  for l in eachline(f)
    s = split(l)
    j += 1
    for i = 1 : length(s)
      mat[j, i] = parse(Int32, s[i])
    end
  end
  close(f)

  for i = 1 : matLength
    for j = 1 : matLength - numProd
      #right/left
      prod = 1
      for k = 0 : numProd - 1
        prod *= mat[i, j + k]
      end
      if prod > maxProd
        maxProd = prod
      end
      #up/down
      prod = 1
      for k = 0 : numProd - 1
        prod *= mat[j + k, i]
      end
      if prod > maxProd
        maxProd = prod
      end
    end
  end

  #diagonal left->right
  for i = 1 : matLength - numProd
    for j = 1 : matLength - numProd
      prod = 1
      for k = 0 : numProd - 1
        prod *= mat[i + k, j + k]
      end
      if prod > maxProd
        maxProd = prod
      end
    end
  end

  #diagonal right->left
  for i = 1 : matLength - numProd
    for j = matLength : -1 : numProd
      prod = 1
      for k = 0 : numProd - 1
        prod *= mat[i + k, j - k]
      end
      if prod > maxProd
        maxProd = prod
      end
    end
  end

  println(maxProd)
end

@time a()

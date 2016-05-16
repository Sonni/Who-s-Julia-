function a()

  maxProd = 0
  matLength = 20
  numProd = 4

  mat = reshape(1:(matLength*matLength), matLength, matLength)

  f = open("mat20.txt")

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
      prod = mat[i, j] * mat[i, j + 1] * mat[i, j + 2] * mat[i, j + 3]
      if prod > maxProd
        maxProd = prod
      end
      #up/down
      prod = mat[j, i] * mat[j + 1, i] * mat[j + 2, i] * mat[j + 3, i]
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

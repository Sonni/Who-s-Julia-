#=
Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
=#
#Answer: 5537376230

#Terminal: Julia euler13.jl data.txt
data = ARGS[1]
function makeData(data)
  f = open(data)
  row = 1
  mat = zeros(Int, 100, 50)
  for l in eachline(f)
    temp = digits(parse(BigInt, l))
    temp2 = reverse(temp)
    col = 1
    for t in temp2
      mat[row, col] = t
      col += 1
    end
    row += 1
  end
  close(f)
  return mat
end

function calc(mat)
  mat_rows, mat_cols = size(mat)
  r = mat_rows
  c = mat_cols
  temp = Int[]

  for col in c:-1:1
    sum = 0
    for row in r:-1:1
      sum += mat[row, col]
    end
    push!(temp, sum)
  end

  i = 1
  while true
    if i < mat_cols
      k = temp[i] % 10
      n = (temp[i] - k) / 10
      temp[i] = k
      temp[i + 1] = temp[i + 1] + n
    else
      k = temp[i] % 10
      n = (temp[i] - k) / 10
      temp[i] = k
      push!(temp, n)
    end
    if temp[end] < 10
      break
    end
    i += 1
  end
  result = ""
  for i=0:9
    result = string(result, temp[end-i])
  end
  return result
end

println(calc(makeData(data)))

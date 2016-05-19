


num = parse(Int, ARGS[1])
power = parse(Int, ARGS[2])
sum = 0

#arr = [2]
arr = zeros(Int, 400)
arr[1] = 2
carry = 0

for i = 1 : power
  #push!(arr, 0)
  for j = 1 : length(arr) #Something else here?
    temp = arr[j] * 2
    if temp > 9
      #println(temp)
      arr[j] = temp % 10 + carry
      carry = 1
    else
      arr[j] = temp + carry
      carry = 0
    end
  end
end
#println(length(arr))

for i = 1 : length(arr)
  sum += arr[i]
  print(arr[i])
end

println("\n$sum")































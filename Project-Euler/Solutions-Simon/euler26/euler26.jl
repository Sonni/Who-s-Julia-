

#NOTE NOT WORKING
sequenceLength = 0
for i = 1000 : -1 : 2
  if sequenceLength >= i
    break
  end
  foundRemainders = zeros(Int, i)

  value = 1
  position = 0

  while foundRemainders[value] == 0 && value != 0
    foundRemainders[value] = position
    value *= 10
    value %= i
    position += 1
  end

  if position - foundRemainders[value] > sequenceLength
    sequenceLength = position - foundRemainders[value]
  end
end
println(sequenceLength)





























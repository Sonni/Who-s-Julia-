#=
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
containing over five-thousand first names, begin by sorting it into
alphabetical order. Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain
a name score.

For example, when the list is sorted into alphabetical order, COLIN,
which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
=#

function split_to_array()
  file = open("names.txt")
  line = readline(file)
  line_new = replace(line, '"', "")
  array = split(line_new, [','])

  close(file)
  return array
end

#println(split_to_array())

#still missing multiply
function value_string()
  letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  names_sorted = sort(split_to_array())
  mapo = Dict{ASCIIString, Int}()
  value = 0
  valueLetter = 1
  mapo_index = 1
  for a in letters
    mapo[a] = valueLetter
    valueLetter += 1
  end
  for word in names_sorted
    value_word = 0
    for ch in word
      value_word += get(mapo, string(ch), 0)
    end
    value += value_word * mapo_index
    mapo_index += 1
  end
  return value
end

println(value_string())

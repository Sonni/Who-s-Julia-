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
#Answer: 871198282

#Terminal: Julia euler22.jl data.txt
path = ARGS[1]
file = open(path)

function namesSorted(file)
  line = readline(file)
  line_new = replace(line, '"', "")
  array = split(line_new, [','])
  close(file)
  names = sort(array)
  return names
end

function letterValues()
  letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  mapo = Dict{ASCIIString, Int}()
  valueLetter = 1
  for a in letters
    mapo[a] = valueLetter
    valueLetter += 1
  end
  return mapo
end

function calc(mapo, names_sorted)
  value = 0
  mapo_index = 1
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

calc(letterValues(), namesSorted(file))

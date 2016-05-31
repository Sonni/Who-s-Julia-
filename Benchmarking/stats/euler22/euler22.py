import sys

path = sys.argv[1]
file = open(path)

def namesSorted(file):
  line = file.readline()
  line_new = str.replace(line, '"', "")
  array = line_new.split(',')
  file.close()
  names = sorted(array)
  return names

def letterValues():
  letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  mapo = {}
  valueLetter = 1
  for a in letters:
    mapo[a] = valueLetter
    #valueLetter += 1 #For correct values
  return mapo

def calc(mapo, names_sorted):
  value = 0
  mapo_index = 1
  for word in names_sorted:
    value_word = 0
    for ch in word:
      value_word += mapo.get(str(ch), 0)
    value += value_word * mapo_index
    mapo_index += 1
  return value

calc(letterValues(), namesSorted(file))

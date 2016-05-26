#=
By starting at the top of the triangle below and moving to adjacent numbers on
the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by
trying every route. However, Problem 67, is the same challenge with a triangle
containing one-hundred rows; it cannot be solved by brute force, and requires
a clever method! ;o)
=#
#Answer: 1074

#Terminal: Julia euler18.jl data.txt
file = ARGS[1] #file with numbers as shown above

#Count lines in file
function linesFile(file)
  #returns number of lines-1, which is why +1 is added.
  return countlines(open(file)) + 1
end

#Fills matrix with numbers from file.
function makeData(file, lines)
  f = open(file)
  rows = zeros(Int, lines, lines)

  r = 1
  for l in eachline(f)
    s = split(l)
    c = 1
    for n in s
      rows[r, c] = parse(Int, n)
      c += 1
    end
    r += 1
  end

  close(f)
  return rows
end

#Recursively goes from bottom to top of pyramid. Starting at second last line.
function sum(data, row)
  c, l = size(data)
  for i = 1 : c[1]-1
    data[row, i] += max(data[row+1, i], data[row+1, i+1])
  end
  if row == 1
    return data[row, 1]
  else
    return sum(data, row-1)
  end
end

lines = linesFile(file)
sum(makeData(file, lines), lines-1)

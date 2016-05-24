import sys

minYear = int(sys.argv[1])
maxYear = int(sys.argv[2])

def calc(minYear, maxYear):
  count = 0 #sundays occured on the first day of a month
  daysMonth = 0 #days in a month
  passed = 1 #days passed
  for i in range(minYear, maxYear+1):
    for j in range(1,12+1): #months in a year
      if (j == 4) or (j == 6) or (j == 9) or (j == 11):
        daysMonth = 30
      elif j == 2:
        if (i % 400 == 0) or ((i % 4 == 0) and (i % 100 == 0)):
          daysMonth = 29
        else:
          daysMonth = 2
      else:
        daysMonth = 31
      if passed % 7 == 0:
        count += 1
      passed += daysMonth
  return count

print calc(minYear, maxYear)

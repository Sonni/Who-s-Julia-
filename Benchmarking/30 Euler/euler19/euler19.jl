#=
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
=#
#Answer: 171

#Terminal: Julia euler19.jl 1901 2000
minYear = parse(Int, ARGS[1]) #min year
maxYear = parse(Int, ARGS[2]) #max year

function calc(minYear, maxYear)
  count = 0 #sundays occured on the first day of a month
  daysMonth = 0 #days in a month
  passed = 1 #days passed
  for i = minYear : maxYear
    for j = 1 : 12 #months in a year
      if (j == 4) || (j == 6) || (j == 9) || (j == 11)
        daysMonth = 30
      elseif j == 2
        if (i % 400 == 0) || ((i % 4 == 0) && (i % 100 == 0))
          daysMonth = 29
        else
          daysMonth = 28
        end
      else
        daysMonth = 31
      end
      if passed % 7 == 0
        count += 1
      end
      passed += daysMonth
    end
  end
  return count
end

calc(minYear, maxYear)
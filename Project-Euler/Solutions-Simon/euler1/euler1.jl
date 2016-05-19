#Find the sum of all the multiples of 3 or 5 below 1000.

function f1(n)
  sum = 0
  for i = 1:n-1
      if i%3 == 0 || i%5 == 0
        sum += i
      end
  end
  println(sum)
end
f1(1000)

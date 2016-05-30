target = parse(Int, ARGS[1])

function calc(target)
  result = 0;

  for i = target : -target : 0
    for j = i : -100 : 0
      for k = j : -50 : 0
        for x = k : -20 : 0
          for y = x : -10 : 0
            for z = y : -5 : 0
              for w = z : -2 : 0
                result += 1;
              end
            end
          end
        end
      end
    end
  end
  return result
end

calc(target)

import sys

target = int(sys.argv[1])

def calc(target):
  result = 0;

  for i in xrange(target, -1, -target):
    for j in xrange(i, -1, -100):
      for k in xrange(j, -1, -50):
        for x in xrange(k, -1, -20):
          for y in xrange(x, -1, -10):
            for z in xrange(y, -1, -5):
              for w in xrange(z, -1, -2):
                result += 1;
  return result

print calc(target)

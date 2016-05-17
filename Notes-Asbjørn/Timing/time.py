import time
millis = int(round(time.time() * 1000))
time.sleep(10)
millisEnd = int(round(time.time() * 1000)) - millis
print "time: %s" % millisEnd

import time

def usersleep():
	millis = int(round(time.time() * 1000))
	t = 10000
	while True:
		if int(round(time.time() * 1000)) - millis > t:
			break;

millis = int(round(time.time() * 1000))
usersleep()
millisEnd = int(round(time.time() * 1000)) - millis
print "time: %s" % millisEnd

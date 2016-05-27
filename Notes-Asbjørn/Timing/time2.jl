#Pkg.add("CPUTime")
using CPUTime

function usersleep()
	v = CPUtime_us()
	t = 10000000
	while true
		if CPUtime_us()-v > t
			break
		end
	end
end

CPUtic()
usersleep()
CPUtoc()

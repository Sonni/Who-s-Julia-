function usersleep()
	v = time()
	t = 10
	while true
		if time()-v > t
			break
		end
	end
end

@time usersleep()

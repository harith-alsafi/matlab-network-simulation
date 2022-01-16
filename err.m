function e = err(x)
	e = 0;
	y = randi([1, 1/x]);
	if y == 1
		e = 1;
	end
end
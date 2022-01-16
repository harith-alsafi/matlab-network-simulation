function pckt = chanel(packet)
	% simulating bit flip
	for i=1:length(packet)
		% random # between 1 and 10000
		y = randi([1, 10000]); % probability is 0.0001
		if y == 1
			% packet(i) = 1 then its 0 and if its 0 it will be 1
			packet(i) = 1-packet(i);
		end
	end
	pckt = [packet];
end
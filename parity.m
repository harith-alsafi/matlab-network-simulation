function p = parity(packet)
	% parity
	p = rem(sum(packet), 2);
end
function chksm = checksum(packet)
	% splitting the packet
	a = [];
	for i=1:(length(packet)/2)
		a(i) = packet(i);
	end
	b = [];
	c = 1;
	for i=((length(packet)/2)+1):length(packet)
		b(c) = packet(i);
		c = c+1;
	end
	% sum
	ab = fliplr(de2bi((bi2de(fliplr(a))+bi2de(fliplr(b))), (length(a)+1)));
	aq = [];
	if ab(1) == 0
		aq = ab(2:(length(a)+1));
	else
		aq = fliplr(de2bi((bi2de(fliplr(ab(2:(length(a)+1))))+bi2de(fliplr(1))), length(a)));
	end
	% checksum
	chksm = [];
	for i=1:length(aq)
		if aq(i) == 1
			chksm(i) = 0;
		else
			chksm(i) = 1;
		end
end
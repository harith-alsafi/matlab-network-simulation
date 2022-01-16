c = 0;
t = 0;
for i=1:1000
	% initials
	ack = 2;
	timer = 10;
	% random packet generator
	packet_1 = de2bi(randi([1, 2^16]), 16, "left-msb");

	% seding
	p_1 = parity(packet_1); % parity check
	chcksm_1 = checksum(packet_1); % check sum
	packet_2 = chanel(packet_1); % bit flipping at chanel
	e_1 = err(0.1); % probability of packet loss
	e_2 = err(0.0001); % probability for packet error

	% recieving
	if e_1 == 1 % when e_1 = 1 this means we had an error
		ack = 0;
		t = t+10;
		c = c+1;
		continue; % resets the loop
	end
	if e_2 == 1 % when e_1 = 2 this means we had an error
		ack = 0;
		t = t+10;
		c = c+1;
		continue; % resets the loop
	end
	t = t+2;

	% checking
	packet_3 = chanel(packet_2); % bit flipping at chanel
	p_2 = parity(packet_3); % parity for recieved packet
	chcksm_2 = checksum(packet_3); % checksum for recieved packet
	if chcksm_1 == chcksm_2 & p_2 == p_1 % assesing the checksum
		ack = 1;
	else
		ack = 0;
	end
	if ack == 0
		c = c+1;
	end
end
p = c/1000 % probability of packet loss
pckt_s = 1000/t
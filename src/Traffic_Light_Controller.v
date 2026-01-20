module Traffic_Light_Controller (
 input clock, reset,
 output reg red, yellow, green
);

 reg [1:0] current_state, next_state, timer_reset;
 reg [4:0] timer;
 
 parameter red_time = 6;
 parameter green_time = 6;
 parameter yellow_time = 2;
 
 parameter [1:0]
  S0 = 2'b00,
  S1 = 2'b01,
  S2 = 2'b10;
 

 always@(posedge clock)
  begin
   if (reset) current_state <= S0;
   else current_state <= next_state;
  end
  
 always@(posedge clock)
  begin
   if (reset || timer_reset) timer <= 0;
	else timer <= timer + 1;
  end
 
 always@(*)
  begin
	timer_reset = 0;
	red = 0;
	green = 0;
	yellow = 0;
	next_state = S0;
   case (current_state)
		S0:
			begin
			red = 1;
			if (timer >= red_time)
				begin
				next_state = S1;
				timer_reset = 1;
				end
			else next_state = S0;
			end
			 
		S1:
			begin
			green = 1;
			if (timer >= green_time)
				begin
				next_state = S2;
				timer_reset = 1;
				end
			else next_state = S1;
			end
			 
		S2:
			begin
			yellow = 1;
			if (timer >= yellow_time)
				begin
				next_state = S0;
				timer_reset = 1;
				end
			else next_state = S2;
			end
			 
		default:
			next_state = S0;		
	endcase
  end
  
endmodule


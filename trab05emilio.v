//trabalho feito com o Leonardo Gonçalves 
module triangulov2(
    input 	      CLOCK_50,
		input [3:0]  KEY,
  	output [3:0] VGA_R,
  	output [3:0] VGA_G,
		output [3:0] VGA_B,
 		output       VGA_HS,
		output       VGA_VS);
   
    reg signed [23:0] 		      cx = 0;
    reg signed [23:0] 		      cy = 0;		      
    reg signed [23:0] 		      p1_x = 300;
    reg signed [23:0] 		      p1_y = 100;
    reg signed [23:0] 		      p2_x = 400;
    reg signed [23:0] 		      p2_y = 300;
    reg signed [23:0] 		      p3_x = 600;
    reg signed [23:0] 		      p3_y = 200;
    reg [28:0] 			      cont = 0;
    reg [1:0] 			      cc = 0;
   
   
   
    assign VGA_R = v ? (tr ? 4'hc : 4'h0) : 4'b0;
    assign VGA_G = v ? (tr ? 4'hc : 4'h0) : 4'b0;
    assign VGA_B = v ? (tr ? 4'hc : 4'h0) : 4'b0;

   
   
   
    wire 			      v = (cx >= 285) & (cx < 1555) & (cy >= 35) & (cy < 515);
    wire 			      tr = ((p2_x - p1_x) * (cy - p1_y) -(cx - p1_x) * (p2_y - p1_y)) <= 0 &&
				              ((p3_x - p2_x) * (cy - p2_y) -(cx - p2_x) * (p3_y - p2_y)) <= 0 &&
				              ((p1_x - p3_x) * (cy - p3_y) -(cx - p3_x) * (p1_y - p3_y)) <= 0;
     
   
    reg [10:0] c = 10;
    assign VGA_HS = cx >= 190;
    assign VGA_VS = cy >= 2;
   
    always @(posedge CLOCK_50) begin
        cont = cont + 1;
        if(cont == 35000000) begin
	          cc = cc + 1;
	         cont = 0;
        end
        if(cc == 0) begin
        	  p1_x = 300;
         	  p1_y = 100;
         	  p2_x = 400;
        	  p2_y = 300;
        	  p3_x = 600;
        	  p3_y = 200;
        end
        else if(cc == 1) begin
        	  p1_x = 300;
         	  p1_y = 100;
         	  p2_x = 600;
        	  p2_y = 400;
        	  p3_x = 800;
        	  p3_y = 350;
        end
        else if(cc == 2) begin
	          p1_x = 300;
         	  p1_y = 100;
         	  p2_x = 1000;
        	  p2_y = 500;
        	  p3_x = 1400;
        	  p3_y = 300;
        end
		    else if(cc == 3) begin
        	  p1_x = 300;
         	  p1_y = 100;
         	  p2_x = 1000;
        	  p2_y = 500;
        	  p3_x = 1400;
        	  p3_y = 100;
        end
        if (cx == 1585) 
	          begin
            if (cy == 525) begin
	              cy <= 0;
            end
	      else 
	          cy <= cy + 1;
	      cx <= 0;
	  end
    else 
	      begin
	          cx <= cx + 1;
	      end
    end
endmodule
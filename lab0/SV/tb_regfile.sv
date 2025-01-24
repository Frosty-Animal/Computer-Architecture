module testbench ();

   logic   clk, we3;
   logic   [4:0] ra1, ra2, wa3;
   logic   [31:0] wd3, rd1, rd2;
  
   regfile dut(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);

   initial begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
    end

    initial begin
        we3 = 1'b0;
        ra1 = 5'd0;
        ra2 = 5'd0;
        wa3 = 5'd0;
        wd3 = 32'h0;

        @(posedge clk);

        we3 = 1'b1;
        wa3 = 5'd7;
        wd3 = 32'hdeadbeef;

        @(posedge clk);

        we3 = 1'b1;
        wa3 = 5'd15;
        wd3 = 32'heeffddaa;

        @(posedge clk);

        we3 = 1'b0;
        ra1 = 5'd7;
        ra2 = 5'd15;

        @(posedge clk);

        we3 = 1'b1;
        wa3 = 5'd0;
        wd3 = 32'haaaaaaaa;

        @(posedge clk);

        we3 = 1'b0;
        ra1 = 5'd0;
        ra2 = 5'd0;
                

    end
endmodule // stimulus



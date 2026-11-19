# code for Hdl
  ...
     module hdl(clk,rst,a);
        input clk,rst;
        output reg [7:0]a;

        reg [7:0]c;

        always@(posedge clk)
                if(rst)
                        c<=8'b1;
                else if(a[0])
                        c<=c;
                else if(c[7])
                        c<=2;
                else
                        c<=c<<1;

                always@(posedge clk)
                begin
                        if(rst)
                                a<=8'b0;
                        else if(a[0])
                                a<=c;
                        else
                                a<=8'b1;
                end
                endmodule
...

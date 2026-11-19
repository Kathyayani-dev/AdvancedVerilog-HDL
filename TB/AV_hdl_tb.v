# code for hdl_tb.v
  ...
     module hdl_tb();
        reg clk,rst;
        wire [7:0]a;

        hdl DUT(clk,rst,a);

        parameter CYCLE=10;

        always
        begin
                #(CYCLE/2);
                clk=1'b0;
                #(CYCLE/2);
                clk=~clk;
        end

        task rst_dut();
                begin
                        @(negedge clk);
                        rst=1'b1;
                        @(negedge clk);
                        rst=~rst;
                end
        endtask

        task initialize();
                begin
                        {clk,rst}=0;
                end
        endtask

        initial
        begin
                initialize;
                rst_dut;
        end
endmodule
...

`include "uvm_macros.svh"
import uvm_pkg::*;


module tb;
 // Interface instance
 adder_if inf ();
 adder dut (.a(inf.a), .b(inf.b), .y(inf.y)); //instantiate DUT with interface
 
initial
 begin
   $vcdplusfile("waveform.vpd"); 
   $vcdpluson;
   $vcdplusmemon;
   uvm_config_db #(virtual adder_if)::set(null,"uvm_test_top.e.a.d","data", inf);
   run_test("test");
 end

endmodule

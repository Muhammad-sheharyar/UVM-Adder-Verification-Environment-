//---------Driver  class -----------
class drv extends uvm_driver;
 `uvm_component_utils(drv)
 
 virtual adder_if vif; //declare interface variable
 
// constructor
 function new(string path = "drv", uvm_component parent = null);
   super.new(path,parent);
 endfunction
 
 virtual function void build_phase(uvm_phase phase);
 super.build_phase(phase);
   if(!uvm_config_db#(virtual adder_if)::get(this,"","data",vif))
     `uvm_error("drv","Unable to access Interface");
 endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
	// enter logic here
	for(int i=0; i<10; i++) begin
		vif.a = $urandom; 
		vif.b = $urandom;
		#10;
	`uvm_info("drv", $sformatf("a:%0d +  b:%0d =  y:%0d", vif.a, vif.b, vif.y), UVM_NONE);	
    end
	phase.drop_objection(this);
  endtask
endclass

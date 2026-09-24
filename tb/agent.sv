//----- agent class ------
class agent extends uvm_agent;
`uvm_component_utils(agent)
 
 function new(input string inst = "agent", uvm_component parent = null);
super.new(inst,parent);
endfunction

drv d;

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
 d = drv::type_id::create("d",this);

endfunction
endclass

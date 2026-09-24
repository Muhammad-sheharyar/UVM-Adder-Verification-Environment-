## UVM Adder Verification Environment.
---
This is a complete UVM (Universal Verification Methodology) based verification environment that verifies a **4-bit Adder** DUT (Design Under Test). It includes standard UVM components such as Driver, Agent, Environment, and Test.
---

## 📁 Project Structure
bash
uvm-adder-verification/
│
├── rtl/ # RTL Design Files
│ └── design.sv # 4-bit Adder DUT
│
├── tb/ # Testbench Files
│ ├── interface.sv # Adder Interface (a, b, y signals)
│ ├── driver.sv # UVM Driver class
│ ├── agent.sv # UVM Agent class
│ ├── environment.sv # UVM Environment class
│ ├── random_test.sv # UVM Test class
│ └── testbench.sv # Top module (Testbench)
│
└── sim/ # Simulation Files
├── Makefile # Compile, Sim, GUI commands
├── build.flist # List of files for compilation
└── out/ # Simulation output (gitignored)

---

## 🧩 UVM Architecture
bash
┌─────────────────────────┐
│ test │
│ (uvm_test) │
└───────────┬─────────────┘
│
┌───────────▼─────────────┐
│ env │
│ (uvm_env) │
└───────────┬─────────────┘
│
┌───────────▼─────────────┐
│ agent │
│ (uvm_agent) │
└───────────┬─────────────┘
│
┌───────────▼─────────────┐
│ driver │
│ (uvm_driver) │
└───────────┬─────────────┘
│
┌───────────▼─────────────┐
│ adder_if │
│ (Interface) │
└───────────┬─────────────┘
│
┌───────────▼─────────────┐
│ adder (DUT) │
└─────────────────────────┘

---

## ⚙️ Components Description

| Component    | File              | Description                                              |
|--------------|-------------------|----------------------------------------------------------|
| **DUT**      | `design.sv`       | 4-bit Adder (`y = a + b`)                                |
| **Interface**| `interface.sv`    | Virtual interface connecting DUT and TB                  |
| **Driver**   | `driver.sv`       | Random values generate karke DUT ko drive karta hai      |
| **Agent**    | `agent.sv`        | Driver ko encapsulate karta hai                          |
| **Env**      | `environment.sv`  | Agent ko contain karta hai                               |
| **Test**     | `random_test.sv`  | Top-level UVM test (`run_test("test")`)                  |
| **Testbench**| `testbench.sv`    | Top module jo sab kuch instantiate karta hai             |

---

## 🚀 How to Run

### Prerequisites
- **VCS** (Synopsys) — UVM 1.2 support ke saath
- **DVE** (Discovery Visualization Environment) — waveform ke liye
- **Make** utility

### Step 1: Compile
```bash
make compile
make sim
make gui
```

### 📊 Simulation Output
```
UVM_INFO @ 0: reporter [RNTST] Running test test...
UVM_INFO driver.sv(28) @ 10: drv [drv] a:5 + b:12 = y:17
UVM_INFO driver.sv(28) @ 20: drv [drv] a:8 + b:3  = y:11
UVM_INFO driver.sv(28) @ 30: drv [drv] a:15 + b:7 = y:22
...
````
### 🛠️ Tools & Technologies
Language: SystemVerilog
Methodology: UVM 1.2
Simulator: Synopsys VCS (L-2016.06)
Waveform Viewer: DVE
Editor: VS Code with Verilog-HDL/SystemVerilog extension

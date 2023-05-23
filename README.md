# Verification Practice Project #1: Simple CPU

## Hello!

Below is my self-assigned, first verification project.

I found an *extremely* simple CPU, created a verification plan, and built a testbench in EDAplayground to execute the plan.

My goal was to understand how verification tools (SV, UVM, SVA, functional coverage, etc.) work in concert, and to experience some of the verification challenges I have read about (importance of reusability, impact of testbench architecture choices, etc).

I am looking for feedback, before beginning a second more complex project:
1. Do you have any criticism of the verification plan or testbenches?
2. Do you think the approach of building increasingly complex testbenches is a reasonable approach to landing an entry level DV engineering role?
3. What skills or concepts or architectures would my next project need to include to give you total confidence I would be a solid entry level addition to your team?
4. Do you think building a test bench to verify the Berkeley Out-of-Order Machine (BOOM) Core with Ocelot
* Instruction Set Set Simulator (Whisper)
* Hierarchical reuse
* Verilator
* Improve SVA skills
* RISC ISA testing

All input is much appreciated.  Thank you!

Taylor Templeton 

(A Raleigh, NC based engineer and cool dude with a semiconductor fabrication background (process, integration, quality) upskilling to become a competitive applicant for an entry-level design verification role.)

([Resume](2023_05_May_22_TaylorTempleton_GithubVersion.pdf)) 


## Simple CPU
This CPU is from a Cadence "systemverilog for design" course.  I used the RTL only, but built the testbench entirely myself.  For reference, some details are below.
![](CPUschematic_Opcodes_Snap.png)
![](StatemachineDecode_Snap.png)


## Verification Plan
I created my verification plan based on the following resources:
Andrew Piziali's "Functional Verification Coverage Measurment and Analysis"
James Peet's  "Verification plans : the five-day verification strategy for modern hardware verification languages"
The Verification Academy's "UVM Cookbook"
The OpenHW Group's Core-V Verification Project

([Verification Plan](Draft_VerificationPlan.xlsx)) 
![](Draft_Vplan.png)


## Testbench Architecture
UVM_cookbook, OpenHW tb, Cadence online training.

![](DraftTestbenchArchitecture_Complete.png)


## EDA Playground Simulations
I use EDA playground as I do not have access to commercial simulators:

| Block                | EDA Playground Simulation            |
|----------------------|--------------------------------------|
| Whole CPU            |                                      |
| Register             | https://www.edaplayground.com/x/d_zE |
| MUX                  | https://www.edaplayground.com/x/v_VC |
| Counter              | https://www.edaplayground.com/x/wXAi |
| Sequencer Controller | https://www.edaplayground.com/x/abRt |
| ALU                  | https://www.edaplayground.com/x/JT9j |
| Memory               | https://www.edaplayground.com/x/K4_Z |

Example EDAplayground log.  (Results printed to log instead of exported with Synopsis URG for readability.)
![](EDAPlaygroundExampleLog.png)


## Lessons Learned
* TB reusability is key.
  * Even for a simple design, huge percentage of time was reprogamming the same components for different IP blocks.
* Consistency in naming at interfaces seems critical for reusability
* Plan to try to implement assertions in checker module
* Need to improve SVA skills, they are marginal.
* Want to try to implement formal.


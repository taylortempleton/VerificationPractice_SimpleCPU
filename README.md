# Verification Practice Project #1: Simple CPU

## Hello!

I verified an extremely simple CPU to develop an understanding of how verification tools and concepts work together (SV, UVM, SV Assertions, functional coverage, etc.).

Before beginning my next self-assigned verification project, I am hoping for feedback:

  1. Do you have any criticism of the below project?
  2. Do you think building verification projects is a reasonable approach to landing an entry-level DV engineering role?  

I will next verify the data and control paths of a [pipelined risc-v CPU](https://github.com/taylortempleton/SimpleCPU_RISC-V), to improve my verification skills and understanding of CPU architecture. 

All input is much appreciated.  Thank you!

Taylor Templeton
taylor.templeton@gmail.com

I am a Raleigh, NC based engineer with a semiconductor fabrication background reskilling for an entry-level design verification-related engineering role. ([Resume](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/2023_09_Sept_20_TaylorTempleton.pdf))


## Project Summary
Verify a simple CPU.  Draft a block-level vplan, build a SV/UVM testbench in EDAPlayground, and verify each block conistent with the plan. Then, verify the CPU with a small program to check for problematic block interactions.

## EDA Playground Simulations

I work within EDA playground, as I do not have access to commercial simulators.

| Block                | EDA Playground Simulation            |
|----------------------|--------------------------------------|
| **Full CPU**         | https://www.edaplayground.com/x/hBNp |
| Register Block       | https://www.edaplayground.com/x/Y5kQ |
| MUX Block            | https://www.edaplayground.com/x/v_VC |
| Counter Block        | https://www.edaplayground.com/x/wXAi |
| Controller Block     | https://www.edaplayground.com/x/L57G |
| ALU Block            | https://www.edaplayground.com/x/JT9j |
| Memory Block         | https://www.edaplayground.com/x/K4_Z |


Example EDAplayground log.  Results printed to log instead of exported with Synopsis URG for readability.
![](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/EDAPlaygroundExample_MarkedUp.png)


## Verification Plan

I created my verification plan guided by the resources cited at bottom.

([Verification Plan Excel](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/Draft_VerificationPlan.xlsx)) 

![](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/VerificationPlanSummary04.png)


## Testbench Architecture

I created my testbench architecture guided by the resources cited at bottom.

![](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/DraftTestbenchArchitecture_Complete.png)


## Simple CPU

This CPU RTL comes from a Cadence "Systemverilog for Design" course.  I used the RTL, but built the testbench myself.

![](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/CPUschematic_Opcodes_Snap.png)
![](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/StatemachineDecode_Snap.png)

Above diagrams combined, for reference:
![](https://github.com/taylortempleton/VerificationPractice_SimpleCPU/blob/main/Docs/simplecpu_whiteboard.jpg)


## Lessons Learned / Next Steps

* TB reusability is key; even with such a simple design, a huge percentage of time was reprogamming the same components for different IP blocks.
* Consistency in naming at interfaces seems critical for reusability.
* Plan to try to implement assertions in checker module.
* Need to improve SVA skills, they are marginal.
* Add 'bug report' to capture and describe bugs caught.
* Better explain stimulus: what is actually happening, and how?. (Thanks Colby R.)

## Sources
This project is self-driven/assigned, but I would not want to take credit for the sources upon which I drew:
* Andrew Piziali's "Functional Verification Coverage Measurment and Analysis"
* James Peet's  "Verification plans : the five-day verification strategy for modern hardware verification languages"
* The Siemens' Verification Academy's "UVM Cookbook" and "Coverage Cookbook"
* The OpenHW Group's Core-V Verification Project verification plans
* "Getting Started with UVM: A Beginner's Guide" by Vanessa Cooper
* Feedback from Verification Academy forums. (Many thanks to those who offered input.)


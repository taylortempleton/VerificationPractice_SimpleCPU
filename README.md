# Verification Practice Project #1: Simple CPU
## Howdy!

Below is my first self-motivated verification project. 

I found an extremely simple CPU, created a verification plan, and built a testbench to execute the plan in EDAplayground.

My goal was to understand how verification concepts (SV, UVM, SVA, functional coverage, etc.) work in concert, and gain insight into some of the verification challenges I read about (importance of resusability, impact of testbench architecture choices, etc).

I am looking for feedback on a few questions, before starting a second, more complex verification project.
1. Do you see anything that is clearly incorrect, dumb?
2. Do you think the approach of building increasingly complext testbenches while seeking industry feedback is a reasonable approach to landing a DV engineering role? Is it foolish?
3. What skills or concepts would my next project need to demonstrate if it were to prove that I have the skill to be on your team, are there concepts or methodologies I should incorporate to become a more competitive applicant?  (I am not planning to incorporate generative AI, until I have rock-solid understanding of verification fundamentals, first) Current plan
Is the BOOM core a good project?  
* Berkeley Out-of-Order Machine (BOOM) Core with Ocelot
* Instruction Set Set Simulator (Whisper)
* Hierarchical
* Verilator


All input is much appreciated.  Thank you!

Taylor Templeton 

(A Raleigh, NC based engineer and cool dude with a semiconductor fabrication background (process, integration, quality) upskilling to become a competitive applicant for an entry-level design verification role.)

([Resume](2023_05_May_22_TaylorTempleton_GithubVersion.pdf)) 

## Simple CPU
This CPU is from a Cadence "systemverilog for design" course.  I used the RTL only, but built the testbench entirely myself.
![](CPU_schematic.png)

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


## Verification Plan
([Verification Plan](Draft_VerificationPlan.xlsx)) 
![](Draft_Vplan.png)

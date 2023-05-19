# VerificationPractice_SimpleCPU
VerificationPractice_SimpleCPU


| Block                | EDA Playground Simulation            |
|----------------------|--------------------------------------|
| Whole CPU            |                                      |
| Register             | https://www.edaplayground.com/x/d_zE |
| MUX                  | https://www.edaplayground.com/x/v_VC |
| Counter              | https://www.edaplayground.com/x/wXAi |
| Sequencer Controller | https://www.edaplayground.com/x/abRt |
| ALU                  | https://www.edaplayground.com/x/JT9j |
| Memory               | https://www.edaplayground.com/x/K4_Z |



| Block    | Requirement Description                                              | Source of Requirement | Verification Goal                                                 | Pass/Fail Criteria | Coverage Method     | Coverage Location                   |
|----------|----------------------------------------------------------------------|-----------------------|-------------------------------------------------------------------|--------------------|---------------------|-------------------------------------|
| Register | Data and out are both 8-bit logic vectors.                           | Spec                  | Send vectors of varying lengths, to confirm only 8-bit permitted. | Self-Checking      | Testcase            | 8bit_test                           |
| Register | Reset is asynchronous and active low.                                | Spec                  | Confirm register only resets when reset low.                      | Assertion check    | Assertion Coverage  | property resetLow_outZero           |
| Register | Register is clocked on rising edge of clk.                           | Spec                  | Confirm register clocked on rising edge only.                     | Assertion check    | Assertion Coverage  | property clkRising                  |
| Register | If enable is high, the input data is passed to the output out.       | Spec                  | Confirm register passes input to out, when enable is high.        | Assertion check    | Assertion Coverage  | property enableHigh_DataOut         |
| Register | If rst_ high and enable low, out is retained in register             | Spec                  | Confirm register retains value when not reset and not enabled.    | Assertion check    | Assertion Coverage  | property rstHighEnableLow_OutStable |
| Register | Confirm ensure test sequence injects high/low for all input signals. | Taylor's Idea         | Confirm sequence injects high/low for all input signals.          | Self Checking      | Functional Coverage | covergroup cov_SignalHighLow        |

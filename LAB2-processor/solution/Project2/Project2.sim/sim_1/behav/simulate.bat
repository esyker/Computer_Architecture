@echo off
set xv_path=C:\\ProgramFiles\\Vivado\\2016.3\\bin
call %xv_path%/xsim testSingleCycle_behav -key {Behavioral:sim_1:Functional:testSingleCycle} -tclbatch testSingleCycle.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

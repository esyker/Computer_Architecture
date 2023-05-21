@echo off
set xv_path=C:\\ProgramFiles\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto 8f06e471cd3d464cb3dc48507831d08c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testSingleCycle_behav xil_defaultlib.testSingleCycle -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

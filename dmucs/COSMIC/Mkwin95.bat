@echo off
echo Windows 95 Batch file: makes the Simple Sockets Library from a
echo                        MSDOS console
echo          Batch file for Borland C++ v5.0 or better
echo  
echo Authors: Charles E. Campbell, Jr.
echo          Terry McRoberts
echo ---------------------------------------------------------------
echo  

rem This batch file already assumes that the files have been gunzip'ped and
rem untar'red.  It creates a smplskts.lib; you will also want to have
rem its header files in your -I list when compiling.

rem Compile the Simple Sockets Library
echo Compiling Simple Sockets Library
for %%f in (*.c) do bcc32 -c -vi- -w-aus -w-csu -w-pia -I. -w-vnu -I.\HDR %%f

rem Build smplskts.lib Library
echo Building smplskts.lib
for %%f in (*.obj) do tlib /C smplskts +%%f

rem Compile and link SSL utilities and PortMaster (Spm)
echo Compiling and linking SSL utilities
cd EXE
for %%f in (*.c) do bcc32 -Ot -vi- -w-aus -w-csu -w-pia -I..\HDR %%f ..\smplskts.lib
mv *.exe ..
cd ..

rem Cleanup
del *.bak
del *.obj
del EXE\*.obj

rem Final Note
echo  
echo ---------------------------------------------------------------
echo  
echo Utilities and the PortMaster (Spm) are in COSMIC\*.exe
echo The Simple Sockets library is in COSMIC\smplskts.lib
echo Try out the examples, too!
echo  
echo Best of luck,
echo Charles E. Campbell

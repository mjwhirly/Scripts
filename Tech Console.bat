@echo off
color 9F
setlocal enabledelayedexpansion
:begin
CLS
ECHO *********************************************************************************
ECHO *********************************************************************************
ECHO **********************************Tech Console***********************************
ECHO ***************************Created by Matthew Woehrle****************************
ECHO *********************************************************************************
ECHO *********************************************************************************
ECHO.
ECHO Wifi Profiles
ECHO.
ECHO 1 = Faculty
ECHO 2 = Student
ECHO 3 = Guest
ECHO.					
ECHO Tech Utilities
ECHO.
ECHO 4 = List connected printers
ECHO 5 = List of Installed Programs
ECHO 6 = Delete Printer
ECHO 7 = Activate Smart Notebook Software
ECHO 8 = Fix Relationship Trust Issue
ECHO 9 = System File Checker Scan
ECHO 0 = Check disk for C: Drive
ECHO.
ECHO Install IP Print
ECHO.
ECHO a = Front Office Copier 1	 b = Front Office Copier 2			c = 1st Floor Copier
ECHO d = 2nd Floor Copier		 e = 1st Floor Teacher Lounge Printer	 	f = 2nd Floor Teacher Lounge Printer
ECHO g = 1st Grade Lead Printer	 h = 2nd Grade Lead Printer			i = 3rd Grade Lead Printer
ECHO j = 4th Grade Lead Printer	 k = 5th Grade Lead Printer			l = MS Science Lead Printer
ECHO m = MS ELA Lead Printer		 n = MS Civics Lead Printer			 	o = MS Lead Printer
ECHO p = Kindergarten Printer	 q = Mudge's Printer		r = SOA Printer
ECHO s = Thompson's Printer		 t = Field's Printer    u = CRT Printer
ECHO v = Open House Printer 2
ECHO.
ECHO.
ECHO Software Install
ECHO.
ECHO u = Install Raptor Tech Software
ECHO v = Install Smart Learning Suite
ECHO.
ECHO y = Restart Computer
ECHO z = Exit
ECHO.
ECHO __________________________________________
ECHO.
SET /P "ANSWER=Select an option: "

if /i {%ANSWER%}=={1} (goto :1)
if /i {%ANSWER%}=={2} (goto :2)
if /i {%ANSWER%}=={3} (goto :3)
if /i {%ANSWER%}=={4} (goto :4)
if /i {%ANSWER%}=={5} (goto :5)
if /i {%ANSWER%}=={6} (goto :6)
if /i {%ANSWER%}=={7} (goto :7)
if /i {%ANSWER%}=={8} (goto :8)
if /i {%ANSWER%}=={9} (goto :9)
if /i {%ANSWER%}=={0} (goto :0)
if /i {%ANSWER%}=={a} (goto :a)
if /i {%ANSWER%}=={b} (goto :b)
if /i {%ANSWER%}=={c} (goto :c)
if /i {%ANSWER%}=={d} (goto :d)
if /i {%ANSWER%}=={e} (goto :e)
if /i {%ANSWER%}=={f} (goto :f)
if /i {%ANSWER%}=={g} (goto :g)
if /i {%ANSWER%}=={h} (goto :h)
if /i {%ANSWER%}=={i} (goto :i)
if /i {%ANSWER%}=={j} (goto :j)
if /i {%ANSWER%}=={k} (goto :k)
if /i {%ANSWER%}=={l} (goto :l)
if /i {%ANSWER%}=={m} (goto :m)
if /i {%ANSWER%}=={n} (goto :n)
if /i {%ANSWER%}=={o} (goto :o)
if /i {%ANSWER%}=={p} (goto :p)
if /i {%ANSWER%}=={q} (goto :q)
if /i {%ANSWER%}=={r} (goto :r)
if /i {%ANSWER%}=={s} (goto :s)
if /i {%ANSWER%}=={t} (goto :t)
if /i {%ANSWER%}=={u} (goto :u)
if /i {%ANSWER%}=={v} (goto :v)
if /i {%ANSWER%}=={w} (goto :w)
if /i {%ANSWER%}=={x} (goto :x)
if /i {%ANSWER%}=={y} (goto :y)
if /i {%ANSWER%}=={z} (goto :z)

:1
netsh wlan add profile filename="Wi-Fi-CSUSA-FACULTY.xml" user=all
Pause
goto begin

:2
netsh wlan add profile filename="Wi-Fi-CSUSA-STUDENTS.xml" user=all
Pause
goto begin

:3
netsh wlan add profile filename="Wi-Fi-CSUSA-GUEST.xml" user=all
Pause
goto begin

:4
cls
echo Printers listed on computer
echo.
wmic printer get portname, drivername, deviceid
Pause
goto begin

:5
CLS
wmic product get name, installdate, version
Pause
goto begin

:6
set /p "printer=What printer do you want to delete: "
rundll32 printui.dll,PrintUIEntry /dl /n "%printer%"
Pause
goto begin

:7
"C:\Program Files (x86)\Common Files\SMART Technologies\SMART Activation Wizard\activationwizard.exe" --puid notebook_14 --m=4 --v=4 --a --pks="NC-2ADA4-CERJU-K6A2F-SSAAA-AAA"
Pause
goto begin

:8
Netdom resetpwd /Server:CSUSA.internal /UserD:<domain-admin-account> /PasswordD:<domain-admin-password>
ECHO Relationship Trust issue has been resolved. Restart the computer!
Pause
goto begin

:9
sfc /scannow
ECHO This will take a while to run!
Pause
goto begin

:0
chkdsk /r c:
ECHO This will take a while to run!
Pause
goto begin


:a
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.200 -h 10.26.0.200
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "Front Office Copier - Thompson Side" -m "Microsoft PCL6 Class Driver" -r "10.26.0.200"
Pause
goto begin

:b
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.201 -h 10.26.0.201
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "Front Office Copier - Field Side" -m "Microsoft PCL6 Class Driver" -r "10.26.0.201"
Pause
goto begin

:c
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.202 -h 10.26.0.202
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "1st Floor Copier" -m "Microsoft PCL6 Class Driver" -r "10.26.0.202"
Pause
goto begin

:d
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.203 -h 10.26.0.203
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "2nd Floor Copier" -m "Microsoft PCL6 Class Driver" -r "10.26.0.203"
Pause
goto begin

:e
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.200 -h 10.26.0.200
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "Front Office Copier - Thompson Side" -m "Microsoft PCL6 Class Driver" -r "10.26.0.200"
Pause
goto begin

:f
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.201 -h 10.26.0.201
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "Front Office Copier - Field Side" -m "Microsoft PCL6 Class Driver" -r "10.26.0.201"
Pause
goto begin

:g
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.221 -h 10.26.0.221
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "1st Grade Lead Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.221"
Pause
goto begin

:h
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.223 -h 10.26.0.223
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "2nd Grade Lead Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.223"
Pause
goto begin

:i
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.225 -h 10.26.0.225
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "3rd Grade Lead Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.225"
Pause
goto begin

:j
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.240 -h 10.26.0.240
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "4th Grade Lead Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.240"
Pause
goto begin

:k
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.229 -h 10.26.0.229
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "5th Grade Lead Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.229"
Pause
goto begin

:l
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.231 -h 10.26.0.231
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "MS Science Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.231"
Pause
goto begin

:m
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.17.93 -h 10.26.17.93
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "MS ELA Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.17.93"
Pause
goto begin

:n
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.227 -h 10.26.0.227
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "MS Civics Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.227"
Pause
goto begin

:o
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.236 -h 10.26.0.236
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "MS Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.236"
Pause
goto begin

:p
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.219 -h 10.26.0.219
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "Kindergarten" -m "Microsoft PCL6 Class Driver" -r "10.26.0.219"
Pause
goto begin

:q
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.214 -h 10.26.0.214
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "Mudge Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.0.214"
Pause
goto begin

:r
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.201 -h 10.26.0.201
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "Front Office Copier - Field Side" -m "Microsoft PCL6 Class Driver" -r "10.26.0.201"
Pause
goto begin

:s
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.202 -h 10.26.0.202
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "1st Floor Copier" -m "Microsoft PCL6 Class Driver" -r "10.26.0.202"
Pause
goto begin

:t
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.0.203 -h 10.26.0.203
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "2nd Floor Copier" -m "Microsoft PCL6 Class Driver" -r "10.26.0.203"
Pause
goto begin

:u
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Microsoft PCL6 Class Driver" -h
Cscript C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs -a -r 10.26.17.123 -h 10.26.17.123
Cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnmngr.vbs" -a -p "CRT Printer" -m "Microsoft PCL6 Class Driver" -r "10.26.17.123"
Pause
goto begin

:v
cd D:\Tech Console\Software
start raptor_tech_kiosk.exe
Pause
goto begin

:w


:x
cd D:\Tech Console\Software\smart19-0admin
msiexec /i "D:\Tech Console\Software\smart19-0admin\SMARTLearningSuite.msi"
goto begin

:y
shutdown /r /t 5
ECHO Shutdown in 5 seconds
Pause


:z
ECHO Goodbye!
Pause
exit /b 1
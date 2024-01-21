@echo off
REM Styleguide
REM For errors, use [41;97m[ERROR^^!]

REM echo Continue - Run the script anyways even though the modpack probably wont work.
REM echo Quit     - Stop the script.

setlocal enableDelayedExpansion

REM Set title of window and show disclaimer.


title Max^'s Modpack Script

REM Check if I am the latest version of myself.
set currentScriptVersion=2
curl --silent https://pastebin.com/raw/ngYCTTva --output scriptVersion.txt
set /p latestScriptVersion=< scriptVersion.txt
del scriptVersion.txt
echo [96mMax's Modpack Script[0m
echo Your Version: [93m%currentScriptVersion%[0m
echo Latest Version: [93m%latestScriptVersion%[0m
echo.
if !currentScriptVersion! == !latestScriptVersion! (
	echo [92mYou have the latest version^^![0m
) else (
	if !currentScriptVersion! lss !latestScriptVersion! (
		echo [41;37mA new script version is available and you must update^^!
		timeout 2 /nobreak >nul
		start "" "https://maxshub.notion.site/Install-the-Modpack-5500e2aa31ee49dbb536e4101663aa95?pvs=4"
		echo This script will close in ten seconds.                [0m
	) else (
		echo [41;37mThere was an error and your copy of the script may be
		echo faulty. Please redownload the script^^!                
		timeout 2 /nobreak >nul
		start "" "https://maxshub.notion.site/Install-the-Modpack-5500e2aa31ee49dbb536e4101663aa95?pvs=4"
		echo This script will close in ten seconds.               [0m
	)
	timeout 10 /nobreak
	exit
)

echo.
echo [91mPLEASE READ THE TEXT BELOW[0m
echo.
echo [41;37mThis script will automatically install, move, and delete  
echo files on your computer, open webpages, and download files 
echo from the internet. By using this script, you              
echo acknowledge that you understand the inherent risks of     
echo running such a program and understand that I am not liable
echo for anything this script does to your computer.           
echo You are running this script at your own risk.             [0m
echo.
echo [92mPress any key to acknowledge the above and start the script...[0m
pause >nul

cls
echo [92mThis is an IDK-Friendly Script^^![0m
echo Throughout this script, you will be asked to make decisions.
echo By simply pressing [93mEnter[0m for any prompt, no matter what, it
echo will choose the default option. While I still recommend you
echo read the script whenever you are asked something, pressing
echo [93mEnter[0m will most likely get you to where you need to be.
echo.
echo [92mPress any key (such as the [93mEnter[92m key) to continue.[0m
pause >nul

:checkPrerequisites
cls
echo [41;97m Checking your PC... [0m
echo Checking if you have Java...
REM Use where command to check filepath of Java. Use error level to determine whether Java is installed.
where java
if %errorlevel%==1 (
	:noJava
	cls
	echo [41;97m[ERROR^^!] Can't find Java on your computer^^! [0m
	echo In order to install or update the modpack, you must have
	echo Java installed. Choose an option for what to do next.
	echo.
	echo Download - Open the download page for Java.
	echo Check    - Test to see if Java is actually installed and I made a mistake.
	echo Continue - Run the script anyways even though the modpack probably wont work.
	echo Quit     - Stop the script.
	echo.
	echo What would you like to do^?
	echo Type "download", "check", "quit", or "continue".
	echo.
	set /p "input=[33mI'd like to [93m"
	REM If user said nothing, user should download Java.
	if "!input!" == "" (
		goto :downloadJava
	)
	REM If user wants to download Java, open the JDK download page in their browser and close the script.
	if !input! == download (
		:downloadJava
		cls
		echo [41;97m[ERROR^^!] Can't find Java on your computer^^! [0m
		echo I will open your browser to the direct download link for the
		echo Java 21 installer. If you'd rather do this on your own, go to
		echo the link below and close this window.
		echo [90mhttps://www.oracle.com/java/technologies/downloads/#jdk21-windows
		echo.
		echo [92mPress any key to autmoatically open your defualt browser to the JDK 21 installer download.[0m
		pause >nul
		start "" "https://download.oracle.com/java/21/latest/jdk-21_windows-x64_bin.exe"
		cls
		echo [41;97m[ERROR^^!] Can't find Java on your computer^^! [0m
		echo I just opened the download for Java on your default browser.
		echo Please downlaod the installer and run it. Come back here
		echo once Java is installed.
		echo.
		echo [92mOnce the Java installer is finished and you Java, press any key to continue.[0m
		pause >nul
		REM User should have Java, so lets check again.
		goto :checkPrerequisites
	) else (
		REM If user wants to continue anyways, just give a slight delay and then continue.
		if !input! == continue (
			echo [92mContinuing...[0m
			timeout 1 /nobreak >nul
		) else (
			REM If user wants to check, run java -version and display the output. Educate user and let them decide.
			if !input! == check (
				cls
				echo [43;97m Checking for Java... [0m
				echo First, I'm going to run the "java -version" command.
				echo If you have java, you should see "Java" below along
				echo with a version number. If you see nothing or you see
				echo "java is not recognized" then you do not have Java.[93m
				echo.
				@echo on
				java -version
				@echo off
				echo.
				echo [0mBased off what you see above, do you have Java^?
				echo Type "yes" or "no".
				set /p "input=[93m"
				if !input! == yes (
					echo.
					echo [0mOh, okay, sweet. Sorry about that^^!
					echo [92mContinuing...[0m
					timeout 3 >nul
				)
				if !input! == no (
					goto :downloadJava
				)
			) else (
				if !input! == quit (
					cls
					echo [41;97m[ERROR^^!] Can't find Java on your computer^^! [0m
					echo Sorry, but you need Java to play modded Minecraft.
					echo This script will automatically close in ten seconds.
					timeout 10 /nobreak
					exit
				) else (
					echo Input not recognized. Please type "download", "check", "quit", "continue", or press Enter.
					timeout 2 /nobreak >nul
					goto :noJava
				)
			)
		)
	)
) else (
	echo [92mJava found^^![0m
)
:checkForge
echo Checking if you have Forge...
if not exist %USERPROFILE%\AppData\Roaming\.minecraft\versions\1.20.1-forge-47.2.0 (
	cls
	echo [41;97m[ERROR^^!] Can't find correct Forge version^^! [0m
	echo You do not have the correct forge version installed on
	echo your computer. You need [93mForge 47.2.0[0m for [93m1.20.1[0m.
	echo.
	echo I recommend downloading Forge yourself through their website
	echo since it supports development with ads. If you'd like, I can
	echo download it for you. What would you like to do?
	echo.
	echo Download - Automatically download and open the Forge 47.2.0 installer.
	echo Website  - Support the Forge development team and view an ad on their website.
	echo Quit     - Stop the script.
	echo Continue - Run the script anyways even though the modpack probably wont work.
	echo.
	echo Type "download", "website", "continue", or "quit".
	set /p "input=[33mI'd like to [93m"
	if "!input!" == "" (
		goto :downloadForge
	)
	if !input! == download (
		:downloadForge
		cls
		echo [42;97m Downloading Forge... [0m
		echo While downloading Forge directly is convenient, you are
		echo skipping the ad that Forge uses to fund development.
		echo Consider giving a small donation.
		echo [7mhttps://www.patreon.com/LexManos[0m
		timeout 5 /nobreak >nul
		echo.
		echo [32mDownloading forge-1.20.1-47.2.0-installer.jar[0m
		curl -OJ --silent https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.2.0/forge-1.20.1-47.2.0-installer.jar
		echo [92mInstalled forge-1.20.1-47.2.0-installer.jar[0m
		timeout 1 /nobreak >nul
		cls
		echo [42;97m Installing Forge... [0m
		echo I will now run the Forge installer. A separate window
		echo will appear. Click "OK" on this window to install
		echo Forge onto your computer. Once it's finished, close
		echo the installer and come back here.
		timeout 10
		echo.
		echo [32mOpening installer...[0m
		java -jar forge-1.20.1-47.2.0-installer.jar >nul
		echo [92mInstaller was closed^^![0m
		timeout 1 /nobreak >nul
		echo [32mDeleting installer...[0m
		del forge-1.19.2-43.2.0-installer.jar
		echo [92mInstaller deleted![0m
		cls
		echo [41;97m Checking for Forge... [0m
		echo I will now check to see if the installation was successful.
		timeout 5 /nobreak >nul
		goto :checkPrerequisites
		
	) else (
		if !input! == website (
			cls
			echo [42;97m Downloading Forge... [0m
			echo I will open the download page for Forge on your
			echo default browser. Once you've downloaded the installer,
			echo double click it to install Forge on your computer.
			echo When you're done, come back here.
			timeout 10
			echo.
			echo [32mOpening website...[0m
			start "" "https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.2.0/forge-1.19.2-43.2.0-installer.jar"
			echo [92mWebsite opened^^![0m
			timeout 1 /nobreak >nul
			echo.
			echo Press any key once you've finished installing Forge.
			pause >nul
			cls
			echo [41;97m Checking for Forge... [0m
			echo I will now check to see if you installed Forge.
			timeout 5 /nobreak >nul
			goto :checkPrerequisites
		) else (
			if !input! == continue (
				echo [92mContinuing...[0m
				timeout 1 /nobreak >nul
			) else (
				if !input! == quit (
					cls
					echo [101;97m[ERROR^^!] No Forge^^! [0m
					echo Sorry, but you need Forge to play modded Minecraft.
					echo This script will automatically close in ten seconds.
					timeout 10 /nobreak
					exit
				) else (
					echo Input not recognized. Please type "download", "website", "quit", "continue", or press Enter.
					timeout 2 /nobreak >nul
					goto :noJava
				)
			)
		)
	)
) else (
	echo [92mForge found^^![0m
)
:checkModsFolder
echo Checking if you have a mods folder...
if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods (
	:noModsFolder
	cls
	echo [41;97m[ERROR^^!] No mods folder^^![0m
	echo.
	echo If you just installed Forge:
	echo This error is normal. Press Enter to continue.
	echo.
	echo If you did not just install Forge:
	echo You don't have a mods folder so I will make one
	echo for you. If you believe this is an error, please
	echo close the script.
	echo.
	echo Press Enter to create a mods folder or type "quit".
	set /p "input=[93m"
	if "!input!" == "" (
		echo.
		echo [32mMaking mods folder...[0m
		mkdir %USERPROFILE%\AppData\Roaming\.minecraft\mods
		timeout 1 /nobreak >nul
		if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods (
			cls
			echo [41;97m[ERROR^^!] Unable to create mods folder^^![0m
			echo I tried creating a mods folder at...
			echo [93m%USERPROFILE%\AppData\Roaming\.minecraft\[0m
			echo ...but encountered some kind of error. I am unable to
			echo continue. You may close the script.
			pause >nul
			exit
		)
		timeout 1 /nobreak >nul
		echo [92mMods folder created at %USERPROFILE%\AppData\Roaming\.minecraft\mods[0m
		timeout 1 /nobreak >nul
		goto :checkPrerequisites
	) else (
		if !input! == quit (
		cls
		echo [41;97m[ERROR^^!] No mods folder^^![0m
		echo Sorry, but you need a mods folder to use the script.
		echo This script will automatically close in ten seconds.
		timeout 10 /nobreak
		exit
		) else (
			echo Input not recognized. Please press Enter or type "quit".
			timeout 2 /nobreak >nul
			goto :noModsFolder
		)
	)
) else (
	echo [92mMods folder found^^![0m
)
:checkOldScriptFiles
echo Checking for old script files...
if exist %USERPROFILE%\AppData\Roaming\.minecraft\mods (
    cd /d %USERPROFILE%\AppData\Roaming\.minecraft\mods
    for %%F in (*.*) do (
        if /i "%%~xF" neq ".jar" (
            if not "%%~nF" == "modpackversion" (
                del "%%F"
            )
        )
    )
) else (
    goto :noModsFolder
)
echo [92mNo files found^^![0m
timeout 1 /nobreak >nul

cls
echo [43;97m Checking your Modpack... [0m
echo [32mGetting details on latest version...[0m
curl --silent https://pastebin.com/raw/E5ALHMyR --output modpacklatest.txt
set /p latest=< modpacklatest.txt
echo [92mFound^^! Latest version is !latest![0m
echo [32mGetting current modpack version...[0m
if exist modpackversion.txt (
	set /p current=< modpackversion.txt
) else (
	echo Error^^! Could not find modpackversion.txt^^!
	set "current=unknown"
)
echo.
echo [92mFinished^^![0m
timeout 1 /nobreak >nul

cls
echo [42;97m Ready^^! [0m
echo Welcome to the script^^!
echo.
echo You Have: [91m!current![0m
echo Latest: [92m!latest![93m
if !current! == unknown (
	echo [33mThere was an error checking your modpack version. If you are
	echo installing this modpack for the first time, this is normal^^!
	echo If you've installed before then something is wrong. Please
	echo type "update" to check for any issues.[0m
) else (
	if !current! == !latest! (
		echo [92m[4mYou have the latest modpack version^^![0m
		echo [32mIf you think something is wrong with your pack, type update
		echo to check for any missing files.[0m
	) else (
		echo [93mYou do not have the latest version^^! Please update^^!
	)
)
echo.
echo Press any key to begin^^!
pause >nul

cls
echo [32mGetting latest modpack info...[0m
REM Verify we are in mods directory.
cd /d %USERPROFILE%\AppData\Roaming\.minecraft\mods
REM Download the current mods master list, which contains a mods's jar name followed by its downlaod URL.
curl --silent https://pastebin.com/raw/nfmrLAiA --output modlist.txt
REM Start a loop that runs for however many lines are in the modlist file. Count every line to a new variable: count.
for /f %%a in ('find /c /v "" ^< modlist.txt') do set count=%%a
REM Since each mod has two lines in the file, divide by 2 to get total mod count.
set /a count=!count!/2
echo [92mGot latest modpack info^^! Version: !latest! - Mods: !count![0m
timeout 1 /nobreak >nul
echo.

REM Compare current mods folder to master list.
cls
echo [42;97m Comparing... [0m
echo.
REM Create file that lists every .jar currently in the mods folder.
dir /b *.jar > installedmods.txt
set count=0
set old=0
set new=0
set i=1
REM Find any mods in the master list that aren't currently in the mods folder. Add missing mods and their URL to newmods.txt.
for /f "delims=" %%j in (modlist.txt) do (
	REM On a .jar line, set mod variable to current .jar filename.
	if !i! equ 1 (
		set mod=%%j
	)
	REM On a URL line, set URL variable to current URL.
	if !i! equ 2 (
		set URL=%%j
		REM Check if that mod exists. If it doesn't, add the mod .jar and URL to newmods.txt.
		echo [32mChecking for !mod![0m
		if exist %USERPROFILE%\AppData\Roaming\.minecraft\mods\!mod! (
			echo [32mFound !mod![0m
		) else (
			echo [92mMissing Mod Found: [93m!mod![0m
			set /a count+=1
			set /a new+=1
			echo !mod! >> newmods.txt
			echo !url! >> newmods.txt
		)
	)
	REM Increment our count variable, but make sure it's only 1 or 2.
	set /a i+=1
	if !i! equ 3 set i=1
)

REM Find any mods in the mods folder that aren't in the master list. Add their filenames to oldmods.txt.
for /f "delims=" %%j in (installedmods.txt) do (
	set mod=%%j
	findstr /c:"%%j" modlist.txt >nul
	if errorlevel 1 (
		echo [91mOld Mod Found: [93m%%j[0m
		set /a count+=1
		set /a old+=1
		echo %%j >> oldmods.txt
	)
)
echo.
echo Finished comparing^^!
timeout 1 /nobreak >nul
if !count! == 0 (
	goto :finishedNoChanges
)

REM Show which mods will be deleted and/or downloaded.
cls
echo.
if !old! GTR 0 (
	for /f "delims=" %%j in (oldmods.txt) do (
		echo [31mDelete: %%j[0m
	)
)
set i=1
if !new! GTR 0 (
	for /f "delims=" %%j in (newmods.txt) do (
		if !i! equ 1 (
			set mod=%%j
		)
		if !i! equ 2 (
			echo [32mInstall: !mod![0m
		)
		set /a i+=1
		if !i! equ 3 set i=1
	)
)
echo.
echo Your mods folder is not compatible with the server^^!
echo The actions above will be performed. Review before proceeding.
echo Press any key to continue...
pause >nul

echo Getting ready to update.
set "somethingwentwrong=false"
echo Making sure that doesn't already exist...
if exist downloadfailed.txt del downloadfailed.txt
if exist deletefailed.txt del deletefailed.txt
echo Ready!

REM Delete old mods listed in oldmods.txt.
if !old! GTR 0 (
	cls
	echo [41;97m Deleting Old Mods... [0m
	for /F "tokens=*" %%A in (oldmods.txt) do (
		echo [91m Deleting %%A[0m
		del %%A
		if exist %%a (
			echo [31mCouldn't delete !%%a![0m
			echo [33mAttempting to delete again...[0m
			del %%a
			if exist %%a (
				echo [41;97m[ERROR^^!] !%%a! failed to download^^![0m
				echo %%A >> deletefailed.txt
				set "somethingwentwrong=true"
			) else (
				echo [92mDeleted !%%a![0m
			)
		) else (
			echo [92mDeleted !%%a![0m
		)
	)
	echo.
	echo Finished deleting old mods.
	timeout 2 /nobreak >nul
)

REM Download new mods in newmods.txt.
if !new! GTR 0 (
	cls
	echo [42;97m Downloading New Mods... [0m
	echo Beginning download...
	set i=1
	for /f "delims=" %%j in (newmods.txt) do (
		if !i! equ 1 (
			set mod=%%j
		)
		if !i! equ 2 (
			set URL=%%j
			echo [32mDownloading !mod![0m
			curl !URL! --output "!mod!"
			if not exist !mod! (
				echo [31mCouldn't download !mod![0m
				echo [33mAttempting to download again...[0m
				curl !URL! --output "!mod!"
				if not exist !mod! (
					echo [41;97m[ERROR^^!] !mod! failed to download^^![0m
					echo !mod! >> downloadfailed.txt
					set "somethingwentwrong=true"
				) else (
					echo [92mDownloaded !mod![0m
				)
			) else (
				echo [92mDownloaded !mod![0m
			)
		)
		set /a i+=1
		if !i! equ 3 set i=1
	)
	echo [92mFinished downloading new mods^^![0m
	timeout 2 /nobreak >nul
)

cls
echo [42;97m Cleaning Up... [0m
echo Deleting temp files...
cd /d %USERPROFILE%\AppData\Roaming\.minecraft\mods
del modlist.txt
del installedmods.txt
del newmods.txt
del oldmods.txt
del modpackversion.txt
	
if !somethingwentwrong! == true (
	cls
	del modpacklatest.txt
	echo [101;97m[ERROR^^!] Update Failed^^! [0m
	echo.
	if exist downloadfailed.txt (
		for /f "delims=" %%j in (downloadfailed.txt) do (
			echo [91m%%j failed to install^^![0m
		)
		del downloadfailed.txt
	)
	if exist deletefailed.txt (
		for /f "delims=" %%j in (deletefailed.txt) do (
			echo [91m%%j failed to uninstall^^![0m
		)
		del deletefailed.txt
	)
	echo Please take a screenshot of this and send to Max!
	echo Press any key to close the script.
	pause >nul
	exit
)

:finishedMadeChanges
copy modpacklatest.txt modpackversion.txt
del modpacklatest.txt
cls
echo [42;97m Finished! [0m
echo All mods have been successfully updated^^!
echo The script has deleted all temporary files and will
echo close automatically.
timeout 10
exit

:finishedNoChanges
del modpackversion.txt
copy modpacklatest.txt modpackversion.txt
del modpacklatest.txt
del modlist.txt
del installedmods.txt
cls
echo [42;97m Finished! [0m
echo It looks like everything is up to date^^!
echo I've deleted any temp files and will close automatically.
timeout 10
exit

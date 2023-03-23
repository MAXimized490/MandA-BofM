@echo off
setlocal enableDelayedExpansion
title Max^'s Modpack Script
echo This script will automatically install, move, and
echo delete files on your computer and will open webpages.
echo By using this script, you acknowledge that you
echo understand the inherent risks of running such a
echo program and understand that I am not liable for
echo anything this script does to your computer.
echo You are running this script at your own risk.
echo.
echo [92mPress any key to acknowledge the above and start the script...[0m
pause >nul

cls
echo [41;97m NOTICE [0m
echo CurseForge recently updated their website and this
echo broke some functionality. I have updated this script
echo for now but it's possible you will run into issues
echo where the script downloads the wrong versions of mods.
echo If this happens, just DM me and I will update the
echo list. You will not have to redownload this script.
echo.
echo [92mPress any key to continue...[0m
pause >nul

cls
echo [101;97m YOU SHOULD HAVE DOWNLOADED THIS DIRECTLY FROM THE GUILDED GROUP^^![0m
echo [101;97m DO NOT DISTRIBUTE THIS SCRIPT WITH ANYONE^^! [0m
echo.
echo [96mMax's Modpack Script
echo [33mVersion 1.2.1
echo [93mPlease check for new versions on Guilded^^![0m
echo.
echo Press any key to begin^^!
echo The script will start automatically in 10 seconds.
timeout 10 >nul

cls
echo [41;97m Checking your PC... [0m
echo Checking if you have Java...
where java >nul 2>nul
if %errorlevel%==1 (
	cls
	echo [101;97m[ERROR^^!] Can't find Java on your computer^^! [0m
	echo If you know you have Java installed, you can continue
	echo anyways. If you're not sure if you have Java, I can
	echo help you check. If you don't have Java, I can either
	echo open the download page for you or close the script.
	echo.
	echo What would you like to do^?
	echo Type "download","check","quit", or "continue".
	echo.
	set /p "input=[33mI'd like to [93m"
	if !input! == continue (
		echo [92mContinuing...[0m
		timeout 1 /nobreak >nul
	)
	if !input! == check (
		cls
		echo [41;97m Checking for Java... [0m
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
			cls
			echo [101;97m[ERROR^^!] No Java^^! [0m
			echo You will need Java to continue. I will open the Java
			echo download page on your default browser and then close.
			echo Download the "x64 Installer".
			echo.
			echo Press any key to continue...
			pause >nul
			start "" "https://www.oracle.com/java/technologies/downloads/#jdk19-windows"
			exit
		)
	)
	if !input! == download (
		cls
		echo [101;97m[ERROR^^!] No Java^^! [0m
		echo You will need Java to continue. I will open the Java
		echo download page on your default browser and then close.
		echo Download the "x64 Installer".
		echo.
		echo Press any key to continue...
		pause >nul
		start "" "https://www.oracle.com/java/technologies/downloads/#jdk19-windows"
		exit
	)
	if !input! == quit (
		cls
		echo [101;97m[ERROR^^!] No Java^^! [0m
		echo Sorry, but you need Java to play modded Minecraft.
		echo This script will automatically close in ten seconds.
		timeout 10 /nobreak
		exit
	)
) else (
	echo [92mJava found^^![0m
)
if !input! == continue (
	cls
	echo [41;97m Checking your PC... [0m
	echo Checking for Java...
	echo [93mSkipped^^![0m
	timeout 1 /nobreak >nul
)
echo Checking if you have Forge...
if not exist %USERPROFILE%\AppData\Roaming\.minecraft\versions\1.19.2-forge-43.2.0 (
	cls
	echo [41;97m Checking for Forge... [0m
	echo You do not have the correct forge version installed on
	echo your computer. You need [93mForge 43.2.0[0m for [93m1.19.2[0m.
	echo.
	echo The preferred way to install Forge is by going to
	echo their website. You will have to see an ad, but it
	echo supports the development team. I can download it for
	echo you. You can also quit if you'd like. If you think you
	echo have the correct Forge version installed, you can
	echo continue.
	echo.
	echo What would you like to do^?
	echo Type "visit website", "download", "quit", or "continue".
	set /p "input=[33mI'd like to [93m"
	if !input! == continue (
		echo [92mContinuing...[0m
		timeout 1 /nobreak >nul
	)
	if !input! == download (
		cls
		echo [42;97m Downloading Forge... [0m
		echo While downloading Forge directly is convenient, you
		echo are skipping the ad that Forge uses to fund
		echo development. Consider giving a small donation.
		echo [7mhttps://www.patreon.com/LexManos[0m
		timeout 5 /nobreak >nul
		echo.
		echo [32mDownloading forge-1.19.2-43.2.0-installer.jar[0m
		curl -OJ --silent https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.2.0/forge-1.19.2-43.2.0-installer.jar
		echo [92mInstalled forge-1.19.2-43.2.0-installer.jar[0m
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
		java -jar forge-1.19.2-43.2.0-installer.jar >nul
		echo [92mInstaller was closed^^![0m
		timeout 1 /nobreak >nul
		cls
		echo [41;97m Checking for Forge... [0m
		echo I will now check to see if the installation was successful.
		timeout 5 /nobreak >nul
		echo.
		echo [93mChecking...[0m
		if not exist %USERPROFILE%\AppData\Roaming\.minecraft\versions\1.19.2-forge-43.2.0 (
			cls
			echo [101;97m[ERROR^^!] No Forge^^! [0m
			echo Sorry, but I couldn't find Forge on your computer. You
			echo can try running the script again and saying continue,
			echo but you won't be able to play if Forge isn't installed
			echo properly. I've kept the installer on your computer in
			echo case you need it.
			echo.
			echo This script will automatically close in ten seconds.
			timeout 10 /nobreak
			exit
		) else (
			echo [92mForge found at %USERPROFILE%\AppData\Roaming\.minecraft\versions\1.19.2-forge-43.2.0[0m
			echo.
			echo [92m Deleting installer...
			del forge-1.19.2-43.2.0-installer.jar
			echo Deleting log...[0m
			del installer.log
			timeout 1 /nobreak >nul
		)
	)
	if "!input!" == "visit website" (
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
		echo Press any key once Forge is finished installing.
		pause >nul
		cls
		echo [41;97m Checking for Forge... [0m
		echo I will now check to see if you installed Forge.
		timeout 5 /nobreak >nul
		echo.
		echo [93mChecking...[0m
		if not exist %USERPROFILE%\AppData\Roaming\.minecraft\versions\1.19.2-forge-43.2.0 (
			cls
			echo [101;97m[ERROR^^!] No Forge^^! [0m
			echo Sorry, but I couldn't find Forge on your computer. You
			echo can try running the script again and saying continue,
			echo but you won't be able to play if Forge isn't installed
			echo properly.
			echo.
			echo This script will automatically close in ten seconds.
			timeout 10 /nobreak
			exit
		) else (
			echo [92mForge found at %USERPROFILE%\AppData\Roaming\.minecraft\versions\1.19.2-forge-43.2.0[0m
			timeout 1 /nobreak >nul
		)
	)
	if !input! == quit (
		cls
		echo [101;97m[ERROR^^!] No Forge^^! [0m
		echo Sorry, but you need Forge to play modded Minecraft.
		echo This script will automatically close in ten seconds.
		timeout 10 /nobreak
		exit
	)
) else (
	echo [92mForge found^^![0m
)
if !input! == continue (
	cls
	echo [41;97m Checking your PC... [0m
	echo Checking for Java...
	echo [92mJava was checked^^![0m
	echo Checking for Forge...
	echo [93mSkipped^^![0m
	timeout 1 /nobreak >nul
)
if !input! == download (
	cls
	echo [41;97m Checking your PC... [0m
	echo Checking for Java...
	echo [92mJava was checked^^![0m
	echo Checking for Forge...
	timeout 1 /nobreak >nul
	echo [92mForge found^^![0m
	timeout 1 /nobreak >nul
)
if "!input!" == "visit website" (
	cls
	echo [41;97m Checking your PC... [0m
	echo Checking for Java...
	echo [92mJava was checked^^![0m
	echo Checking for Forge...
	timeout 1 /nobreak >nul
	echo [92mForge found^^![0m
	timeout 1 /nobreak >nul
)
echo Checking if you have a mods folder...
if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods (
	cls
	echo [41;97m No mods folder! [0m
	echo You don't have a mods folder. If you just installed
	echo Forge then this is normal. I'll go ahead and make it
	echo for you, but I still need to ask you just in case.
	echo.
	echo Press Enter to create a mods folder or type "quit".
	set /p "input=[93m"
	if !input! == "" (
		echo.
		echo [32mMaking mods folder...[0m
		mkdir %USERPROFILE%\AppData\Roaming\.minecraft\mods
		timeout 1 /nobreak >nul
		echo [92mMods folder created at %USERPROFILE%\AppData\Roaming\.minecraft\mods[0m
		timeout 1 /nobreak >nul
	)
) else (
	echo [92mMods folder found^^![0m
)
if !input! == make (
	cls
	echo [41;97m Checking your PC... [0m
	echo Checking for Java...
	echo [92mJava was checked^^![0m
	echo Checking for Forge...
	echo [92mForge was checked^^![0m
	echo Checking if you have a mods folder...
	echo [92mMods folder found^^![0m
	timeout 1 /nobreak >nul
)

echo Checking for old script files...
cd %USERPROFILE%\AppData\Roaming\.minecraft\mods
for /f %%F in ('dir /b /a-d ^| findstr /vile ".jar"') do (
	if not %%F == modpackversion.txt (
		del "%%F"
	)
)
echo [92mNo files found^^![0m
timeout 1 /nobreak >nul

cls
echo [43;97m Checking your Modpack... [0m
echo [32mGetting details on latest version...[0m
curl --silent https://pastebin.com/raw/dYcj3JAJ --output modpacklatest.txt
set /p latest=< modpacklatest.txt
echo [92mFound^^! Latest version is !latest![0m
echo [32mComparing...[0m
if exist modpackversion.txt (
	set /p current=< modpackversion.txt
) else (
	echo Error^^!
	set "current=unknown"
)

cls
echo [42;97m Ready^^! [0m
echo Welcome to the script^^!
echo.
if !current! == unknown (
echo [33mThere was an error checking your modpack version. The
echo latest version is [31m!latest![33m. This is normal
echo if you are running this script for the first time.
echo Otherwise, type update to see if you're missing anything^^![0m
) else (
	if !current! == !latest! (
		echo [92m[4mYou have the latest modpack version^^![0m
		echo [32mIf you think something is wrong with your pack,
		echo type update to check for any missing files.[0m
	) else (
		echo [93mYou do not have the latest version^^! Please update^^!
		echo Latest: [92m!latest![93m
		echo You Have: [91m!current![0m
	)
)
echo.
echo Would you like to install or update the modpack^?
echo Never say install if you've already installed before^^!
echo.
echo Type "install" or "update".
set /p "input=[33mI'd like to [93m"
if !input! == install (
	cls
	echo [42;97m Downloading Mods... [0m
	echo [32mGetting latest mod list...[0m
	cd %USERPROFILE%\AppData\Roaming\.minecraft\mods
	curl --silent https://pastebin.com/raw/3J8NVv76 --output modlist.txt
	for /f %%a in ('find /c /v "" ^< modlist.txt') do set count=%%a
	set /a count=!count!/2
	echo [92mDownloaded latest mod list^^! !count! mods found.[0m
	echo.
	echo [32mBegin download...[0m
	set i=1
	for /f "usebackq tokens=*" %%a in ("modlist.txt") do (
		if !i! equ 1 (
			set mod=%%a
		) else (
			set URL=%%a
			echo [32mDownloading !mod![0m
			curl --silent !URL! --output "!mod!"
			if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods\!mod! (
				echo [101;93m[Error^^!] Couldn't download !mod![0m
			) else (
				echo [92mDownloaded !mod![0m
			)
		)
		set /a i+=1
		if !i! equ 3 set i=1
	)
	echo.
	echo [92mFinished downloading all mod downloads.[0m
rem	timeout 3 /nobreak >nul
	timeout 20
	
	cls
	echo [43;97m Checking... [0m
	echo I will now check to make sure all of the mods have
	echo downloaded.
	timeout 5 /nobreak >nul
	echo  [32mStartingcheck...[0m
	set missing=false
	set somethingwentwrong=false
	set i=1
	for /f "usebackq tokens=*" %%a in ("modlist.txt") do (
		if !i! equ 1 (
			set mod=%%a
			if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods\!mod! (
				set missing=true
				echo [101;93mYou are missing !mod!^^![0m
				timeout 1 /nobreak >nul
			) else (
				echo [92mFound !mod!^^![0m
			)
		) else (
			set URL=%%a
			if !missing! == true (
				echo [93mAttempting to download !mod![93m
				curl --silent !URL! --output "!mod!"
				if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods\!mod! (
					echo [101;93m[Error^^!] Couldn't download !mod![0m
					echo !mod! >> newfailed.txt
					set somethingwentwrong=true
				) else (
					echo [92mDownloaded !mod![0m
				)
				set missing=false
			)
		)
		set /a i+=1
		if !i! equ 3 set i=1
	)
	echo.
	echo [92mFinished checking![0m
	timeout 1 /nobreak >nul
	if !somethingwentwrong! == true (
		cls
		echo [101;97m[ERROR^^!] Some Mods Couldn^'t Download^^! [0m
		echo Unfortunately, some mods weren't able to download.
		echo Press any key to see a list of these mods.
		pause >nul
		for /F "tokens=*" %%A in (newfailed.txt) do (
			echo [91m%%A[0m
		)
		del modlist.txt
		del newfailed.txt
		echo.
		echo Press any key to finish.
		pause >nul
		echo Claned up temp files. Closing script...
		timeout 2 /nobreak >nul
		exit
	)
	
	del modpackversion.txt
	copy modpacklatest.txt modpackversion.txt
	del modpacklatest.txt
	cls
	echo [42;97m Finished! [0m
	echo All mods have been successfully installed^^!
	echo The script has deleted any temporary files and will
	echo close automatically.
	timeout 10
	exit
) else (
	cls
	echo [42;97m Downloading... [0m
	echo [32mGetting latest mod list...[0m
	cd %USERPROFILE%\AppData\Roaming\.minecraft\mods
	curl --silent https://pastebin.com/raw/3J8NVv76 --output modlist.txt
	for /f %%a in ('find /c /v "" ^< modlist.txt') do set count=%%a
	set /a count=!count!/2
	echo [92mDownloaded latest mod list^^! !count! mods found.[0m
	timeout 1 /nobreak >nul
	
	cls
	echo [42;97m Comparing... [0m
	echo.
	cd %USERPROFILE%\AppData\Roaming\.minecraft\mods
	dir /b *.jar > installedmods.txt
	set count=0
	set old=0
	set new=0
	set i=1
	for /f "delims=" %%j in (modlist.txt) do (
		if !i! equ 1 (
			set mod=%%j
		)
		if !i! equ 2 (
			set URL=%%j
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
		set /a i+=1
		if !i! equ 3 set i=1
	)
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
		del modpackversion.txt
		copy modpacklatest.txt modpackversion.txt
		del modpacklatest.txt
		del modlist.txt
		del installedmods.txt
		cls
		echo [42;97m Finished! [0m
		echo It looks like your mods folder is up to date^^!
		echo I've deleted any temp files and will close automatically.
		timeout 10
		exit
	)
	echo Your mods folder is not compatible with the server^^!
	echo The following actions will be performed:
	echo.
	if !old! GTR 0 (
		for /f "delims=" %%j in (oldmods.txt) do (
			echo [31mDelete: %%j[0m
		)
	)
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
	echo Press any key to continue...
	pause >nul
	
	if !old! GTR 0 (
		cls
		echo [41;97m Deleting Old Mods... [0m
		for /F "tokens=*" %%A in (oldmods.txt) do (
			echo [91m Deleting %%A[0m
			del %%A
		)
		echo.
		echo Finished deleting old mods.
		timeout 2 /nobreak >nul
	)
	
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
				curl --silent !URL! --output "!mod!"
				if exist !mod! (
					echo [92mDownloaded !mod![0m
				) else (
					echo [101;93m[Error^^!] Couldn't download !mod![0m
				)
			)
			set /a i+=1
			if !i! equ 3 set i=1
		)
		echo [92mFinished downloading new mods^^![0m
		timeout 2 /nobreak >nul
	)
	
	cls
	echo [43;97m Checking... [0m
	echo I will now check to make sure everything is updated.
	echo If it isn't then you're fucked. :P
	timeout 4 /nobreak >nul
	cd %USERPROFILE%\AppData\Roaming\.minecraft\mods
	echo Making sure failed.txt doesn't already exist...
	if exist failed.txt del failed.txt
	set missing=false
	set "somethingwentwrong=false"
	set i=1
	for /f "usebackq tokens=*" %%a in ("modlist.txt") do (
		if !i! equ 1 (
			set mod=%%a
			if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods\!mod! (
				set missing=true
				echo [101;93mYou are missing !mod!^^![0m
				timeout 1 /nobreak >nul
			) else (
				echo [92mFound !mod!^^![0m
			)
		) else (
			set URL=%%a
			if !missing! == true (
				echo Attempting to download the mod again...
				curl --silent !URL! --output "!mod!"
				if not exist %USERPROFILE%\AppData\Roaming\.minecraft\mods\!mod! (
					echo [101;93m[Error^^!] Couldn't download !mod![0m
					echo !mod! >> newfailed.txt
					set "somethingwentwrong=true"
					timeout 1 /nobreak >nul
				)
				set missing=false
			)
		)
		set /a i+=1
		if !i! equ 3 set i=1
	)
	if exist oldmods.txt (
		for /F "tokens=*" %%A in (oldmods.txt) do (
			if exist %USERPROFILE%\AppData\Roaming\.minecraft\mods\%%A (
				echo %%A is still installed^^!
				echo %%A >> oldfailed.txt
				set "somethingwentwrong=true"
			)
		)
	)
	
	echo.
	echo [92mFinished checking![0m
	timeout 1 >nul
	
	cls
	echo [42;97m Cleaning Up... [0m
	echo Deleting temp files...
	cd %USERPROFILE%\AppData\Roaming\.minecraft\mods
	del modlist.txt
	del installedmods.txt
	del newmods.txt
	del oldmods.txt
	
	if !somethingwentwrong! == true (
		cls
		del modpackversion.txt
		del modpacklatest.txt
		echo [101;97m[ERROR^^!] Update Failed^^! [0m
		echo.
		if exist newfailed.txt (
			for /f "delims=" %%j in (newfailed.txt) do (
				echo [91m%%j failed to install^^![0m
			)
			del newfailed.txt
		)
		if exist oldfailed.txt (
			for /f "delims=" %%j in (oldfailed.txt) do (
				echo [91m%%j failed to uninstall^^![0m
			)
			del oldfailed.txt
		)
		echo Please take a screenshot of this and send to Loli!
		echo Press any key to close the script.
		pause >nul
		exit
	)

	del modpackversion.txt
	copy modpacklatest.txt modpackversion.txt
	del modpacklatest.txt
	cls
	echo [42;97m Finished! [0m
	echo All mods have been successfully updated^^!
	echo The script has deleted all temporary files and will
	echo close automatically.
	timeout 10
	exit
)
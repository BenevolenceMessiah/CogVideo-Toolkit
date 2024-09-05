@echo off
setlocal

:::  ________  _______   ________   _______   ___      ___ ________  ___       _______   ________   ________  _______      
::: |\   __  \|\  ___ \ |\   ___  \|\  ___ \ |\  \    /  /|\   __  \|\  \     |\  ___ \ |\   ___  \|\   ____\|\  ___ \     
::: \ \  \|\ /\ \   __/|\ \  \\ \  \ \   __/|\ \  \  /  / | \  \|\  \ \  \    \ \   __/|\ \  \\ \  \ \  \___|\ \   __/|    
:::  \ \   __  \ \  \_|/_\ \  \\ \  \ \  \_|/_\ \  \/  / / \ \  \\\  \ \  \    \ \  \_|/_\ \  \\ \  \ \  \    \ \  \_|/__  
:::   \ \  \|\  \ \  \_|\ \ \  \\ \  \ \  \_|\ \ \    / /   \ \  \\\  \ \  \____\ \  \_|\ \ \  \\ \  \ \  \____\ \  \_|\ \ 
:::    \ \_______\ \_______\ \__\\ \__\ \_______\ \__/ /     \ \_______\ \_______\ \_______\ \__\\ \__\ \_______\ \_______\
:::     \|_______|\|_______|\|__| \|__|\|_______|\|__|/       \|_______|\|_______|\|_______|\|__| \|__|\|_______|\|_______|
::: 
:::  _____ ______   _______   ________   ________  ___  ________  ___  ___     
::: |\   _ \  _   \|\  ___ \ |\   ____\ |\   ____\|\  \|\   __  \|\  \|\  \    
::: \ \  \\\__\ \  \ \   __/|\ \  \___|_\ \  \___|\ \  \ \  \|\  \ \  \\\  \   
:::  \ \  \\|__| \  \ \  \_|/_\ \_____  \\ \_____  \ \  \ \   __  \ \   __  \  
:::   \ \  \    \ \  \ \  \_|\ \|____|\  \\|____|\  \ \  \ \  \ \  \ \  \ \  \ 
:::    \ \__\    \ \__\ \_______\____\_\  \ ____\_\  \ \__\ \__\ \__\ \__\ \__\
:::     \|__|     \|__|\|_______|\_________\\_________\|__|\|__|\|__|\|__|\|__|
:::                             \|_________\|_________|
::: ___  ________   ________  _________  ________  ___       ___       _______   ________     
::: |\  \|\   ___  \|\   ____\|\___   ___\\   __  \|\  \     |\  \     |\  ___ \ |\   __  \    
::: \ \  \ \  \\ \  \ \  \___|\|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \   __/|\ \  \|\  \   
:::  \ \  \ \  \\ \  \ \_____  \   \ \  \ \ \   __  \ \  \    \ \  \    \ \  \_|/_\ \   _  _\  
:::   \ \  \ \  \\ \  \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \____\ \  \_|\ \ \  \\  \| 
:::    \ \__\ \__\\ \__\____\_\  \   \ \__\ \ \__\ \__\ \_______\ \_______\ \_______\ \__\\ _\ 
:::     \|__|\|__| \|__|\_________\   \|__|  \|__|\|__|\|_______|\|_______|\|_______|\|__|\|__|
:::                    \|_________|

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:: Play soundbyte from audio
if not exist audio\ mkdir audio
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..

timeout /t 3

:: Download the repo code if its not downloaded.
echo As-salamu alaykum!!
echo detecting presence of repo, git cloning if not detected...
echo ---------------------------------------------------------------
if exist docs\ goto Menu1
git clone https://github.com/BenevolenceMessiah/CogVideo-Toolkit.git
cd CogVideo-Toolkit
git pull
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------

:Menu1
echo ---------------------------------------------------------------
echo Please choose from the following options:
echo - Press Ctrl+c to exit at any time!
echo ---------------------------------------------------------------
echo 1) Install CogVideo (Please make sure your Python version is between 3.10 
echo    and 3.12, inclusive of both 3.10 and 3.12 - if it's not, select option 'X').
echo 2) Run CogVideo locally... (via Gradio, Jupyter, Streamlit, etc.).
echo 3) Run CogVideoX-5B remotely (Via HuggingFace Spaces, Google Colab).
echo 4) Tools Menu. (Quantization, )
echo 5) Training Menu.
echo X) Install/reinstall/fix Python and Git. (Only do this if you don't have these installed
echo    or in the event you encounter errors related to Python or Git.)
echo C) Exit.
echo U) Update repo.
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 1 goto Install
if %option% == 2 goto Local
if %option% == 3 goto Remote
if %option% == 4 goto Tools
if %option% == 5 goto Training
if %option% == X goto Python/GitInstall
if %option% == x goto Python/GitInstall
if %option% == C goto End
if %option% == c goto End
if %option% == U goto Updater
if %option% == u goto Updater

:Install
echo ---------------------------------------------------------------
echo Creating virtual environment
echo ---------------------------------------------------------------
if not exist venv (
    py -3.12 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
python.exe -m pip install --upgrade pip
pip install Jupyter
git clone https://github.com/BenevolenceMessiah/CogVideoX-5B-Jupyter.git
pip install -r requirements.txt
cd sat
echo Installing SAT weight and Finetuning requirments...
echo ---------------------------------------------------------------
pip install -r requirements.txt
echo ---------------------------------------------------------------
Downloading 2B SAT Model...
echo ---------------------------------------------------------------
if not exist CogVideoX-2b-sat\ mkdir CogVideoX-2b-sat
cd CogVideoX-2b-sat
:: Download VAE
cd /d %~dp0
call curl "https://cloud.tsinghua.edu.cn/f/fdba7608a49c463ba754/?dl=1" -o vae.zip
:: Unzip assets.
powershell -command "Expand-Archive -Force '%~dp0*.zip' '%~dp0'"
:: Delete .zip archive if it exists.
if exist vae.zip del vae.zip
:: Download Transformer
cd /d %~dp0
call curl "https://cloud.tsinghua.edu.cn/f/556a3e1329e74f1bac45/?dl=1" -o transformer.zip
:: Unzip assets.
powershell -command "Expand-Archive -Force '%~dp0*.zip' '%~dp0'"
:: Delete .zip archive if it exists.
if exist transformer.zip del transformer.zip
cd ..
echo ---------------------------------------------------------------
Downloading 5B SAT Model...
echo ---------------------------------------------------------------
if not exist CogVideoX-5b-sat\ mkdir CogVideoX-5b-sat
cd CogVideoX-5b-sat
cd /d %~dp0
call curl "https://cloud.tsinghua.edu.cn/f/556a3e1329e74f1bac45/?dl=1" -o transformer.zip
:: Unzip assets.
powershell -command "Expand-Archive -Force '%~dp0*.zip' '%~dp0'"
:: Delete .zip archive if it exists.
if exist transformer.zip del transformer.zip
start start https://cloud.tsinghua.edu.cn/d/fcef5b3904294a6885e5/?p=%2F&mode=list
echo ---------------------------------------------------------------
echo Downloading the T5 model and configuration...
echo ---------------------------------------------------------------
timeout /t -1
cd ..
git lfs install
git clone https://huggingface.co/THUDM/CogVideoX-2b.git
if not exist t5-v1_1-xxl\ mkdir t5-v1_1-xxl
mv CogVideoX-2b/text_encoder/* CogVideoX-2b/tokenizer/* t5-v1_1-xxl
cd configs 
start call cogvideox_2b.yaml
start call cogvideox_5b.yaml
cd ..
cd ..
cd inference
cd gradio_composite_demo
echo Installing Gradio Demo requirments...
echo ---------------------------------------------------------------
pip install -r requirements.txt
cd .. 
cd ..
echo Installation Complete! Be sure to check for any errors!
echo ---------------------------------------------------------------
timeout /t -1
goto Menu1

:Local
echo ---------------------------------------------------------------
echo Creating virtual environment
echo ---------------------------------------------------------------
if not exist venv (
    py -3.12 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
echo Chose any or multiple options!
echo ---------------------------------------------------------------
echo 6) Run CogVideoX-2B locally via Gradio.
echo 7) Run CogVideoX-5B locally via Gradio. (Recommended)
echo 8) Run CogVideoX-2B locally via CLI.
echo 9) Run CogVideoX-5B locally via Jupyter Notebook.
echo 10) Run CogVideoX-2B locally via Streamlit Web-App.
echo M) Main Menu
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 6 goto Run1
if %option% == 7 goto Run2
if %option% == 8 goto CLI
if %option% == 9 goto Jupyter
if %option% == 10 goto Streamlit
if %option% == M goto Menu1
if %option% == C goto End
if %option% == c goto End

:Run1
echo Launching Gradio for 2B model!
echo ---------------------------------------------------------------
cd inference
start call python gradio_web_demo.py
cd ..
goto Local

:Run2
echo Launching Gradio for 5B model!
echo ---------------------------------------------------------------
cd inference
cd gradio_composite_demo
start call python app.py
cd ..
cd ..
goto Local

:CLI
echo Launching CLI for 2B model!
echo launching 3 demos!
echo ---------------------------------------------------------------
cd inference
start call python cli_demo.py
start call python cli_demo_quantization.py
start call python cli_vae_demo.py
cd ..
goto Local

:Jupyter
cd CogVideoX-5B-Jupyter
start call jupyter notebook CogVideoX_5B_jupyter_free.ipynb
cd ..
goto Local

:Streamlit
echo Launching Streamlit for 2B model!
echo ---------------------------------------------------------------
cd inference
start call python streamlit_web_demo.py
cd ..
goto Local


:Remote
echo ---------------------------------------------------------------
echo Chose any or multiple options!
echo ---------------------------------------------------------------
echo 4) Run CogVideoX-5B remotely Via Google Colab.
echo 5) Run CogVideoX-5B remotely Via Google Colab Pro.
echo 3) Run CogVideoX-5B remotely via HuggingFace Sapces (Recommended)
echo M) Main Menu
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 6 goto LaunchRemote1
if %option% == 7 goto LaunchRemote2
if %option% == 8 goto LaunchRemote3
if %option% == M goto Menu1
if %option% == C goto End
if %option% == c goto End

:LaunchRemote1
echo Launching via Google Colab...
echo You may close the excess CMD window.
echo ---------------------------------------------------------------
start start https://colab.research.google.com/github/camenduru/CogVideoX-5B-jupyter/blob/main/CogVideoX_5B_jupyter_free.ipynb
goto Remote

:LaunchRemote2
echo Launching via Google Colab Pro...
echo You may close the excess CMD window.
echo ---------------------------------------------------------------
start start https://colab.research.google.com/github/camenduru/CogVideoX-5B-jupyter/blob/main/CogVideoX_5B_jupyter.ipynb
goto Remote

:LaunchRemote3
echo Launching via HuggingFace Spaces...
echo You may close the excess CMD window.
echo ---------------------------------------------------------------
start start https://huggingface.co/spaces/THUDM/CogVideoX-5B-Space
goto Remote

:Python/GitInstall
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo What do you need to install?
echo ---------------------------------------------------------------
echo 20) Install Git.
echo 21) Install Python 3.10. (Make sure to enable PATH)!
echo 22) Install Python 3.12. (Make sure to enable PATH)!
echo M) Main Menu
echo R) Restart the .bat file (do this after installing any or all of these).
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 20 goto GitInstall
if %option% == 21 goto PythonInstall
if %option% == 22 goto PythonInstall2
if %option% == R goto RestartCMD
if %option% == M goto Menu1
if %option% == C goto End

:GitInstall
echo Installing Git...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe" -o Git-2.46.0-64-bit.exe
start call Git-2.46.0-64-bit.exe
goto Python/GitInstall

:PythonInstall
echo Installing Python 3.10...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe" -o python-3.10.6-amd64.exe
start call python-3.10.6-amd64.exe
goto Python/GitInstall

:PythonInstall2
echo Installing Python 3.12...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://www.python.org/ftp/python/3.12.5/python-3.12.5-amd64.exe" -o python-3.12.5-amd64.exe
start call python-3.12.5-amd64.exe
goto Python/GitInstall

:RestartCMD
echo Restarting...
echo Deleting installer .exe files if they exist...
echo ---------------------------------------------------------------
if exist Git-2.46.0-64-bit.exe del Git-2.46.0-64-bit.exe
if exist python-3.10.6-amd64.exe del python-3.10.6-amd64.exe
if exist python-3.12.5-amd64.exe del python-3.12.5-amd64.exe
start call Run_CogVideo.bat
exit

:Updater
echo ---------------------------------------------------------------
echo Updating repo...
echo ---------------------------------------------------------------
ls | xargs -I{} git -C {} pull
echo Complete!
echo ---------------------------------------------------------------
goto Menu1

:End 
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo ---------------------------------------------------------------
pause
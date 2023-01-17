FROM mcr.microsoft.com/windows/nanoserver:ltsc2022

# Install pyenv
RUN powershell -Command "Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1' -OutFile './install-pyenv-win.ps1'; &'./install-pyenv-win.ps1'"

RUN pyenv install 3.11.1

RUN pyenv 3.11.1

RUN python --version



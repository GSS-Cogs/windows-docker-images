FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Install pyenv
# N.B. It alleges it fails, but don't necessarily believe it. 
RUN powershell -Command "Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1' -OutFile './install-pyenv-win.ps1'; &'./install-pyenv-win.ps1'"

# Install python versions
RUN pyenv install 3.11.1
RUN pyenv install 3.10.9
RUN pyenv install 3.9.15

# Set global version of python.
RUN pyenv global 3.11.1
# Check version of python in use.
RUN python --version

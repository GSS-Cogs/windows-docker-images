FROM mcr.microsoft.com/powershell:lts-7.2-nanoserver-ltsc2022

ARG PYRIGHT_VERSION=1.1.287

# Install pyenv
# N.B. It alleges it fails, but don't necessarily believe it. 
ADD https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1 install-pyenv-win.ps1
RUN PowerShell\pwsh.exe -Command "&'./install-pyenv-win.ps1'"

# Install python versions
RUN pyenv install 3.11.1
RUN pyenv install 3.10.9
RUN pyenv install 3.9.13
# RUN pyenv install --list 

# Set global version of python.
RUN pyenv global 3.11.1
# Check version of python in use.
RUN python --version

# Install poetry
RUN pip install poetry

# Install git (necessary for csvlint)
ADD https://github.com/git-for-windows/git/releases/download/v2.39.0.windows.2/Git-2.39.0.2-64-bit.exe git-install.exe
RUN git-install.exe /SILENT

# Install ruby
ADD https://github.com/oneclick/rubyinstaller2/releases/download/rubyinstaller-2.4.3-1/rubyinstaller-2.4.3-1-x64.exe ruby-installer.exe
RUN ruby-installer.exe /silent
RUN ruby --version
RUN where ruby

# Install node/npm
ADD https://nodejs.org/dist/v18.13.0/node-v18.13.0-x86.msi node.msi
RUN msiexec /i node.msi
RUN node --version

# Install pyright
RUN npm install -g pyright@%PYRIGHT_VERSION%

# Install csvlint, csv2rdf and the SPARQL tests.
ADD csvlint-csv2rdf-sparqltests.ps1 csvlint-csv2rdf-sparqltests.ps1
RUN PowerShell\pwsh.exe -Command "&'./csvlint-csv2rdf-sparqltests.ps1'"


# By default launching application that will run indefinitely
# So we can run container as a daemon
ENTRYPOINT ["python"]
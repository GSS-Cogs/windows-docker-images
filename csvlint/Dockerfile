FROM mcr.microsoft.com/windows/nanoserver:ltsc2022

ARG CSVLINT_VERSION=v0.6.5

# Install chocolatey package manager
RUN powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install ruby
RUN choco install ruby

# Acquire csvlint and install it
ADD https://github.com/GSS-Cogs/csvlint.rb/archive/refs/tags/{CSVLINT_VERSION}.zip

RUN mkdir csvlint

# unzip '{CSVLINT_VERSION}.zip'
RUN powershell Expand-Archive -Path '{CSVLINT_VERSION}.zip' -DestinationPath 'csvlint'

WORKDIR csvlint
# Add csvlint (current directory) to the path environmental variable
RUN setx path "%path%;%cd"


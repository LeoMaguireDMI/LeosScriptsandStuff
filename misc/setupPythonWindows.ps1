# Ensure PowerShell Execution Policy is set to allow script execution
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Install pyenv-win
Invoke-WebRequest -Uri https://github.com/pyenv-win/pyenv-win/archive/refs/heads/master.zip -OutFile pyenv-win.zip
Expand-Archive pyenv-win.zip -DestinationPath $env:USERPROFILE\.pyenv
Remove-Item pyenv-win.zip

# Add pyenv to the path
$PYENV_ROOT = "$env:USERPROFILE\.pyenv\pyenv-win"
[Environment]::SetEnvironmentVariable('PYENV', $PYENV_ROOT, [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('PATH', "$env:Path;$PYENV_ROOT\bin;$PYENV_ROOT\shims", [EnvironmentVariableTarget]::Machine)

# Reload the environment variables
$env:PYENV = [System.Environment]::GetEnvironmentVariable('PYENV', [System.EnvironmentVariableTarget]::Machine)
$env:PATH = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::Machine)

# Restart PowerShell to apply the changes (this part can't be automated fully in a script, but we can prompt the user)
Write-Output "Please close and reopen PowerShell or Command Prompt to apply changes."

# After reopening PowerShell, continue with the following commands manually
Write-Output "After reopening PowerShell, run the following commands:"
Write-Output "  pyenv --version"
Write-Output "  pyenv install 3.9.7"
Write-Output "  pyenv global 3.9.7"
Write-Output "  python --version"

# Optional: Create a project directory and set up a virtual environment
Write-Output "To set up a virtual environment, run the following commands:"
Write-Output "  mkdir my_project"
Write-Output "  cd my_project"
Write-Output "  python -m venv venv"
Write-Output "  .\venv\Scripts\Activate"
Write-Output "  pip install pandas"
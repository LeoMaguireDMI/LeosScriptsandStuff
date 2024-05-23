$PYENV_ROOT = "$env:USERPROFILE\.pyenv\pyenv-win"
[Environment]::SetEnvironmentVariable('PYENV', $PYENV_ROOT, [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('PATH', "$env:Path;$PYENV_ROOT\bin;$PYENV_ROOT\shims", [EnvironmentVariableTarget]::Machine)

# Reload the environment variables for the current session
$env:PYENV = [System.Environment]::GetEnvironmentVariable('PYENV', [System.EnvironmentVariableTarget]::Machine)
$env:PATH = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::Machine)

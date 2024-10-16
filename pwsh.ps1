# Profile.ps1 for PWSH

# Aliases
Set-Alias vim neovide
Set-Alias less "C:\Program Files\git\usr\bin\less.exe"
Set-Alias grep findstr
Set-Alias touch New-Item
Set-Alias rm Remove-Item

# alias fn
function pconf {
    nvim "C:\Users\Manish Suthar\.config\powershell\user_profile.ps1"
}

function nconf {
    nvim "C:\Users\Manish Suthar\AppData\Local\nvim"
}


# laod prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'unicorn.omp.json'

oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# importing modules
Import-Module -Name terminal-icons

# AutoCompletion using PSReadLine
# Overwrite RightArrow key to complete single word.
Set-PSReadLineKeyHandler -Key RightArrow -Function forwardWord
# Ctrl+z to go back single word (default).

# Bind Alt+L to AcceptWholeSuggestion
Set-PSReadLineKeyHandler -Chord Alt+l -Function AcceptSuggestion



# change default open location
Set-Location "D:"

# allow-dubious-git to fix: detected dubious ownership in repository.
$env:GIT_ALLOW_DUBIOUS=1




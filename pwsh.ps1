# Aliases
Set-Alias less "C:\Program Files\git\usr\bin\less.exe"
Set-Alias grep findstr
Set-Alias touch New-Item
Set-Alias rm Remove-Item

# Native vim
function vim {
    nvim -u "$env:LOCALAPPDATA\nvim\init-legacy.vim" @args
}

# alias fn
function pconf {
    nvim "C:\Users\Manish Suthar\.config\powershell\user_profile.ps1"
}

function nconf {
    nvim "C:\Users\Manish Suthar\AppData\Local\nvim\config\keymaps.lua"
}

function gconf {
    nvim "C:\Users\Manish Suthar\.glzr\glazewm\config.yaml"
}

# Laod prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'unicorn.omp.json'

oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Importing modules
Import-Module -Name terminal-icons

# AutoCompletion using PSReadLine
# Overwrite RightArrow key to complete single word.
Set-PSReadLineKeyHandler -Key RightArrow -Function forwardWord
# Ctrl+z to go back single word (default).

# Bind Alt+L to AcceptWholeSuggestion
Set-PSReadLineKeyHandler -Chord ALT+";" -Function AcceptSuggestion

# ClearScreen on ctrl+l
Set-PSReadlineKeyHandler -Key 'Ctrl+l' -Function ClearScreen

# Change default open location
Set-Location "D:"

# Allow-dubious-git to fix: detected dubious ownership in repository.
$env:GIT_ALLOW_DUBIOUS=1


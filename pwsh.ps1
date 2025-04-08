# Aliases
Set-Alias less "C:\Program Files\git\usr\bin\less.exe"
Set-Alias grep findstr
Set-Alias touch New-Item
Set-Alias rm Remove-Item

# Git-Specific-Aliases

function gst {
	git status
}
function gaa {
	git add .
}
function glo {
	git log --oneline
}
function gph {
	git push
}
function gpl {
	git pull
}
function gba {
	git branch -a
}
function gr {
	git reset
}


# git commit -m & git push in single cmd
function gcp {
  param (
    [string]$msg
  )
  git commit -m "$msg"
  git push
}

# git add . and git commit -m in single cmd
function gacp {
  param (
    [string]$msg
  )
  git add .
  git commit -m "$msg"
  git push
}

# Alias: git commit -m msg
function gcmm {
  param (
    [string]$msg
  )
    git commit -m "$msg"
}

# Alias: git add file_path
function ga {
  param (
    [string]$path
  )
    git add "$path"
}

# Alias: git diff file_path
function gd {
  param (
    [string]$path
  )
    git diff "$path"
}

# Alias: git commit -am msg
function gcma {
  param (
    [string]$msg
  )
    git commit -am "$msg"
}


# Alias: git checkout branch_name
function gco {
  param (
    [string]$branch_name
  )
    git checkout "$branch_name"
}

# Alias: git checkout -b branch_name
function gcob {
  param (
    [string]$branch_name
  )
    git checkout -b "$branch_name"
}

# Alias: git branch branch_name
function gb {
  param (
    [string]$branch_name
  )
    git branch "$branch_name"
}

# NPM-Specific-Aliases
function ns {
	npm start
}
function nd {
	npm run dev
}
function nb {
	npm run build 
}

# Use legacy vim version
function vim {
    nvim -u "$env:LOCALAPPDATA\nvim\init-legacy.vim" @args
}

# Configurations-Specific-Aliases

# Powershell Configuration
function pconf {
    param (
        [ValidateSet("cd", "vim", "nvim", "cat", "less")]
        [string]$cmd
    )

    $filePath = "C:\Users\m4dd0c\.config\powershell\user_profile.ps1"

    switch ($cmd) {
        "cd" { Set-Location (Split-Path $filePath) }
        "vim" { vim $filePath }
        "nvim" { nvim $filePath }
        "cat" { cat $filePath }
        "less" { less $filePath }
        default { vim $filePath }
    }
}

# Neovim Configuration
function nconf {
    param (
        [ValidateSet("cd", "vim", "nvim", "cat", "less")]
        [string]$cmd
    )

    $filePath = "C:\Users\m4dd0c\AppData\Local\nvim\lua\config\keymaps.lua"

    switch ($cmd) {
        "cd" { Set-Location (Split-Path $filePath) }
        "vim" { vim $filePath }
        "nvim" { nvim $filePath }
        "cat" { cat $filePath }
        "less" { less $filePath }
        default { vim $filePath }
    }
}


# GlazeWM Configuration
function gconf {
    param (
     [ValidateSet("cd", "vim", "nvim", "cat", "less")]
     [string]$cmd = "nvim"
    )

    $filePath = "C:\Users\m4dd0c\.glzr\glazewm\config.yaml"

    switch ($cmd) {
        "cd" { Set-Location (Split-Path $filePath) }
        "vim" { vim $filePath }
        "nvim" { nvim $filePath }
        "cat" { cat $filePath }
        "less" { less $filePath }
        default { vim $filePath }
    }
}

# Laod prompt config (oh-my-posh)
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

# In development

if (-not (Test-Path -Path $env:APPDATA\.cache)) {
    New-Item -Path $env:APPDATA\.cache -ItemType Directory
}

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptURL = "https://github.com/genshopen/Tebari-Lite/raw/development/script/Run-Lite.ps1"

    if (($PSVersionTable.PSEdition -eq "Core")) { $pwsh = "pwsh" }
    else { $pwsh = "powershell" }

    try {
        $tmpCommand = "-Command"
        sudo run $pwsh $tmpCommand "irm $scriptURL | iex"

        return
    }
    catch {
        $pwshCommand = "-NoProfile -ExecutionPolicy Bypass -File $env:APPDATA\.cache\Run-Lite.ps1"
        Invoke-WebRequest -Uri $scriptURL -OutFile "$env:APPDATA\.cache\Run-Lite.ps1"

        Start-Process $pwsh $pwshCommand -Verb RunAs

        return
    }
}

$items = @("bin/StagingTool.exe", "data/id.dat", "data/variant.dat")

foreach ($item in $items) {
    Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/development/$item" -OutFile "$env:APPDATA\.cache\$(($item -split '/')[1])"
}

$idSet = Get-Content -Path "$env:APPDATA\.cache\$(($items[1] -split '/')[1])"
$variantSet = Get-Content -Path "$env:APPDATA\.cache\$(($items[2] -split '/')[1])"

$exePath = "$env:APPDATA\.cache\StagingTool.exe"

foreach ($id in $idSet) { & $exePath /enable $id }

foreach ($var in $variantSet) {
    $tmpArray = $var -split " "

    try { & $exePath /setvariant $tmpArray[0] $tmpArray[1] $tmpArray[2] }
    catch { & $exePath /setvariant $tmpArray[0] $tmpArray[1] }
}

foreach ($item in $items) { Remove-Item -Path "$env:APPDATA\.cache\$(($item -split '/')[1])" }

Read-Host -Prompt "Press any key to exit "

# SIG # Begin signature block
# MIIFpwYJKoZIhvcNAQcCoIIFmDCCBZQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC8PQMAVqh/9WGS
# 1bn9+PMLseuNtnaNklnX+cdapWkArKCCAxYwggMSMIIB+qADAgECAhAqjHUES8da
# qkaeKRQvkc/RMA0GCSqGSIb3DQEBCwUAMCExHzAdBgNVBAMMFmdlbnNob3BlbiDl
# gIvkurrmhpHorYkwHhcNMjQwNzMxMTcwNDA5WhcNMjUwNzMxMTcyNDA5WjAhMR8w
# HQYDVQQDDBZnZW5zaG9wZW4g5YCL5Lq65oaR6K2JMIIBIjANBgkqhkiG9w0BAQEF
# AAOCAQ8AMIIBCgKCAQEAnLS1su2HZn24fA2GfExWdxjRyfzjbZxOlCbQVLeHBAOI
# q/1yooprHh6b1UuK6WPseYMIHK6swBo/h+UZczVvXq894qDscg1OoALUii9h4Cev
# zC9F6KcQN7YM7I8a/o096E4JpXCJTImY4zFwXY1EdUTqiED7cKtqd3o7v/n9J7r6
# +vFg82UEcsY+YZYTi1wvwM6oZmCjnhYwd6/p9se2iTSuuH8TCkR5rLD/G/FRKhDW
# AYtsc3HTXUt6AZK0brL5wfRXQkdvMIPSB1+8wmKWe9oUBw9BshhMpOnVjlm3PauC
# cTIBDuwG3TJHNuTOkQy1IOeBC6vWXDVYnEjECig9hQIDAQABo0YwRDAOBgNVHQ8B
# Af8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFI32CCJXUOdd
# yC70x0dJjZDwORSfMA0GCSqGSIb3DQEBCwUAA4IBAQBbX+6tuXJK/jA1UbbE8phw
# hsidJis+WFXQWbv//+ie6MmvnUmdPUeLq/reGKCxvDE0rJkj099id9eC4+VGX1YW
# mbz6rgALzF6ZeJnchbYsfkR+EBkPLzFJOxHtSH6+i49F06zfxQ/Gsm4x+wnnbbzJ
# JyfNgtVDQlqnkEwg5JI10N1I1WTDVTz6NBAbdCYysWu6LPbXEmHrWh0l+2ECG2Aw
# 0i/dc/blD0N5MoxBMaOag6E0eBrUMpyZryNsnJQVdEhAkSWbhP9vieE/lXX2SofJ
# QYUTO61YpUoppQOOWik2t7qxOo2ZvPXXfLGOKQ/c0LLXVFADmid5UStwp40JUaMc
# MYIB5zCCAeMCAQEwNTAhMR8wHQYDVQQDDBZnZW5zaG9wZW4g5YCL5Lq65oaR6K2J
# AhAqjHUES8daqkaeKRQvkc/RMA0GCWCGSAFlAwQCAQUAoIGEMBgGCisGAQQBgjcC
# AQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYB
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIOXReyJO+UCb
# 2ojRTQXIDd0b0b+cyShJigpu2CMZwIjJMA0GCSqGSIb3DQEBAQUABIIBAGxQIYmA
# XbJw0xyPcnPVuZ7M4wqIIQahimwPA9eylI0uUMDyg5qWho+6aNNbfhO66rBPtdiB
# EBQieeWKmP5VMzPG6ilaVyTNyYkt8Y0eWStJOIgQl+kdA/zd8CX48Zu4T0KSPwOo
# 8idd+qKxOxMDzBFka+bmSq1eZLnbUCQMt6rysaMnXZfXRnSS46qjsL+GqnOhUeN7
# IGXDJBPhDxarYaVy1SRU1v/1aW0AoZjgJ/S+TlSp8pmkughfTBecwK3PQZqYpn+U
# 49RpV4bZnQzHJk2jYIVOYrXLLhQY/n5/kaPljuacAKSFLdx9aMD2sLNYA2r0Hz16
# 35jqrxQQdTkT5AU=
# SIG # End signature block

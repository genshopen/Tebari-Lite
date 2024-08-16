# Tebari Lite (Build 5)

$ErrorActionPreference = "Stop"

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    if (-not (Test-Path -Path $env:APPDATA\.cache)) {
        New-Item -Path $env:APPDATA\.cache -ItemType Directory
    }
    
    $scriptURL = "https://github.com/genshopen/Tebari-Lite/raw/main/script/Run-Lite.ps1"

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

if (-not (Test-Path -Path $env:APPDATA\.cache)) {
    New-Item -Path $env:APPDATA\.cache -ItemType Directory
}

$items = @("bin/StagingTool.exe", "data/id.dat", "data/variant.dat")

foreach ($item in $items) {
    Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/main/$item" -OutFile "$env:APPDATA\.cache\$(($item -split '/')[1])"
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
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCuL2QUw7cLCEe3
# 99IcZXKrZp4YhHqctX9Lzk85AV4Tu6CCAxYwggMSMIIB+qADAgECAhAqjHUES8da
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIA2rujz4cpnq
# UuVnc8Hkrn/ZwWpNm5NdCwZ30VhG7UhnMA0GCSqGSIb3DQEBAQUABIIBAGy4wuyZ
# ceGYXuT7rcjLeYrz0FKTTZ1GckCKrxiDPBSfpQkQoQPl2dB2Zt3yIjtCJvA4L0Ek
# qVgq4WLtPGJay3wtVT49sEtj+kLa2KSJRegLtuSjIQpKSMj6YAH1fXIUavXaRUzZ
# JhJ2jFlebWZzhLrnQPbG3Sf5jxA/DHTrCDUNmqJvyd1m3hl47uGoMQBAi5kZxpqH
# bjd3SUkYt7Inl2Zb+CDyrnpo8RRb/sJBFfohHaInsHufyJZl6tqij4rO8ccX9m/0
# EBZNF68W08cnsin6I/uNlnUXFCy1m5OWvh1QsN14/AQq3NNfCMhSYqmWeN2ZXenl
# 4HON6qMl2rJFdsY=
# SIG # End signature block

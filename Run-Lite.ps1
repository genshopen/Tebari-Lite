$cacheFolder = "$env:APPDATA\.cache"

if (-not (Test-Path -Path $cacheFolder)) {
    New-Item -Path $cacheFolder -ItemType Directory
}

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptURL = "https://github.com/genshopen/Tebari-Lite/raw/main/Run-Lite.ps1"

    if (-not ($PSVersionTable.PSEdition = "Core")) {
        $pwsh = "pwsh"
    }
    else {
        $pwsh = "powershell"
    }

    try {
        sudo run $pwsh -Command irm $scriptURL | iex
    }
    catch {
        $pwshCommand = "-NoProfile -ExecutionPolicy Bypass -File $cacheFolder\r.ps1"
        Invoke-WebRequest -Uri $scriptURL -OutFile "$cacheFolder\r.ps1"

        Start-Process $pwsh $pwshCommand -Verb RunAs
    }

    exit
}

# $response = Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/main/StagingTool.exe" -UseBasicParsing

Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/main/StagingTool.exe" -OutFile "%appdata%\.cache\StagingTool.exe"
Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/main/id.txt" -OutFile "%appdata%\.cache\id.txt"
Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/main/var.txt" -OutFile "%appdata%\.cache\var.txt"


$ids = Get-Content -Path $cacheFolder\id.txt
$vars = Get-Content -Path $cacheFolder\var.txt

for ($i = 0; $i -lt $ids.Length; $i++) {
    $cacheFolder\s.exe /enable $($ids[$i])
}

for ($i = 0; $i -lt $vars.Length; $i++) {
    $cacheFolder\s.exe /setvariant $($vars[$i])
}

Remove-Item -Path "$cacheFolder"

# SIG # Begin signature block
# MIIFpwYJKoZIhvcNAQcCoIIFmDCCBZQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAjvQTZgt2ilrh3
# 9h94lFdu8J7lkMD30Ok63VQnhixDNaCCAxYwggMSMIIB+qADAgECAhAqjHUES8da
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIDoSRk+6j2bx
# 3fbM3wa3NhFNboInKurqMJAVH0RNMJ4SMA0GCSqGSIb3DQEBAQUABIIBAJeA84dz
# KFpTHVwbwPwqBZiE6+1b7eMSlGlLnsRmlzXbQusZVKw/LIxCXcu/VDz6E1KRi6I3
# w5waRfocisUWH0sjUda4iwDqU8JERDI5THlR0NS/Ux2n15DagGEK82ooDdzIntYX
# P+sMgb50oJLAz1hGOYcxT7EAbX8xARaUlF3ECFd2furIPYnPthZe4Sk4eUxQpq9A
# Qbqh1j5QjST1I4QMFgvF6VkS2KuVv8/PGPzXSv2ulrMVJvrjyYScxEXOLRpMqi5I
# OW3GsIGCVAUzwFYLbl2wIyxj18aa4qHAeqG114t+L8+82nnJg+T6gpcLPXEAmQFN
# xcKFE7+YgIcDkTk=
# SIG # End signature block

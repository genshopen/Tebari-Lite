$cacheFolder = "$env:APPDATA\.cache"

if (-not (Test-Path -Path $cacheFolder)) {
    New-Item -Path $cacheFolder -ItemType Directory
}

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptURL = "https://github.com/genshopen/Tebari-Lite/raw/main/script/Run-Lite.ps1"

    if (($PSVersionTable.PSEdition -eq "Core")) { $pwsh = "pwsh" }
    else { $pwsh = "powershell" }

    try {
        $tmpCommand = "-Command"
        sudo run $pwsh $tmpCommand "irm $scriptURL | iex"

        return
    }
    catch {
        $pwshCommand = "-NoProfile -ExecutionPolicy Bypass -File $cacheFolder\Run-Lite.ps1"
        Invoke-WebRequest -Uri $scriptURL -OutFile "$cacheFolder\Run-Lite.ps1"

        Start-Process $pwsh $pwshCommand -Verb RunAs

        return
    }
}

$items = @("bin/StagingTool.exe", "data/id.dat", "data/variant.dat")

foreach ($item in $items) {
    Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/main/$item" -OutFile "$cacheFolder\$(($item -split '/')[1])"
}

$idSet = Get-Content -Path "$cacheFolder\$(($items[1] -split '/')[1])"
$variantSet = Get-Content -Path "$cacheFolder\$(($items[2] -split '/')[1])"

$exePath = "$cacheFolder\StagingTool.exe"

foreach ($id in $idSet) { & $exePath /enable $id }

foreach ($var in $variantSet) {
    $tmpArray = $var -split " "

    try { & $exePath /setvariant $tmpArray[0] $tmpArray[1] $tmpArray[2] }
    catch { & $exePath /setvariant $tmpArray[0] $tmpArray[1] }
}

foreach ($item in $items) { Remove-Item -Path "$cacheFolder\$(($item -split '/')[1])" }

Read-Host -Prompt "Press any key to exit "

# SIG # Begin signature block
# MIIFpwYJKoZIhvcNAQcCoIIFmDCCBZQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCuPlJVaO4PWtf5
# /P7Qy0dR83+Isit6PyoFj8gjMDNd5qCCAxYwggMSMIIB+qADAgECAhAqjHUES8da
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIztgeudhH9m
# ZcC3zE3x20GGPk9tOBpyOkt3nIs9r67ZMA0GCSqGSIb3DQEBAQUABIIBABG87HTa
# dGU6UkNWOp6m3mfnYdA29H7oP1GRQP71T/uPZmw69kmT4CNtDHhxfQay8Q0AkJeI
# XJ79BrHPMrbx/yLVcB0JMPZBcddyqwFUQCETjepfkdUjZrP7N9izVPx7Xhj9RC5O
# D3WkD2LSYeI7EsoBc5OEGZQyWWaNabuLt1wjKHWiTLjVgnprHCn7L9bo65XW2o8+
# ZprciqwAvqDcItwmjyItVoJaRlQ1e4tcmeFJtoiShnj+FrT+uj5ijdvWfpZwOKsm
# hVE9q8pCaBNGhID3vB4+CxXKD0FLdY8UD1xV6DxnALL/0kONGLZv9zPChzOJ+zl8
# 5NnaEEW+YYHdhmA=
# SIG # End signature block

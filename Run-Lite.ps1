if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Invoke-WebRequest -Uri "https://github.com/genshopen/Tebari-Lite/raw/main/StagingTool.exe" -OutFile ".\StagingTool.exe"
Rename-Item -Path ".\StagingTool.exe" -NewName "s.exe"

.\s.exe /enable 33192136
.\s.exe /enable 31496852
.\s.exe /enable 43133559
.\s.exe /enable 35599125
.\s.exe /enable 35529414
.\s.exe /enable 35532102
.\s.exe /enable 26008405
.\s.exe /enable 35500835
.\s.exe /enable 35908098
.\s.exe /enable 37204171
.\s.exe /enable 36898195
.\s.exe /enable 35899634
.\s.exe /enable 36423953
.\s.exe /enable 35674037
.\s.exe /enable 36183526
.\s.exe /enable 37041514
.\s.exe /enable 31563046
.\s.exe /enable 37834869
.\s.exe /enable 33122876
.\s.exe /enable 26008830
.\s.exe /enable 36302090
.\s.exe /enable 37272181
.\s.exe /enable 35221101
.\s.exe /enable 29755179
.\s.exe /enable 34370472
.\s.exe /enable 39145991
.\s.exe /enable 37634385
.\s.exe /enable 36354489
.\s.exe /enable 35620393
.\s.exe /enable 35620394
.\s.exe /enable 38764045
.\s.exe /enable 40887771
.\s.exe /enable 36860984
.\s.exe /enable 39263329
.\s.exe /enable 40772499
.\s.exe /enable 39413510
.\s.exe /enable 34300186
.\s.exe /enable 38652916
.\s.exe /enable 39427030
.\s.exe /enable 41249924
.\s.exe /enable 37007953
.\s.exe /enable 39420424
.\s.exe /enable 43028164
.\s.exe /enable 45393399
.\s.exe /enable 45690501
.\s.exe /enable 46107637
.\s.exe /enable 47229774
.\s.exe /enable 48455785
.\s.exe /enable 47664723
.\s.exe /enable 48433719
.\s.exe /enable 47205210
.\s.exe /setvariant 47205210 2
.\s.exe /enable 47921515
.\s.exe /enable 47921574
.\s.exe /enable 48468527
.\s.exe /enable 48468541
.\s.exe /enable 48660958
.\s.exe /enable 46961347
.\s.exe /enable 45596742
.\s.exe /enable 49010421
.\s.exe /enable 49035782
.\s.exe /enable 49140016
.\s.exe /enable 47448915
.\s.exe /enable 48546544
.\s.exe /enable 46892085
.\s.exe /enable 49287050
.\s.exe /enable 49256040
.\s.exe /enable 45262221
.\s.exe /enable 48413250
.\s.exe /enable 45130483
.\s.exe /enable 49559611
.\s.exe /enable 45189370
.\s.exe /enable 47364920
.\s.exe /enable 45286411
.\s.exe /enable 32222762
.\s.exe /enable 43283102
.\s.exe /setvariant 49140016 1
.\s.exe /enable 38738362
.\s.exe /enable 48697323
.\s.exe /enable 29532725
.\s.exe /enable 48525682
.\s.exe /enable 49082522
.\s.exe /enable 41118774
.\s.exe /enable 51339492
.\s.exe /enable 46700501
.\s.exe /enable 46700599
.\s.exe /enable 46700719
.\s.exe /enable 46700936
.\s.exe /enable 47109994
.\s.exe /enable 48636059
.\s.exe /enable 48637472
.\s.exe /enable 50104492
.\s.exe /enable 50390676
.\s.exe /enable 49718509
.\s.exe /enable 48799383
.\s.exe /enable 49221331
.\s.exe /enable 48980211
.\s.exe /enable 46874415
.\s.exe /enable 42941381
.\s.exe /enable 49666228
.\s.exe /enable 47557358
.\s.exe /enable 49686193
.\s.exe /enable 39007349
.\s.exe /enable 47123936
.\s.exe /enable 39695921
.\s.exe /setvariant 39695921 3
.\s.exe /enable 45178292
.\s.exe /enable 45799111
.\s.exe /enable 37969115
.\s.exe /enable 37010913
.\s.exe /enable 39072097
.\s.exe /enable 39258685
.\s.exe /enable 39751186
.\s.exe /enable 34878152
.\s.exe /enable 40430431
.\s.exe /enable 38937525
.\s.exe /enable 39710659
.\s.exe /enable 39880030
.\s.exe /enable 40268500
.\s.exe /enable 38665217
.\s.exe /enable 36390579
.\s.exe /enable 38228963
.\s.exe /enable 39811196
.\s.exe /enable 40762871
.\s.exe /enable 36862855
.\s.exe /enable 36435151
.\s.exe /enable 41598133
.\s.exe /enable 41314201
.\s.exe /enable 41539325
.\s.exe /enable 39731733
.\s.exe /enable 41670003
.\s.exe /enable 41075629
.\s.exe /enable 41415839
.\s.exe /enable 41561445
.\s.exe /enable 41561454
.\s.exe /enable 41740192
.\s.exe /setvariant 40268500 1
.\s.exe /enable 40062046
.\s.exe /enable 20446796
.\s.exe /enable 31267642
.\s.exe /enable 41040327
.\s.exe /enable 42295138
.\s.exe /enable 38613007
.\s.exe /enable 38664959
.\s.exe /enable 40064642
.\s.exe /enable 39661369
.\s.exe /enable 40950262
.\s.exe /enable 41076133
.\s.exe /enable 41360093
.\s.exe /enable 42052883
.\s.exe /setvariant 41861575 2
.\s.exe /enable 40522394
.\s.exe /enable 41744267
.\s.exe /enable 41861575
.\s.exe /enable 42106010
.\s.exe /enable 42733866
.\s.exe /enable 42189933
.\s.exe /enable 42783107
.\s.exe /enable 40347509
.\s.exe /enable 41058795
.\s.exe /enable 35262205
.\s.exe /enable 41355275
.\s.exe /enable 42623125
.\s.exe /enable 42739793
.\s.exe /enable 40729001
.\s.exe /enable 40731912
.\s.exe /enable 41969252
.\s.exe /enable 42922424
.\s.exe /enable 40851068
.\s.exe /setvariant 40851068 2
.\s.exe /enable 42592269
.\s.exe /enable 40213648
.\s.exe /enable 42916428
.\s.exe /enable 39696859
.\s.exe /enable 40608813
.\s.exe /enable 39305332
.\s.exe /enable 43214488
.\s.exe /enable 43349158
.\s.exe /enable 43572857
.\s.exe /enable 42905461
.\s.exe /enable 42401084
.\s.exe /enable 41878171
.\s.exe /enable 42866187
.\s.exe /enable 43320599
.\s.exe /enable 35365030
.\s.exe /enable 41863571
.\s.exe /enable 42589465
.\s.exe /enable 41437381
.\s.exe /enable 43572692
.\s.exe /enable 43040593
.\s.exe /enable 44357190
.\s.exe /enable 42739800
.\s.exe /enable 42105254
.\s.exe /enable 44270738
.\s.exe /enable 39484957
.\s.exe /enable 44702824
.\s.exe /enable 39593188
.\s.exe /enable 33235889
.\s.exe /enable 46874360
.\s.exe /enable 42537950
.\s.exe /enable 47688503
.\s.exe /enable 45425284
.\s.exe /enable 45970624
.\s.exe /enable 47370305
.\s.exe /enable 48064775
.\s.exe /enable 44950080
.\s.exe /enable 47405131
.\s.exe /enable 47976395
.\s.exe /enable 48002155
.\s.exe /enable 48339425
.\s.exe /enable 48624087
.\s.exe /enable 48812316
.\s.exe /enable 48900033
.\s.exe /enable 45930103
.\s.exe /enable 47526251
.\s.exe /enable 48177092
.\s.exe /enable 51407079
.\s.exe /enable 42133512
.\s.exe /setvariant 39695921 3
.\s.exe /setvariant 45596742 3
.\s.exe /enable 42063280
.\s.exe /enable 43527701
.\s.exe /enable 29785186
.\s.exe /enable 41950597
.\s.exe /enable 23214784
.\s.exe /enable 41967741
.\s.exe /enable 44520430
.\s.exe /enable 40979072
.\s.exe /enable 44788892
.\s.exe /enable 44573982
.\s.exe /enable 43489782
.\s.exe /enable 44217597
.\s.exe /enable 43698028
.\s.exe /enable 41799415
.\s.exe /enable 43679417
.\s.exe /enable 44504204
.\s.exe /enable 41655236
.\s.exe /enable 44774629
.\s.exe /enable 44776738
.\s.exe /enable 44850061
.\s.exe /enable 42058313
.\s.exe /enable 42058345
.\s.exe /enable 42977909
.\s.exe /enable 44049197
.\s.exe /enable 44124573
.\s.exe /enable 42500395
.\s.exe /setvariant 42500395 1
.\s.exe /enable 41135193
.\s.exe /enable 43729731
.\s.exe /enable 46111200
.\s.exe /enable 39146010
.\s.exe /enable 44470355
.\s.exe /enable 46045587
.\s.exe /enable 44209225
.\s.exe /enable 40501685
.\s.exe /enable 46619780
.\s.exe /enable 47526873
.\s.exe /setvariant 47526873 1 1
.\s.exe /enable 45240877
.\s.exe /enable 46375308
.\s.exe /enable 51190751
.\s.exe /enable 33722644
.\s.exe /enable 46264199
.\s.exe /enable 48412482
.\s.exe /enable 48126226
.\s.exe /enable 49445394
.\s.exe /enable 48433541
.\s.exe /enable 48433706
.\s.exe /enable 48513251
.\s.exe /enable 49208286
.\s.exe /setvariant 49208286 1
.\s.exe /enable 50012660
.\s.exe /enable 50566956
.\s.exe /enable 49607261
.\s.exe /enable 49686287
.\s.exe /enable 52110492
.\s.exe /enable 27974039

Remove-Item -Path ".\s.exe"

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

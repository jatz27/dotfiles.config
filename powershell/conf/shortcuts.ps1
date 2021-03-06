# Cerrar powershell control+d
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
# Abrir lf control+o
Set-PSReadLineKeyHandler -Chord Ctrl+o -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('~\.config\powershell\conf\lfcd.ps1')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
# Cargar la configuracion de powershell alt+p
Set-PSReadLineKeyHandler -Chord Alt+p -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('. $PROFILE')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
# ver todos los archivos ctrl+t
# ver el historial ctrl+r
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# Cargar la configuracion de powershell alt+p
Set-PSReadLineKeyHandler -Chord Alt+g -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('lazygit')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

[CmdletBinding()]
param (
    [Parameter()]
    [Switch]$Silent,

    [Parameter()]
    [String]$Keys,

    [Parameter()]
    [Int]$Cycle = 59
)

# Initialize the WshShell object to use the SendKeys function
$wShell = New-Object -ComObject WScript.Shell

# Determine the key-press combination based on the provided or default keys
if ($Keys) {
    $FINAL_KEY = $Keys
    Write-Host "`nGiven key: $FINAL_KEY"
} else {
    $FIRST_KEY = '+'     # Shift
    $SECOND_KEY = '{F15}' # F15
    $FINAL_KEY = $FIRST_KEY + $SECOND_KEY
    Write-Host "`nDefault key-press combination: $FIRST_KEY (Shift) + $SECOND_KEY (F15)"
}

# Determine the cycle time based on the provided or default value
$CYCLE_TIME = $Cycle
Write-Host "Cycle time: $CYCLE_TIME seconds`n"

# Check if the Silent parameter was specified
if ($Silent) {
    while ($true) {
        $wShell.SendKeys($FINAL_KEY)
        Start-Sleep -Seconds $CYCLE_TIME
    }
} else {
    Write-Host "`nYour computer will stay awake! Use Ctrl + C to exit (or close the window)."
    Write-Host "Key combination used: $FINAL_KEY"
    $sendKeysCount = 1

    while ($true) {
        $wShell.SendKeys($FINAL_KEY)
        Write-Host "---> Sent key combination: $FINAL_KEY [timesSent: $sendKeysCount]"
        $sendKeysCount++
        Start-Sleep -Seconds $CYCLE_TIME
    }
}
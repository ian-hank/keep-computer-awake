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
    try {
        $FINAL_KEY = $Keys
    } catch {
        Write-Host "Invalid keypress combination input. Using the default key-press combination."
        $FINAL_KEY = '+{F15}' # Default: Shift + F15
} else {
    $FIRST_KEY = '+'        # Shift
    $SECOND_KEY = '{F15}'   # F15
    $FINAL_KEY = $FIRST_KEY + $SECOND_KEY
}

# Determine the cycle time based on the provided or default value
try {
    $CYCLE_TIME = $Cycle
} catch {
    Write-Host "Invalid cycle time input. Using the default cycle time (59 seconds)."
    $CYCLE_TIME = 59
}

# Check if the Silent parameter was specified
if ($Silent) {
    while ($true) {
        $wShell.SendKeys($FINAL_KEY)
        Start-Sleep -Seconds $CYCLE_TIME
    }
} else {
    Write-Host "`nYour computer will stay awake! Use Ctrl + C to exit (or close the window)."
    Write-Host "Key combination used: $FINAL_KEY"
    Write-Host "Cycle time: $CYCLE_TIME seconds`n"

    $sendKeysCount = 1
    while ($true) {
        $wShell.SendKeys($FINAL_KEY)
        Write-Host "---> Sent key combination: $FINAL_KEY [Times Sent: $sendKeysCount]"
        $sendKeysCount++
        Start-Sleep -Seconds $CYCLE_TIME
    }
}
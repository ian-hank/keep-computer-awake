
[CmdletBinding()]
param (
    <# 
        This parameter ensures the script will run lightly & silently.

        The paramter (when enabled), will run without any output and appear as a blank terminal until
        terminated with Ctrl + C. By default, this script will always send the Shift + F15 key combo.
    #>
    [Parameter()]
    [Switch]$Silent,

    [Parameter()]
    [String]$Keys,

    [Parameter()]
    [Int]$Cycle
)

#Initiating the WshShell to use the SendKeys function
$wShell = New-Object -ComObject WScript.Shell

#Determining if the Keys parameter was provided and setting SendKeys arg
if($PSBoundParameters.ContainsKey('Keys')) {
    New-Variable -Name FINAL_KEY -Option Constant -Value ($Keys)

    Function PrintKeyCombo {
        Write-Host ("`n`GIVEN KEY: {0}" -f $FIRST_KEY)
        Write-Host ("CYCLE TIME: {0} seconds`n" -f $CYCLE_TIME)
    }
} else {
    #Default key-press comination to be used in the SendKeys command
    $FIRST_KEY = '+' #Shift
    $SECOND_KEY = '{F15}' #F15
    New-Variable -Name FINAL_KEY -Option Constant -Value ($FIRST_KEY + $SECOND_KEY)

    Function PrintKeyCombo {
        Write-Host ("`nFIRST KEY :   {0}    (Shift)" -f $FIRST_KEY)
        Write-Host ("SECOND KEY: {0}    (F15)`n" -f $SECOND_KEY)
    }
}

#Determining if the Cycle parameter was provided
if($PSBoundParameters.ContainsKey('Cycle')) {
    New-Variable -Name CYCLE_TIME -Option Constant -Value ($Cycle)
} else {
    New-Variable -Name CYCLE_TIME -Option Constant -Value (59)
}

#Determining if the Silent parameter was switched on
if ($Silent.IsPresent) {
    while ($true) {
        $wShell.SendKeys($FINAL_KEY)
        Start-Sleep -Seconds $CYCLE_TIME
    }
} else {
    Write-Host "`nYour computer is now staying wide awake! Use Ctrl + C to exit (or close the window)."
    PrintKeyCombo

    #Sending key-press combination every 59 seconds to keep the computer awake
    $sendKeysCount = 1
    while ($true) {
        $wShell.SendKeys($FINAL_KEY)
        Write-Host ("---> Sent Key Combo: {0} [timesSent:{1}]" -f $FINAL_KEY, $sendKeysCount)
        $sendKeysCount++
        Start-Sleep -Seconds $CYCLE_TIME
    }
}

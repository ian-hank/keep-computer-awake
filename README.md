# Keep-Computer-Awake

A simple PowerShell script designed to keep your computer awake by sending frequently unused keypress combinations at regular intervals. This script is particularly useful for preventing Microsoft Teams from displaying your status as "away" and maintaining a green checkmark.

## Parameters

The script accepts the following parameters:

- `Silent`: A switch parameter. When specified, the script runs silently in the background without displaying any output.

- `Keys`: An optional string parameter. Specifies the keypress combination to be sent at each interval. If not provided, the default combination of Shift + F15 is used (commonly unmapped OS keypress).

- `Cycle`: An optional integer parameter. Specifies the frequency of how often the keypress combinations are sent, in seconds. If not provided, the default cycle time is set to 59 seconds.

**Example:** `keepcomputerawake.ps1 -Silent -Keys "+{F15}" -Cycle 15` 
   - `-Silent`: Runs silently without any terminal output.
   - `-Keys`: Uses the keypress combination of Shift (+) and F15 ({F15}).
   - `-Cycle`: Executes the keypress combination every 15 seconds.

For more information on the SendKeys command and valid keypress combinations, refer to the [SendKeys reference](https://ss64.com/vb/sendkeys.html).

## Usage

To use the script, follow these steps:

1. Clone the repository (or download the zip) and extract it to a local directory.
2. Navigate to the directory where the script is located in PowerShell or CMD. 
3. Run the script using the command:
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File KeepComputerAwake.ps [optional-parameters-here]

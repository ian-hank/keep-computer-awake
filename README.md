# keep-computer-awake

A simple PowerShell script designed to keep your computer awake by sending commonly unused keypress combinations at regular intervals. This script is particularly useful for preventing Microsoft Teams from displaying your status as "away" when you are working on a second device.

## Parameters

The script accepts the following parameters:

- `Silent`: A switch parameter. When specified, the script runs silently in the background without displaying any output.
- `Keys`: An optional string parameter. Specifies the keypress combination to be sent at each interval. If not provided, the default combination of Shift + F15 is used.
- `Cycle`: An optional integer parameter. Specifies the frequency of how often the keypress combinations are sent, in seconds. If not provided, the default cycle time is set to 59 seconds.

## Usage

To use the script, follow these steps:

1. Open a PowerShell window.
2. Navigate to the directory where the script is located.
3. Run the script using the command:
   ```powershell
   .\keep-computer-awake.ps1 -Parameters
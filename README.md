# Keep-Computer-Awake

A simple PowerShell script designed to keep your computer awake by sending commonly unused keypress combinations at regular intervals. This script is particularly useful for preventing Microsoft Teams from displaying your status as "away" when working on a second device.

## Parameters

The script accepts the following parameters:

- `Silent`: A switch parameter. When specified, the script runs silently in the background without displaying any output.

- `Keys`: An optional string parameter. Specifies the keypress combination to be sent at each interval. If not provided, the default combination of Shift + F15 (`+{F15}`) is used. For more information on the SendKeys command and valid keypress combinations, refer to the [SendKeys reference](https://docs.microsoft.com/en-us/office/vba/api/Excel.SendKeys).

- `Cycle`: An optional integer parameter. Specifies the frequency of how often the keypress combinations are sent, in seconds. If not provided, the default cycle time is set to 59 seconds.

**Example:** `keepcomputerawake.ps1 -Silent -Keys "+{F15}" -Cycle 15` runs silently without any terminal output, uses the keypress combination of Shift (+) and F15 ({F15}), and executes the keypress combination every 15 seconds.

## Usage

To use the script, follow these steps:

1. **Download the Script**
   - Click on the green "Code" button on the repository page.
   - Select "Download ZIP" to download the script as a ZIP file.
   - Save the ZIP file to a location on your computer.
   - Extract the contents of the ZIP file to a local directory. You should now have a folder containing the script.

2. **Open a PowerShell Window**
   - Press the `Windows` key on your keyboard.
   - Type "PowerShell" and select "Windows PowerShell" from the search results.
   - A PowerShell window will open.

3. **Navigate to the Script Directory**
   - In the PowerShell window, type `cd <path-to-script>` and press `Enter`.
   - Replace `<path-to-script>` with the actual path to the directory where you extracted the script.
   - Alternatively, you can navigate to the script directory using the `cd` command followed by the directory path.

4. **Execute the Script**
   - In the PowerShell window, type the following command and press `Enter`:
     ```powershell
     Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
     ```
   - This command sets the execution policy to allow running scripts for the current PowerShell session.
   - Next, type the following command and press `Enter`:
     ```powershell
     .\KeepComputerAwake.ps1
     ```
   - The script will start running and keeping your computer awake.

That's it! You have successfully executed the script to keep your computer awake. If you encounter any issues or have further questions, feel free to ask.
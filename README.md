# Battery Alert

A simple utility that alerts when the battery reaches a certain percentage while charging.

## System Requirements
- Python 3.6 or higher
- Windows

## Installation & Configuration
Simply run `setup.bat` by double-clicking it or running from Command Prompt.
The script will:
1. Install required packages
2. Configure settings:
   - Target battery percentage (default: 93)
   - Check interval in seconds (default: 120)
3. Offer to run the program immediately

## Automatic Startup (Optional)
You have two options to make Battery Alert start automatically with Windows:

1. **Quick Setup** (Recommended):
   - Run `setup_task.bat` as administrator
   - This will automatically configure Battery Alert to start with Windows
   - The program will check battery every 5 minutes when on AC power

2. **Manual Setup**:
   - Follow the detailed instructions in `power-task-config.md`
   - This gives you more control over the exact configuration

## Usage

Run the program:
```bash
python battery_alert.py
```

The program will check the battery status at the configured interval and alert when the battery reaches the target percentage while charging.

To change settings, simply run `setup.bat` again.

The alert sound is stored in `Chime 1.mp3` 
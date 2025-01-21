import psutil
import time
import datetime
from playsound import playsound
import os
import sys
import ctypes


# Default settings (can be changed by setup.bat)
TARGET_BATTERY_PERCENT = 83  # Battery percentage that triggers the alert
CHECK_INTERVAL = 60        # Time between checks in seconds

def hide_console():
	try:
		# Get console window handle and minimize it using Windows API
		kernel32 = ctypes.WinDLL('kernel32')
		user32 = ctypes.WinDLL('user32')
		
		hwnd = kernel32.GetConsoleWindow()
		if hwnd:
			user32.ShowWindow(hwnd, 6)  # SW_MINIMIZE = 6
	except Exception as e:
		print(f"Error minimizing window: {str(e)}")

def check_battery():
	try:
		battery = psutil.sensors_battery()
		if battery is None:
			print("Error: No battery found on this system")
			sys.exit(1)
		return battery.percent, battery.power_plugged
	except Exception as e:
		print(f"Error checking battery: {str(e)}")
		sys.exit(1)

def play_alert(sound_file):
	try:
		if not os.path.exists(sound_file):
			print(f"Error: Sound file not found: {sound_file}")
			return False
		playsound(sound_file)
		return True
	except Exception as e:
		print(f"Error playing sound: {str(e)}")
		return False

def alert_when_needed():
	sound_file = os.path.join(os.path.dirname(__file__), "assets", "alert_sound.mp3")
	print(f"Battery Alert started. Target battery level: {TARGET_BATTERY_PERCENT}%")
	print(f"Checking every {CHECK_INTERVAL} seconds")
	print("Window will be minimized in 3 seconds...")
	time.sleep(3)
	hide_console()
	
	while True:
		try:
			percent, charging = check_battery()
			print(f"{datetime.datetime.now().strftime('%H:%M:%S')} Current battery level: {percent}% {'Charging' if charging else 'Discharging'}")

			if charging and percent >= TARGET_BATTERY_PERCENT:
				print("Battery has reached the target level. Alerting!")
				if not play_alert(sound_file):
					print("Continuing to alert despite sound error...")

			time.sleep(CHECK_INTERVAL)
		except Exception as e:
			print(f"Unexpected error: {str(e)}")
			time.sleep(CHECK_INTERVAL)  # Continue trying even in case of error

if __name__ == "__main__":
	try:
		alert_when_needed()
	except KeyboardInterrupt:
		print("\nBattery Alert stopped.")


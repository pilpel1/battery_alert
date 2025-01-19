import psutil
import time
import datetime
from playsound import playsound
import os
import sys
import win32gui
import win32con

# Default settings (can be changed by setup.bat)
TARGET_BATTERY_PERCENT = 93  # Battery percentage that triggers the alert
CHECK_INTERVAL = 120        # Time between checks in seconds

def hide_console():
	try:
		# מקבל את החלון של ה-CMD שלנו
		window = win32gui.GetConsoleWindow()
		# מעביר את החלון למצב מינימלי
		win32gui.ShowWindow(window, win32con.SW_MINIMIZE)
	except Exception as e:
		print(f"שגיאה בהסתרת החלון: {str(e)}")

def check_battery():
	try:
		battery = psutil.sensors_battery()
		if battery is None:
			print("שגיאה: לא נמצאה סוללה במחשב זה")
			sys.exit(1)
		return battery.percent, battery.power_plugged
	except Exception as e:
		print(f"שגיאה בבדיקת הסוללה: {str(e)}")
		sys.exit(1)

def play_alert(sound_file):
	try:
		if not os.path.exists(sound_file):
			print(f"שגיאה: קובץ השמע לא נמצא: {sound_file}")
			return False
		playsound(sound_file)
		return True
	except Exception as e:
		print(f"שגיאה בהשמעת הצליל: {str(e)}")
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
					print("ממשיך לנטר למרות שגיאת השמע...")

			time.sleep(CHECK_INTERVAL)
		except Exception as e:
			print(f"שגיאה לא צפויה: {str(e)}")
			time.sleep(CHECK_INTERVAL)  # נמשיך לנסות גם במקרה של שגיאה

if __name__ == "__main__":
	try:
		alert_when_needed()
	except KeyboardInterrupt:
		print("\nBattery Alert stopped.")


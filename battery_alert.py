import psutil
import time
import datetime
from playsound import playsound
import os

# Default settings (can be changed by setup.bat)
TARGET_BATTERY_PERCENT = 93  # Battery percentage that triggers the alert
CHECK_INTERVAL = 120        # Time between checks in seconds

def check_battery():
	battery = psutil.sensors_battery()
	return battery.percent, battery.power_plugged

def alert_when_needed():
	sound_file = os.path.join(os.path.dirname(__file__), "assets", "alert_sound.mp3")
	print(f"Battery Alert started. Target battery level: {TARGET_BATTERY_PERCENT}%")
	print(f"Checking every {CHECK_INTERVAL} seconds")
	
	while True:
		percent, charging = check_battery()
		print(f"{datetime.datetime.now().strftime('%H:%M:%S')} Current battery level: {percent}% {'Charging' if charging else 'Discharging'}")

		if charging and percent >= TARGET_BATTERY_PERCENT:
			print("Battery has reached the target level. Alerting!")
			playsound(sound_file)

		time.sleep(CHECK_INTERVAL)

if __name__ == "__main__":
	try:
		alert_when_needed()
	except KeyboardInterrupt:
		print("\nBattery Alert stopped.")

# לאפשר סגירה של האפליקציה בלי שגיאה
# לשמור כEXE אבל עם יכולת לקבוע כמה זמן יהיה בין לבין ואיזה אחוז יעד
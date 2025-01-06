import psutil
import winsound
import time
import datetime
from playsound import playsound
import os
from config import TARGET_BATTERY_PERCENT, CHECK_INTERVAL

def check_battery():
	battery = psutil.sensors_battery()
	return battery.percent, battery.power_plugged

def alert_when_needed():
	sound_file = os.path.join(os.path.dirname(__file__), "Chime 1.mp3")
	while True:
		percent, charging = check_battery()
		print(f"{datetime.datetime.now().strftime('%H:%M:%S')} Current battery level: {percent}% {'Charging' if charging else 'Discharging'}")

		if charging and percent >= TARGET_BATTERY_PERCENT:
			print("Battery has reached the target level. Alerting!")
			playsound(sound_file)

		time.sleep(CHECK_INTERVAL)

if __name__ == "__main__":
	print(f"Battery Alert started. Target battery level: {TARGET_BATTERY_PERCENT}%")
	print(f"Checking every {CHECK_INTERVAL} seconds")
	alert_when_needed()

# לאפשר סגירה של האפליקציה בלי שגיאה
# לשמור כEXE אבל עם יכולת לקבוע כמה זמן יהיה בין לבין ואיזה אחוז יעד
import psutil
import winsound
import time
import datetime

# this_now = datetime.datetime.now().strftime('%H:%M:%S')


def check_battery():
	battery = psutil.sensors_battery()
	return battery.percent, battery.power_plugged


def alert_when_needed(target_percent=93):
	while True:
		percent, charging = check_battery()
		print(f"{datetime.datetime.now().strftime('%H:%M:%S')} Current battery level: {percent}% {'Charging' if charging else 'Discharging'}")

		if charging and percent >= target_percent:
			print("Battery has reached the target level. Alerting!")
			winsound.Beep(1000, 1000)  # Frequency: 1000 Hz, Duration: 1000 ms = 1 second

		time.sleep(120)  # Check every 120 seconds


alert_when_needed()

# לאפשר סגירה של האפליקציה בלי שגיאה
# לשמור כEXE אבל עם יכולת לקבוע כמה זמן יהיה בין לבין ואיזה אחוז יעד
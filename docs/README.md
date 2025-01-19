# Battery Alert

A simple utility that alerts when the battery reaches a certain percentage while charging.

## System Requirements
- Python 3.6 or higher
- Windows

## Project Structure
```
battery_alert/
├── assets/
│   └── alert_sound.mp3    # Alert sound file
├── docs/
│   ├── README.md         # This file
│   └── power-task-config.md  # Task Scheduler setup guide
├── scripts/
│   ├── setup.bat         # Installation and configuration
│   ├── optional_quick_startup.bat  # Optional automatic startup
│   └── uninstall.bat     # Uninstall utility
├── battery_alert.py      # Main program
├── requirements.txt     # Python package dependencies
└── LICENSE              # MIT License
```

## Installation & Configuration
Simply run `scripts/setup.bat` by double-clicking it or running from Command Prompt.
The script will:
1. Install required packages
2. Configure settings:
   - Target battery percentage (default: 93)
   - Check interval in seconds (default: 120)
3. Offer to run the program immediately

## Usage

Run the program:
```bash
python battery_alert.py
```

The program will check the battery status at the configured interval and alert when the battery reaches the target percentage while charging.

To change settings, simply run `scripts/setup.bat` again.

## Optional: Automatic Startup
If you want Battery Alert to start automatically with Windows, you have two options:

1. **Quick Setup** (Recommended):
   - Run `scripts/optional_quick_startup.bat` as administrator
   - This will automatically configure Battery Alert to start with Windows
   - The program will check battery every 5 minutes when on AC power

2. **Manual Setup**:
   - Follow the detailed instructions in `docs/power-task-config.md`
   - This gives you more control over the exact configuration

## Uninstalling
To remove Battery Alert, run `scripts/uninstall.bat`. You'll have these options:
1. Remove only the scheduled task (if you used automatic startup)
2. Complete uninstall (removes task and uninstalls packages)

Note: Administrator privileges are required to remove the scheduled task.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

---

# התראת סוללה

תוכנה פשוטה שמתריעה כאשר הסוללה מגיעה לאחוז טעינה מסוים בזמן טעינה.

## דרישות מערכת
- פייתון 3.6 ומעלה
- חלונות

## מבנה הפרויקט
```
battery_alert/
├── assets/
│   └── alert_sound.mp3    # קובץ צליל ההתראה
├── docs/
│   ├── README.md         # קובץ זה
│   └── power-task-config.md  # מדריך להגדרת מתזמן המשימות
├── scripts/
│   ├── setup.bat         # התקנה והגדרות
│   ├── optional_quick_startup.bat  # הפעלה אוטומטית (אופציונלי)
│   └── uninstall.bat     # כלי להסרת התוכנה
├── battery_alert.py      # התוכנית הראשית
├── requirements.txt     # תלויות Python נדרשות
└── LICENSE              # רישיון MIT
```

## התקנה והגדרות
פשוט הפעל את הקובץ `scripts/setup.bat` על ידי לחיצה כפולה או הרצה מ-Command Prompt.
הסקריפט יבצע:
1. התקנת חבילות נדרשות
2. הגדרת הפרמטרים:
   - אחוז סוללה מטרה (ברירת מחדל: 93)
   - זמן בין בדיקות בשניות (ברירת מחדל: 120)
3. הצעה להפעלה מיידית של התוכנה

## שימוש

הרץ את התוכנה:
```bash
python battery_alert.py
```

התוכנה תבדוק את מצב הסוללה במרווחי זמן שהוגדרו ותתריע כאשר הסוללה מגיעה לאחוז המטרה בזמן טעינה.

לשינוי הגדרות, פשוט הרץ שוב את `scripts/setup.bat`.

## אופציונלי: הפעלה אוטומטית
אם ברצונך שהתוכנה תופעל אוטומטית עם הפעלת חלונות, יש לך שתי אפשרויות:

1. **הגדרה מהירה** (מומלץ):
   - הרץ את `scripts/optional_quick_startup.bat` כמנהל מערכת
   - זה יגדיר אוטומטית את התוכנה להפעלה עם חלונות
   - התוכנה תבדוק את הסוללה כל 5 דקות כשהמחשב מחובר לחשמל

2. **הגדרה ידנית**:
   - עקוב אחר ההוראות המפורטות בקובץ `docs/power-task-config.md`
   - זה נותן לך שליטה מלאה יותר על ההגדרות

## הסרת התוכנה
להסרת Battery Alert, הרץ את `scripts/uninstall.bat`. תהיה לך בחירה בין:
1. הסרת המשימה המתוזמנת בלבד (אם השתמשת בהפעלה אוטומטית)
2. הסרה מלאה (מסיר את המשימה ומסיר את החבילות המותקנות)

שים לב: נדרשות הרשאות מנהל מערכת להסרת המשימה המתוזמנת.

## רישיון
פרויקט זה מופץ תחת רישיון MIT - ראה קובץ LICENSE לפרטים נוספים. 
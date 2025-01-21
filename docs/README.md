# Battery Alert

Hey there! 👋 Tired of overcharging your laptop battery? Me too! That's why I created this simple tool that lets you know when your battery is charged enough. Just set it up once and forget about it - it'll ping you when it's time to unplug. Cool, right? 😎

## How it works?
1. You tell it your preferred battery level (95% by default)
2. It runs quietly in the background
3. When your battery hits that sweet spot while charging - DING! 🔔 Time to unplug!

You can run it manually whenever you want, or let it start automatically when plugging in power. Your choice!

Note: Running both manual and automatic? No problem! They work independently, just remember you might get double notifications 😉

---

היי! 👋 גם אתם תמיד שוכחים את המחשב מחובר יותר מדי זמן? גם אני! בדיוק בשביל זה יצרתי את הכלי הפשוט הזה שיודיע לכם מתי הסוללה טעונה מספיק. פשוט מגדירים פעם אחת ושוכחים - הוא כבר ישמיע צליל נעים כשצריך לנתק. מגניב, לא? 😎

## איך זה עובד?
1. אתם קובעים את אחוז הסוללה המועדף (95% כברירת מחדל)
2. התוכנה רצה ברקע בשקט
3. כשהסוללה מגיעה למטרה בזמן טעינה - דינג! 🔔 זמן לנתק!

אפשר להריץ ידנית מתי שרוצים, או לתת לתוכנה להתחיל אוטומטית ברגע שמחברים לחשמל. הבחירה שלכם!

הערה: מריצים גם ידנית וגם אוטומטית? אין בעיה! הם עובדים באופן עצמאי, רק זכרו שאולי תקבלו התראה כפולה 😉

---

## Quick Guide to Scripts
- `setup.bat`: Your first stop! Run this to install and configure the program. Use it again whenever you want to change settings.
- `optional_quick_startup.bat`: Want the program to start automatically when plugging in power? Run this once and you're good to go.
- `uninstall.bat`: Breaking up? This will help you remove everything cleanly.

## מדריך מהיר לסקריפטים
- `setup.bat`: התחנה הראשונה! הריצו את זה להתקנה והגדרה. הריצו שוב כשתרצו לשנות הגדרות.
- `optional_quick_startup.bat`: רוצים שהתוכנה תתחיל אוטומטית ברגע שמחברים לחשמל? הריצו את זה פעם אחת וסיימתם.
- `uninstall.bat`: נפרדים? זה יעזור לכם להסיר הכל בצורה נקייה.

---

## System Requirements
- Python 3.6 or higher
- Windows 10 or higher
- Laptop with a working battery
- Administrator privileges (for automatic startup configuration)

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
├── .editorconfig       # Code style settings
└── LICENSE              # MIT License
```

## Installation & Configuration
Simply run `scripts/setup.bat` by double-clicking it or running from Command Prompt.
The script will:
1. Install required packages
2. Configure settings:
   - Target battery percentage (default: 95)
   - Check interval in seconds (default: 120)
3. Offer to run the program immediately

Note: When running manually, the program uses these settings. The automatic startup (if configured) always checks every 5 minutes.

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

## Sound Alert Customization
To change the alert sound:
1. Prepare your custom MP3 file
2. Replace `assets/alert_sound.mp3` with your file
3. Make sure to name it exactly `alert_sound.mp3`

## Sound Credits
The alert sound effect was generated using [LoudMe AI](https://loudme.ai/s/clzl29nd8003boj3ujku6ugvm).

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Roadmap
Future planned features:
- System tray icon with quick controls
- Temporary mute option
- Custom notification sounds without file replacement
- Windows toast notifications

---

# התראת סוללה

תוכנה פשוטה שמתריעה כאשר הסוללה מגיעה לאחוז טעינה מסוים בזמן טעינה.

## דרישות מערכת
- פייתון 3.6 ומעלה
- חלונות 10 ומעלה
- מחשב נייד עם סוללה תקינה
- הרשאות מנהל מערכת (להגדרת הפעלה אוטומטית)

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
├── .editorconfig       # הגדרות סגנון קוד
└── LICENSE              # רישיון MIT
```

## התקנה והגדרות
פשוט הפעל את הקובץ `scripts/setup.bat` על ידי לחיצה כפולה או הרצה מ-Command Prompt.
הסקריפט יבצע:
1. התקנת חבילות נדרשות
2. הגדרת הפרמטרים:
   - אחוז סוללה מטרה (ברירת מחדל: 95)
   - זמן בין בדיקות בשניות (ברירת מחדל: 120)
3. הצעה להפעלה מיידית של התוכנה

הערה: בהרצה ידנית התוכנה משתמשת בהגדרות אלו. בהפעלה אוטומטית (אם הוגדרה) הבדיקה תתבצע כל 5 דקות.

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

## התאמת צליל ההתראה
כדי להחליף את צליל ההתראה:
1. הכן קובץ MP3 לבחירתך
2. החלף את הקובץ `assets/alert_sound.mp3` בקובץ שלך
3. ודא שהקובץ נקרא בדיוק `alert_sound.mp3`

## קרדיטים
צליל ההתראה נוצר באמצעות [LoudMe AI](https://loudme.ai/s/clzl29nd8003boj3ujku6ugvm).

## רישיון
פרויקט זה מופץ תחת רישיון MIT - ראה קובץ LICENSE לפרטים נוספים.

## מפת דרכים
תכונות מתוכננות לעתיד:
- אייקון במגש המערכת עם שליטה מהירה
- אפשרות להשתקה זמנית
- בחירת צלילי התראה ללא החלפת קבצים
- התראות מערכת של חלונות 
# הגדרת הפעלה אוטומטית ב-Task Scheduler
מדריך זה מסביר איך להגדיר את Battery Alert לרוץ אוטומטית במערכת.

## הערה חשובה לפני ההגדרה
1. וודא שהתקנת את הפרויקט לפי ההוראות ב-README.md
2. הרץ את `setup.bat` והגדר את הפרמטרים הרצויים
3. וודא שהתוכנה עובדת כראוי בהרצה ידנית

## בחירת שיטת הפעלה
יש שתי שיטות להפעלה אוטומטית של התוכנה. בחר את השיטה המתאימה לך:

### שיטה 1: בדיקה תקופתית (מומלץ)
✅ פשוטה להגדרה
✅ יציבה יותר
✅ פחות רגישה לשינויים קצרים במצב החשמל
❌ עיכוב של עד 5 דקות בתגובה

### שיטה 2: הפעלה מבוססת אירועים
✅ תגובה מיידית
✅ יעילה יותר מבחינת משאבי מערכת
❌ מורכבת יותר להגדרה
❌ רגישה לשינויים קצרים במצב החשמל

## הגדרת המשימה

### שלבי ההגדרה:

1. **פתיחת Task Scheduler**
   - פתח את Task Scheduler דרך Start Menu
   - בחר Create Task (לא Basic Task)

2. **הגדרות כלליות (General)**
   - Name: Battery Alert Monitor
   - Description: מנטר את מצב הסוללה ומתריע כשהיא מגיעה לאחוז טעינה מסוים
   - סמן "Run with highest privileges"
   - בחר "Run only when user is logged on" כדי לראות את חלון הפלט

3. **הגדרת Triggers**
   לפי השיטה שבחרת:

   **שיטה 1 (בדיקה תקופתית)**:
   - לחץ New בלשונית Triggers
   - בחר Daily
   - הגדר שעת התחלה (למשל 00:00)
   - תחת Advanced Settings:
     - סמן "Repeat task every: 5 minutes"
     - בחר "for a duration of: 1 day"
     - וודא שמסומן Enabled

   **שיטה 2 (מבוססת אירועים)**:
   - לחץ New בלשונית Triggers
   - בחר "On an event"
   - תחת Log בחר: System
   - תחת Source בחר: Kernel-Power
   - הגדר Event ID: 105 (חיבור לחשמל)

4. **הגדרת Conditions**
   - בלשונית Conditions
   - תחת Power:
     - סמן "Start the task only if the computer is on AC power"
     - בטל סימון של "Stop if the computer switches to battery power"

5. **הגדרת Actions**
   - לחץ New בלשונית Actions
   - Action: Start a Program
   - Program/script: הכנס את הנתיב לפייתון (למשל `C:\Python39\python.exe`)
   - Add arguments: הכנס את הנתיב המלא ל-`battery_alert.py`
   - Start in: הכנס את הנתיב לתיקיית הפרויקט

   לדוגמה:
   - Program/script: `C:\Python39\python.exe`
   - Add arguments: `C:\path\to\battery_alert.py`
   - Start in: `C:\path\to\project`

6. **הגדרות נוספות (Settings)**
   - סמן "Allow task to be run on demand"
   - סמן "Run task as soon as possible after a scheduled start is missed"
   - בחר "Do not start a new instance"

## טיפים נוספים
1. אם אתה רוצה לשנות את ההגדרות, הרץ שוב את `setup.bat`
2. אם אתה רוצה לבדוק שהמשימה עובדת, לחץ על Run בחלון המשימה
3. בדוק את הלוגים של Task Scheduler אם יש בעיות
4. וודא שהנתיבים שהגדרת ב-Actions הם נתיבים מלאים ומדויקים

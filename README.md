# Battery Alert

תוכנה פשוטה להתראה כאשר הסוללה מגיעה לאחוז טעינה מסוים בזמן טעינה.

## התקנה

### אפשרות 1: התקנה אוטומטית (מומלץ)
פשוט הפעל את הקובץ `setup.bat` על ידי לחיצה כפולה עליו או הרצה מ-Command Prompt.
הסקריפט יבצע את הפעולות הבאות:
1. התקנת סביבה וירטואלית והחבילות הנדרשות
2. הגדרת פרמטרים:
   - אחוז הסוללה המטרה (ברירת מחדל: 93)
   - זמן בין בדיקות בשניות (ברירת מחדל: 120)
3. הצעה להפעלה מיידית של התוכנה

### אפשרות 2: התקנה ידנית
אם אתה מעדיף להתקין באופן ידני, בצע את השלבים הבאים:

1. צור סביבה וירטואלית:
```bash
python -m venv venv
```

2. הפעל את הסביבה הוירטואלית:
- ב-Windows (PowerShell):
```powershell
.\venv\Scripts\Activate.ps1
```
- ב-Windows (CMD):
```cmd
.\venv\Scripts\activate.bat
```
- ב-Linux/Mac:
```bash
source venv/bin/activate
```

3. התקן את התלויות:
```bash
pip install -r requirements.txt
```

## הגדרות
ניתן לשנות את הגדרות התוכנה בשתי דרכים:

1. **בזמן ההתקנה**: הרץ את `setup.bat` והזן את הערכים הרצויים כשתתבקש

2. **לאחר ההתקנה**: ערוך ידנית את קובץ `config.py`:
   - `TARGET_BATTERY_PERCENT`: אחוז הסוללה שממנו תופעל ההתראה
   - `CHECK_INTERVAL`: זמן בשניות בין בדיקות

## שימוש

הרץ את התוכנה:
```bash
python battery_alert.py
```

התוכנה תבדוק את מצב הסוללה לפי המרווח שהוגדר בתתריע כאשר הסוללה מגיעה לאחוז המטרה בזמן טעינה.

הצליל שיושמע נמצא בקובץ `Chime 1.mp3` 
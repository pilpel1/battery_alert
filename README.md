# Battery Alert

תוכנה פשוטה להתראה כאשר הסוללה מגיעה לאחוז טעינה מסוים בזמן טעינה.

## התקנה

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
ניתן לשנות את הגדרות התוכנה בקובץ `config.py`:
- `TARGET_BATTERY_PERCENT`: אחוז הסוללה שממנו תופעל ההתראה (ברירת מחדל: 93)
- `CHECK_INTERVAL`: זמן בשניות בין בדיקות (ברירת מחדל: 120)

## שימוש

הרץ את התוכנה:
```bash
python battery_alert.py
```

התוכנה תבדוק את מצב הסוללה לפי המרווח שהוגדר ב-`CHECK_INTERVAL` ותתריע כאשר הסוללה מגיעה לאחוז שהוגדר ב-`TARGET_BATTERY_PERCENT` בזמן טעינה.

הצליל שיושמע נמצא בקובץ `Chime 1.mp3` 
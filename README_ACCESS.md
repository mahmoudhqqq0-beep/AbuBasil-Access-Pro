#!/usr/bin/env python3
"""Create a Microsoft Access (.accdb) database starter for the AbuBasil accounting system.

Requirements on Windows:
  - Python 3.x
  - pyodbc
  - Microsoft Access Database Engine 2016 (ACE) x64 or x86 matching your Python bitness

Install:
  pip install pyodbc

Usage:
  python generate_access_db.py --path "C:/Temp/AbuBasil.accdb"

Notes:
  This script creates a real Access database file only when the Access ODBC driver is installed.
  If Access is not installed, the ACE driver is still required.
""",
"message":"إضافة برنامج Python لإنشاء قاعدة بيانات Access جاهزة لوظائف النظام المحاسبي","owner":"mahmoudhqqq0-beep","path":"generate_access_db.py","repo":"AbuBasil-Access-Pro","sha":null}},{
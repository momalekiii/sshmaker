``markdown
# اسکریپت مدیریت کاربر

این اسکریپت برای ایجاد یک کاربر با دسترسی محدود به SSH، تنظیم تاریخ انقضا و به طور اختیاری محدود کردن ترافیک شبکه کاربر طراحی شده است.

## ویژگی‌ها

- ایجاد یک کاربر با دسترسی محدود به SSH.
- تنظیم تاریخ انقضا برای کاربر.
- به طور اختیاری محدود کردن ترافیک شبکه کاربر.

## استفاده

1. کلون کردن مخزن:

   ```bash
   git clone https://github.com/momalekiii/user-management-script.git
   ```

2. وارد شدن به دایرکتوری اسکریپت:

   ```bash
   cd user-management-script
   ```

3. اجرای اسکریپت با آرگومان‌های موردنیاز:

   ```bash
   sudo bash create_user.sh <نام_کاربری> <تاریخ_انقضا> <محدودیت_دانلود_kbps> <محدودیت_آپلود_kbps>
   ```

   مقادیر خود را جایگزین `<نام_کاربری>`, `<تاریخ_انقضا>`, `<محدودیت_دانلود_kbps>`, و `<محدودیت_آپلود_kbps>` کنید.

## مثال

```bash
sudo bash create_user.sh john.doe 2023-12-31 1024 512
```

در این مثال، اسکریپت یک کاربر به نام "john.doe" با تاریخ انقضا 31 دسامبر 2023 و محدودیت دانلود 1024 kbps و محدودیت آپلود 512 kbps ایجاد می‌کند.

## لایسنس

این اسکریپت تحت [لایسنس MIT](LICENSE) منتشر شده است.
```

Feel free to use this Persian version in your GitHub repository. If you have any further requests or modifications needed, please let me know!
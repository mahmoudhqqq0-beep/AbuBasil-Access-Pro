# برنامج أبو باسل للمحاسبة - نسخة Access
## هيكل قاعدة البيانات الكامل

---

## 1️⃣ الجداول الأساسية

### جدول الشركة (tblCompany)
```
CompanyID (رقم)
CompanyName (نص) - اسم الشركة
OpeningBalance (عملة) - الرصيد الافتتاحي للخزينة
CreatedDate (تاريخ)
```

### جدول العملاء (tblCustomers)
```
CustomerID (رقم) ← المفتاح الأساسي
CustomerName (نص) - اسم العميل
CustomerCode (نص) - الكود (فريد)
Category (نص) - التصنيف
Phone (نص)
Address (نص)
CreditLimit (عملة) - حد الائتمان
OpeningBalance (عملة) - رصيد افتتاحي
CreatedDate (تاريخ)
Notes (نص)
```

### جدول الموردين (tblSuppliers)
```
SupplierID (رقم) ← المفتاح الأساسي
SupplierName (نص)
SupplierCode (نص) - الكود (فريد)
Category (نص) - التصنيف
Phone (نص)
Address (نص)
OpeningBalance (عملة) - رصيد افتتاحي
CreatedDate (تاريخ)
Notes (نص)
```

### جدول الأصناف (tblItems)
```
ItemID (رقم) ← المفتاح الأساسي
ItemName (نص) - اسم الصنف
ItemCode (نص) - الكود (فريد)
Unit (نص) - الوحدة
SalePrice (عملة) - سعر البيع
PurchasePrice (عملة) - سعر الشراء
MinimumStock (عملة) - حد إعادة الطلب
OpeningStock (عملة) - رصيد افتتاحي
CreatedDate (تاريخ)
```

---

## 2️⃣ جداول العمليات المحاسبية

### جدول فواتير المبيعات (tblSalesInvoices)
```
InvoiceID (رقم) ← المفتاح الأساسي
InvoiceNo (نص) - رقم الفاتورة
InvoiceDate (تاريخ)
CustomerID (رقم) ← مفتاح أجنبي (tblCustomers)
InvoiceType (نص) - نوع (فاتورة مبيعات / مرتجع / سند قبض)
TotalAmount (عملة)
Discount (عملة)
NetAmount (عملة)
PaidAmount (عملة) - المدفوع
RemainingAmount (عملة) - المتبقي
Notes (نص)
CreatedDate (تاريخ)
```

### جدول تفاصيل المبيعات (tblSalesDetails)
```
DetailID (رقم) ← المفتاح الأساسي
InvoiceID (رقم) ← مفتاح أجنبي (tblSalesInvoices)
ItemID (رقم) ← مفتاح أجنبي (tblItems)
Quantity (عملة)
UnitPrice (عملة)
TotalPrice (عملة)
Notes (نص)
```

### جدول فواتير المشتريات (tblPurchaseInvoices)
```
InvoiceID (رقم) ← المفتاح الأساسي
InvoiceNo (نص)
InvoiceDate (تاريخ)
SupplierID (رقم) ← مفتاح أجنبي (tblSuppliers)
InvoiceType (نص) - نوع (فاتورة شراء / مرتجع / سند صرف)
TotalAmount (عملة)
Discount (عملة)
NetAmount (عملة)
PaidAmount (عملة)
RemainingAmount (عملة)
Notes (نص)
CreatedDate (تاريخ)
```

### جدول تفاصيل المشتريات (tblPurchaseDetails)
```
DetailID (رقم) ← المفتاح الأساسي
InvoiceID (رقم) ← مفتاح أجنبي (tblPurchaseInvoices)
ItemID (رقم) ← مفتاح أجنبي (tblItems)
Quantity (عملة)
UnitPrice (عملة)
TotalPrice (عملة)
Notes (نص)
```

### جدول الأوردرات (tblOrders)
```
OrderID (رقم) ← المفتاح الأساسي
OrderNo (نص)
OrderDate (تاريخ) - تاريخ الطلب
DeliveryDate (تاريخ) - تاريخ التسليم
CustomerID (رقم) ← مفتاح أجنبي (tblCustomers)
ItemID (رقم) ← مفتاح أجنبي (tblItems)
Description (نص) - وصف الطلب
Quantity (عملة)
OrderAmount (عملة) - قيمة الطلب
Deposit (عملة) - العربون المدفوع
Status (نص) - الحالة (جديد / قيد التنفيذ / جاهز / تم التسليم / ملغي)
Notes (نص)
CreatedDate (تاريخ)
```

### جدول المصروفات (tblExpenses)
```
ExpenseID (رقم) ← المفتاح الأساسي
ExpenseDate (تاريخ)
ExpenseCategory (نص) - البند
Amount (عملة)
Notes (نص)
CreatedDate (تاريخ)
```

### جدول حركات الخزينة (tblCashFlow)
```
TransactionID (رقم) ← المفتاح الأساسي
TransactionDate (تاريخ)
TransactionType (نص) - نوع (مقبوضات / مدفوعات)
Amount (عملة)
RelatedInvoiceID (رقم) - الفاتورة المرتبطة
CashType (نص) - نوع النقد (نقدي / شيك)
Notes (نص)
CreatedDate (تاريخ)
```

---

## 3️⃣ العلاقات بين الجداول

```
tblCustomers ──→ tblSalesInvoices (1:N)
tblSalesInvoices ──→ tblSalesDetails (1:N)
tblItems ──→ tblSalesDetails (1:N)
tblItems ──→ tblPurchaseDetails (1:N)

tblSuppliers ──→ tblPurchaseInvoices (1:N)
tblPurchaseInvoices ──→ tblPurchaseDetails (1:N)

tblCustomers ──→ tblOrders (1:N)
tblItems ──→ tblOrders (1:N)

tblExpenses ──→ مستقلة
tblCashFlow ──→ tblSalesInvoices / tblPurchaseInvoices
```

---

## 4️⃣ الاستعلامات الأساسية

### qryCustomerBalance - رصيد العميل
```sql
SELECT 
    tblCustomers.CustomerID,
    tblCustomers.CustomerName,
    tblCustomers.OpeningBalance,
    SUM(tblSalesDetails.TotalPrice) AS TotalSales,
    SUM(tblCashFlow.Amount) AS TotalPaid,
    (tblCustomers.OpeningBalance + SUM(tblSalesDetails.TotalPrice) - SUM(tblCashFlow.Amount)) AS CurrentBalance
FROM tblCustomers
LEFT JOIN tblSalesInvoices ON tblCustomers.CustomerID = tblSalesInvoices.CustomerID
LEFT JOIN tblSalesDetails ON tblSalesInvoices.InvoiceID = tblSalesDetails.InvoiceID
LEFT JOIN tblCashFlow ON tblSalesInvoices.InvoiceID = tblCashFlow.RelatedInvoiceID
GROUP BY tblCustomers.CustomerID, tblCustomers.CustomerName, tblCustomers.OpeningBalance
```

### qrySupplierBalance - مستحقات المورد
```sql
SELECT 
    tblSuppliers.SupplierID,
    tblSuppliers.SupplierName,
    tblSuppliers.OpeningBalance,
    SUM(tblPurchaseDetails.TotalPrice) AS TotalPurchases,
    SUM(tblCashFlow.Amount) AS TotalPaid,
    (tblSuppliers.OpeningBalance + SUM(tblPurchaseDetails.TotalPrice) - SUM(tblCashFlow.Amount)) AS RemainingAmount
FROM tblSuppliers
LEFT JOIN tblPurchaseInvoices ON tblSuppliers.SupplierID = tblPurchaseInvoices.SupplierID
LEFT JOIN tblPurchaseDetails ON tblPurchaseInvoices.InvoiceID = tblPurchaseDetails.InvoiceID
LEFT JOIN tblCashFlow ON tblPurchaseInvoices.InvoiceID = tblCashFlow.RelatedInvoiceID
GROUP BY tblSuppliers.SupplierID, tblSuppliers.SupplierName, tblSuppliers.OpeningBalance
```

### qryStockBalance - رصيد المخزون
```sql
SELECT 
    tblItems.ItemID,
    tblItems.ItemName,
    tblItems.OpeningStock,
    COALESCE(SUM(CASE WHEN InvoiceType = 'فاتورة مبيعات' THEN -Quantity ELSE Quantity END), 0) AS StockMovement,
    (tblItems.OpeningStock + COALESCE(SUM(CASE WHEN InvoiceType = 'فاتورة مبيعات' THEN -Quantity ELSE Quantity END), 0)) AS CurrentStock,
    tblItems.MinimumStock
FROM tblItems
LEFT JOIN tblSalesDetails ON tblItems.ItemID = tblSalesDetails.ItemID
GROUP BY tblItems.ItemID, tblItems.ItemName, tblItems.OpeningStock, tblItems.MinimumStock
```

### qryCashSummary - ملخص الخزينة
```sql
SELECT 
    tblCompany.CompanyName,
    tblCompany.OpeningBalance,
    SUM(CASE WHEN TransactionType = 'مقبوضات' THEN Amount ELSE 0 END) AS TotalReceipts,
    SUM(CASE WHEN TransactionType = 'مدفوعات' THEN Amount ELSE 0 END) AS TotalPayments,
    SUM(tblExpenses.Amount) AS TotalExpenses,
    (tblCompany.OpeningBalance + SUM(CASE WHEN TransactionType = 'مقبوضات' THEN Amount ELSE 0 END) - SUM(CASE WHEN TransactionType = 'مدفوعات' THEN Amount ELSE 0 END) - SUM(tblExpenses.Amount)) AS CurrentCashBalance
FROM tblCompany
LEFT JOIN tblCashFlow ON 1=1
LEFT JOIN tblExpenses ON 1=1
GROUP BY tblCompany.CompanyName, tblCompany.OpeningBalance
```

---

## 5️⃣ النماذج الرئيسية

### Dashboard Form (نموذج لوحة التحكم)
- عرض ملخص البيانات
- أزرار التنقل للنماذج الأخرى
- رصيد الخزينة الحالي
- أعلى ذمم العملاء
- أصناف وصلت لحد الطلب

### frmCustomer (نموذج العميل)
- إضافة / تعديل / حذف عميل
- عرض السجل
- زر للدخول لكشف الحساب

### frmSupplier (نموذج المورد)
- إضافة / تعديل / حذف مورد

### frmItem (نموذج الصنف)
- إضافة / تعديل / حذف صنف
- عرض رصيد المخزون

### frmSalesInvoice (نموذج فاتورة المبيعات)
- إنشاء فاتورة جديدة
- اختيار العميل
- إضافة تفاصيل الفاتورة (بجدول فرعي)
- حساب الإجمالي والخصم والصافي تلقائيًا
- طباعة الفاتورة

### frmPurchaseInvoice (نموذج فاتورة المشتريات)
- نفس منطق فاتورة المبيعات لكن للموردين

### frmCustomerStatement (نموذج كشف حساب العميل)
- عرض جميع حركات العميل
- رصيد افتتاحي
- مدين / دائن
- الرصيد الحالي
- تصفية حسب التاريخ

### frmSupplierStatement (نموذج كشف حساب المورد)
- نفس منطق كشف العميل

### frmOrder (نموذج الأوردر)
- إنشاء / تعديل أوردر
- اختيار العميل والصنف
- تحديد تاريخ التسليم
- تغيير الحالة

### frmExpense (نموذج المصروفات)
- إضافة / تعديل مصروف
- عرض قائمة المصروفات

### frmCashFlow (نموذج الخزينة)
- عرض ملخص حركة الخزينة
- رصيد افتتاحي
- مقبوضات / مدفوعات
- مصروفات
- الرصيد الحالي

---

## 6️⃣ التقارير

- rptSalesInvoice - تقرير فاتورة المبيعات
- rptPurchaseInvoice - تقرير فاتورة المشتريات
- rptCustomerStatement - كشف حساب العميل
- rptSupplierStatement - كشف حساب المورد
- rptInventory - تقرير المخزون
- rptExpenses - تقرير المصروفات
- rptCashFlow - تقرير حركة الخزينة
- rptSalesMonthly - تقرير المبيعات الشهري
- rptPurchasesMonthly - تقرير المشتريات الشهري

---

## 7️⃣ كود VBA الأساسي

### Module: ModuleMain
```vba
' وحدة الدوال الرئيسية والمشتركة
Function FormatCurrency(value As Variant) As String
    FormatCurrency = Format(value, "#,##0.00")
End Function

Function GetCustomerBalance(CustomerID As Long) As Currency
    ' حساب رصيد العميل من الاستعلام
End Function

Function GetSupplierBalance(SupplierID As Long) As Currency
    ' حساب مستحقات المورد
End Function

Function GetCurrentStock(ItemID As Long) As Double
    ' حساب رصيد المخزون الحالي
End Function

Function GetCashBalance() As Currency
    ' حساب رصيد الخزينة الحالي
End Function
```

### Module: ModuleForms
```vba
' وحدة التحكم بالنماذج
Sub OpenDashboard()
    DoCmd.OpenForm "frmDashboard"
End Sub

Sub OpenCustomerForm()
    DoCmd.OpenForm "frmCustomer"
End Sub

Sub OpenSalesInvoice()
    DoCmd.OpenForm "frmSalesInvoice"
End Sub
```

---

الآن سأبدأ في إنشاء الملفات الفعلية:
1. SQL Scripts للجداول
2. كود VBA الكامل
3. نماذج Access
4. تقارير
5. دليل الاستخدام

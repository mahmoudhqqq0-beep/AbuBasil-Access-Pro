CREATE TABLE tblCompany (
    CompanyID AUTOINCREMENT PRIMARY KEY,
    CompanyName TEXT(255) NOT NULL,
    OpeningBalance CURRENCY DEFAULT 0,
    CreatedDate DATE DEFAULT DATE()
);

CREATE TABLE tblCustomers (
    CustomerID AUTOINCREMENT PRIMARY KEY,
    CustomerCode TEXT(50) NOT NULL UNIQUE,
    CustomerName TEXT(255) NOT NULL,
    Category TEXT(255),
    Phone TEXT(50),
    Address TEXT(255),
    CreditLimit CURRENCY DEFAULT 0,
    OpeningBalance CURRENCY DEFAULT 0,
    CreatedDate DATE DEFAULT DATE(),
    Notes MEMO
);

CREATE TABLE tblSuppliers (
    SupplierID AUTOINCREMENT PRIMARY KEY,
    SupplierCode TEXT(50) NOT NULL UNIQUE,
    SupplierName TEXT(255) NOT NULL,
    Category TEXT(255),
    Phone TEXT(50),
    Address TEXT(255),
    OpeningBalance CURRENCY DEFAULT 0,
    CreatedDate DATE DEFAULT DATE(),
    Notes MEMO
);

CREATE TABLE tblItems (
    ItemID AUTOINCREMENT PRIMARY KEY,
    ItemCode TEXT(50) NOT NULL UNIQUE,
    ItemName TEXT(255) NOT NULL,
    Unit TEXT(50),
    SalePrice CURRENCY DEFAULT 0,
    PurchasePrice CURRENCY DEFAULT 0,
    MinimumStock DOUBLE DEFAULT 0,
    OpeningStock DOUBLE DEFAULT 0,
    CreatedDate DATE DEFAULT DATE()
);

CREATE TABLE tblSalesInvoices (
    InvoiceID AUTOINCREMENT PRIMARY KEY,
    InvoiceNo TEXT(50) NOT NULL UNIQUE,
    InvoiceDate DATE NOT NULL,
    CustomerID LONG NOT NULL,
    InvoiceType TEXT(50) NOT NULL,
    TotalAmount CURRENCY DEFAULT 0,
    Discount CURRENCY DEFAULT 0,
    NetAmount CURRENCY DEFAULT 0,
    PaidAmount CURRENCY DEFAULT 0,
    RemainingAmount CURRENCY DEFAULT 0,
    Notes MEMO,
    CreatedDate DATE DEFAULT DATE(),
    CONSTRAINT FK_tblSalesInvoices_tblCustomers FOREIGN KEY (CustomerID) REFERENCES tblCustomers(CustomerID)
);

CREATE TABLE tblSalesDetails (
    DetailID AUTOINCREMENT PRIMARY KEY,
    InvoiceID LONG NOT NULL,
    ItemID LONG NOT NULL,
    Quantity DOUBLE DEFAULT 0,
    UnitPrice CURRENCY DEFAULT 0,
    TotalPrice CURRENCY DEFAULT 0,
    Notes TEXT(255),
    CONSTRAINT FK_tblSalesDetails_tblSalesInvoices FOREIGN KEY (InvoiceID) REFERENCES tblSalesInvoices(InvoiceID),
    CONSTRAINT FK_tblSalesDetails_tblItems FOREIGN KEY (ItemID) REFERENCES tblItems(ItemID)
);

CREATE TABLE tblPurchaseInvoices (
    InvoiceID AUTOINCREMENT PRIMARY KEY,
    InvoiceNo TEXT(50) NOT NULL UNIQUE,
    InvoiceDate DATE NOT NULL,
    SupplierID LONG NOT NULL,
    InvoiceType TEXT(50) NOT NULL,
    TotalAmount CURRENCY DEFAULT 0,
    Discount CURRENCY DEFAULT 0,
    NetAmount CURRENCY DEFAULT 0,
    PaidAmount CURRENCY DEFAULT 0,
    RemainingAmount CURRENCY DEFAULT 0,
    Notes MEMO,
    CreatedDate DATE DEFAULT DATE(),
    CONSTRAINT FK_tblPurchaseInvoices_tblSuppliers FOREIGN KEY (SupplierID) REFERENCES tblSuppliers(SupplierID)
);

CREATE TABLE tblPurchaseDetails (
    DetailID AUTOINCREMENT PRIMARY KEY,
    InvoiceID LONG NOT NULL,
    ItemID LONG NOT NULL,
    Quantity DOUBLE DEFAULT 0,
    UnitPrice CURRENCY DEFAULT 0,
    TotalPrice CURRENCY DEFAULT 0,
    Notes TEXT(255),
    CONSTRAINT FK_tblPurchaseDetails_tblPurchaseInvoices FOREIGN KEY (InvoiceID) REFERENCES tblPurchaseInvoices(InvoiceID),
    CONSTRAINT FK_tblPurchaseDetails_tblItems FOREIGN KEY (ItemID) REFERENCES tblItems(ItemID)
);

CREATE TABLE tblOrders (
    OrderID AUTOINCREMENT PRIMARY KEY,
    OrderNo TEXT(50) NOT NULL UNIQUE,
    OrderDate DATE NOT NULL,
    DeliveryDate DATE,
    CustomerID LONG NOT NULL,
    ItemID LONG,
    Description MEMO,
    Quantity DOUBLE DEFAULT 0,
    OrderAmount CURRENCY DEFAULT 0,
    Deposit CURRENCY DEFAULT 0,
    Status TEXT(50) DEFAULT 'جديد',
    Notes MEMO,
    CreatedDate DATE DEFAULT DATE(),
    CONSTRAINT FK_tblOrders_tblCustomers FOREIGN KEY (CustomerID) REFERENCES tblCustomers(CustomerID),
    CONSTRAINT FK_tblOrders_tblItems FOREIGN KEY (ItemID) REFERENCES tblItems(ItemID)
);

CREATE TABLE tblExpenses (
    ExpenseID AUTOINCREMENT PRIMARY KEY,
    ExpenseDate DATE NOT NULL,
    ExpenseCategory TEXT(255) NOT NULL,
    Amount CURRENCY DEFAULT 0,
    Notes MEMO,
    CreatedDate DATE DEFAULT DATE()
);

CREATE TABLE tblCashFlow (
    TransactionID AUTOINCREMENT PRIMARY KEY,
    TransactionDate DATE NOT NULL,
    TransactionType TEXT(50) NOT NULL,
    Amount CURRENCY DEFAULT 0,
    RelatedInvoiceID LONG,
    CashType TEXT(50),
    Notes MEMO,
    CreatedDate DATE DEFAULT DATE()
);

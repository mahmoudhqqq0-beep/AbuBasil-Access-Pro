Option Compare Database
Option Explicit

Public Function FormatMoney(ByVal v As Variant) As String
    If IsNull(v) Or v = "" Then
        FormatMoney = "0.00"
    Else
        FormatMoney = FormatCurrency(v, 2)
    End If
End Function

Public Function GetCustomerBalance(ByVal CustomerID As Long) As Currency
    Dim rs As DAO.Recordset
    Dim SQL As String

    SQL = "SELECT NZ(SUM(OpeningBalance),0) AS O FROM tblCustomers WHERE CustomerID=" & CustomerID & ";"
    Set rs = CurrentDb.OpenRecordset(SQL)
    If Not rs.EOF Then
        GetCustomerBalance = Nz(rs!O, 0)
    End If
    rs.Close
    Set rs = Nothing
End Function

Public Function GetCurrentStock(ByVal ItemID As Long) As Double
    Dim rs As DAO.Recordset
    Dim SQL As String

    SQL = "SELECT NZ(OpeningStock,0) AS Op FROM tblItems WHERE ItemID=" & ItemID & ";"
    Set rs = CurrentDb.OpenRecordset(SQL)
    If Not rs.EOF Then
        GetCurrentStock = Nz(rs!Op, 0)
    End If
    rs.Close
    Set rs = Nothing
End Function

Public Sub OpenDashboard()
    DoCmd.OpenForm "frmDashboard"
End Sub

Public Sub OpenCustomerForm()
    DoCmd.OpenForm "frmCustomer"
End Sub

Public Sub OpenSupplierForm()
    DoCmd.OpenForm "frmSupplier"
End Sub

Public Sub OpenSalesInvoiceForm()
    DoCmd.OpenForm "frmSalesInvoice"
End Sub

Public Sub OpenPurchaseInvoiceForm()
    DoCmd.OpenForm "frmPurchaseInvoice"
End Sub

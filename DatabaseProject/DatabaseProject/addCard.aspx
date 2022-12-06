<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCard.aspx.cs" Inherits="DatabaseProject.addCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Credit Card(s)</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Credit Card Number"></asp:Label>
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
        <asp:Label ID="Label2" runat="server" Text="Expiry Date"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
        <asp:Label ID="Label3" runat="server" Text="CVV"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Note: Please add the credit cards one by one.<br />
            Note: Add the expiry date in the form yyyy-mm-dd.<br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="add" />
        </div>
    </form>
</body>
</html>

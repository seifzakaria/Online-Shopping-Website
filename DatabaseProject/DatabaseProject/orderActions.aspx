<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderActions.aspx.cs" Inherits="DatabaseProject.orderActions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Actions</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Order ID"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Cash Amount"></asp:Label>
            <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Credit Amount"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Note: You can not pay using both credit and cash, only one. Leave the other box empty.<br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Specify Amount" OnClick="specifyAmount" />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Order ID"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Credit Card Number"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Specify Credit Card" OnClick="creditcard" />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Order ID"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Cancel Order" OnClick="cancel" />
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addPhoneNumbers.aspx.cs" Inherits="DatabaseProject.addPhoneNumbers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Phone Number(s)</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Phone Number"></asp:Label>
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Note: Please add the numbers one by one!<br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="add" />
        </div>
    </form>
</body>
</html>

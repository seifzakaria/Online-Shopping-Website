<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="todayDealActions.aspx.cs" Inherits="DatabaseProject.todayDealActions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Deal Amount"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Expiry Date"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Create Today's Deal" OnClick="create" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Deal ID"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Product Serial No."></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Apply Deal" OnClick="apply" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Deal ID"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Remove Expired Deal" OnClick="remove" />
        </div>
    </form>
</body>
</html>

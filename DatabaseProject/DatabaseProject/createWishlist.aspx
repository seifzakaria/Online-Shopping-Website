<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createWishlist.aspx.cs" Inherits="DatabaseProject.createWishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Wishlist</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Wishlist Name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Create Wishlist" OnClick="create" />
            <br />
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepageC.aspx.cs" Inherits="DatabaseProject.homepageC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Homepage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Add Phone Number(s)" OnClick="addNumber" />
&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="View Products" OnClick="viewProducts" />
&nbsp;&nbsp;&nbsp;<br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Create Wishlist(s)" OnClick="createWishlist" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Product Serial No."></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Wishlist Name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button7" runat="server" Text="addToWishlist" OnClick="addWishlist" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Product Serial No."></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Wishlist Name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button8" runat="server" Text="removeFromWishlist" OnClick="removeWishlist" />
            &nbsp;&nbsp;<br />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Add Credit Card(s)" OnClick="addCreditCard" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Product Serial No."></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
&nbsp;<br />
            <asp:Button ID="Button9" runat="server" Text="addToCart" OnClick="addCart" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Product Serial No."></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button10" runat="server" Text="removeFromCart" OnClick="removeCart" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Button ID="Button11" runat="server" Text="View Cart" OnClick="viewCart" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button12" runat="server" Text="Order Actions" OnClick="orderActions" />
            <br />
        </div>
    </form>
</body>
</html>

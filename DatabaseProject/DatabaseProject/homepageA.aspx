<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepageA.aspx.cs" Inherits="DatabaseProject.homepageA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Homepage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Vendor Username"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Activate Vendor" OnClick="activate" />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Review Orders" OnClick="review" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Today's Deals Actions" OnClick="todaydealAction" />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Order No."></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Update Order Status" OnClick="updateStatus" />
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="User_Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Primary.css" />
    <link rel="stylesheet" href="../CSS/Inputpage.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">            
    <div>
        <section class ="headerSec">
            <div id="headerLinks">
                <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Home</asp:LinkButton>
                &nbsp;&nbsp; <asp:LinkButton ID="lbLogOut" runat="server" OnClick="lbLogOut_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Log Out</asp:LinkButton>
            </div>    
            <h1>The eBook Store.</h1>
            You are signed in
             as
            <asp:Label ID="lblMsg" runat="server" Text="Anonymous"></asp:Label>
            <br />
        </section>
        <h2>
        <br />
        </h2>
        <div class="centerContainer">
        <br />
            <table class="auto-style1">
                <tr>
                    <td>1. Finalize Items</td>
                    <td>2. Proceed with Checkout</td>
                </tr>
                <tr>
                    <td>
        <asp:ListBox ID="lbCartItems" runat="server" Width="200px"></asp:ListBox>
                        <br />
        <asp:Button ID="btnCart" runat="server" OnClick="btnCart_Click" Text="Remove Item" CssClass="btnInput" />
                    </td>
                    <td>
                        <h3>Total bill:
        <asp:Label ID="lblBill" runat="server"></asp:Label>
                        </h3>
                        <asp:Button ID="btnPay" runat="server" Text="Make Payment" OnClick="btnPay_Click" CssClass="btnInput" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="lbContinue" runat="server" Font-Bold="True" Font-Underline="False" OnClick="lbContinue_Click" style="color: #660033">Continue with Shopping</asp:LinkButton>
            <br />
        </div>
        <br />
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    <footer>

    </footer>
    </div>
    </form>
</body>
</html>

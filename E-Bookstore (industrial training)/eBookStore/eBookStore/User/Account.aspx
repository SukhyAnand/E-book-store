<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="User_Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet"  href="../CSS/Primary.css" />
    <link rel="stylesheet" href="../CSS/InputPage.css" />
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div id="MainColoumn">
    <section class ="headerSec">
            <div id="headerLinks">
        <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Home</asp:LinkButton>
&nbsp;<asp:LinkButton ID="lbOrders" runat="server" OnClick="lbOrders_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">My Orders</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="lbLogOut" runat="server" OnClick="lbLogOut_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Log Out</asp:LinkButton>
            </div>    
            <h1>The eBook Store.</h1>
            You are signed in
             as
            <asp:Label ID="lblMsg" runat="server" Text="Anonymous"></asp:Label>
            <br />
        </section>
        <br />
        <div class="centerContainer">
            <table class="innerTable">
                <tr>
                    <td>Change Account Details</td>
                    <td>Change Password</td>
                </tr>
                <tr>
                    <td><br />
                <asp:TextBox ID="txtName" runat="server" CssClass="textInputAlt" placeholder="Name" ReadOnly="True"></asp:TextBox>
            <br />
        <br />
        &nbsp;<asp:TextBox ID="txtContact" runat="server" CssClass="textInputAlt" placeholder="Contact number" ReadOnly="True"></asp:TextBox>
                <br />
        <br />
                <asp:Button ID="btnUpdate0" runat="server" OnClick="btnUpdate0_Click" Text="Update" CssClass="btnInput" Visible="False" />
                <br />
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" CssClass="btnInput" />
                    </td>
                    <td>&nbsp;<asp:TextBox ID="txtOldPass" runat="server" CssClass="textInputAlt" placeholder="Old Password"></asp:TextBox>
            <br />
        <br />
            <asp:TextBox ID="txtNewPass" runat="server" CssClass="textInputAlt" placeholder="New Password"></asp:TextBox>
            <br />
        <br />
        <asp:TextBox ID="txtRePass" runat="server" CssClass="textInputAlt" placeholder="Re-enter New Password"></asp:TextBox>
            <br />
        <br />
&nbsp;<asp:Button ID="btnUpdate1" runat="server" OnClick="btnUpdate1_Click" Text="Change Password" CssClass="btnInput" />
        <br />
        <br />
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    
        <br />
        <footer>
            <asp:LinkButton ID="lbAdmin" runat="server" OnClick="lbAdmin_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Admin Login</asp:LinkButton>
        </footer>  
    
    </div>
    </form>
</body>
</html>

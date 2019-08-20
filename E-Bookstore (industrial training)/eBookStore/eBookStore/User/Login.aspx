<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="User_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Primary.css" />
    <link rel="stylesheet" href="../CSS/Login.css"
</head>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>

<body>
    <form id="form1" runat="server">
    <div id="MainColoumn">    
        <section class="headerSec">
                <div id ="headerLinks">
                    <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click" Font-Bold="True" Font-Underline="False" ForeColor="White" CausesValidation="False">Home</asp:LinkButton>
                    &nbsp;&nbsp;<asp:LinkButton ID="lbReg" runat="server" OnClick="lbReg_Click" Font-Bold="True" Font-Underline="False" ForeColor="White" CausesValidation="False">Register</asp:LinkButton>
                    &nbsp;&nbsp;</div>
                <h1>The eBook Store.</h1>
                Welcome Guest.</section>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div id="innerLogin">
            <br />
            <br />
        <asp:TextBox ID="txtLogin" runat="server" placeholder="Email" CssClass="loginInput"></asp:TextBox>
            <br />
        <br />
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Password" CssClass="loginInput"></asp:TextBox>
            <br />
        <br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
            <br />
            <br />
        Keep me logged in for
            <asp:TextBox ID="txtTimeOut" runat="server" Height="19px" Width="34px" placeholder="20"></asp:TextBox>
        &nbsp;minutes.<br />
            <br />
            <asp:RequiredFieldValidator ID="rfUsername" runat="server" CssClass="auto-style1" ErrorMessage="Username is mandatory." ControlToValidate="txtLogin"></asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="rfPass" runat="server" CssClass="auto-style1" ErrorMessage="Password is mandatory." ControlToValidate="txtPass"></asp:RequiredFieldValidator>
        </div>
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>      
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>  
        <footer>
            <asp:LinkButton ID="lbAdmin" runat="server" OnClick="lbAdmin_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Admin Login</asp:LinkButton>
        </footer>
    </div>
    </form>
</body>
</html>

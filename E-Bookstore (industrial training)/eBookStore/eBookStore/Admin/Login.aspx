<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Primary.css" />
    <link rel="stylesheet" href="../CSS/Login.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="MainColoumn">    
        <section class="headerSec">
                <div id ="headerLinks">
                    <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Home</asp:LinkButton>
                   
                    &nbsp;&nbsp;</div>
                <h1>The eBook Store.</h1>
                Welcome Admin.</section>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div id="innerLogin">
        <asp:TextBox ID="txtLogin" runat="server" placeholder="Login" CssClass="loginInput"></asp:TextBox>
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
        <asp:Label ID="lblMsg" runat="server"></asp:Label>      
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>  
    </div>
    </form>
</body>
</html>

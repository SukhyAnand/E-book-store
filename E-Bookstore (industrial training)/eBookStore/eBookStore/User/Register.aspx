<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="User_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Primary.css" />
    <link rel="stylesheet" href="../CSS/InputPage.css" />
    <style type="text/css">
        .auto-style1 {
            color: #FF3300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="MainColoumn">
    <section class ="headerSec">
            <div id="headerLinks">
                    <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click" Font-Bold="True" Font-Underline="False" ForeColor="White" CausesValidation="False">Home</asp:LinkButton>
                    &nbsp;&nbsp;</div>    
            <h1>The eBook Store.</h1>
            Welcome.<br />
        </section>
        <br />
        <div class="centerContainer">
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLogin" CssClass="auto-style1" ErrorMessage="Username is mandatory."></asp:RequiredFieldValidator>
            <br class="auto-style1" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPass" CssClass="auto-style1" ErrorMessage="Password is mandatory."></asp:RequiredFieldValidator>
            <br class="auto-style1" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtrePass" ControlToValidate="txtPass" CssClass="auto-style1" ErrorMessage="Passwords do not match."></asp:CompareValidator>
            <br class="auto-style1" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContact" CssClass="auto-style1" ErrorMessage="Contact is mandatory."></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
        <asp:TextBox ID="txtName" runat="server" CssClass="textInputAlt" placeholder="Full Name"></asp:TextBox>
            <br />
        <br />
        <asp:TextBox ID="txtLogin" runat="server" CssClass="textInputAlt" placeholder="Email ID"></asp:TextBox>
            <br />
        <br />
        <asp:TextBox ID="txtPass" runat="server" CssClass="textInputAlt" placeholder="Password" TextMode="Password"></asp:TextBox>
            <br />
            <br />
        <asp:TextBox ID="txtrePass" runat="server" CssClass="textInputAlt" placeholder="Retype Password" TextMode="Password"></asp:TextBox>
            <br />
        <br />
        <asp:TextBox ID="txtContact" runat="server" CssClass="textInputAlt" placeholder="Contact Number"></asp:TextBox>
            <br />
            <br />
            <br />
        <asp:Button ID="btnReg" runat="server" OnClick="btnReg_Click" Text="Register" CssClass="btnInput" />
        </div>
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    
        <br />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <footer>
            <asp:LinkButton ID="lbAdmin" runat="server" OnClick="lbAdmin_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Admin Login</asp:LinkButton>
        </footer>  
    </div>
    </form>
</body>
</html>

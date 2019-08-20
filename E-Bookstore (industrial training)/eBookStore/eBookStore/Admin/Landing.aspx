<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Landing.aspx.cs" Inherits="Admin_Landing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../CSS/Primary.css" />
    <link rel="stylesheet" href="../CSS/AdminControls.css" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <section class="headerSec">
            <div id="headerLinks">
                <asp:LinkButton ID="lbHome" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="White" PostBackUrl="~/Home.aspx">Home</asp:LinkButton>
                &nbsp;&nbsp;|
                <asp:LinkButton ID="lbLogOut" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="White" OnClick="lbLogOut_Click">Log Out</asp:LinkButton>
            </div>
            <h1>The eBook Store.</h1>
            Welcome
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            .
        </section>
        <div class="crudinner">
            <table class="auto-style1">
                <tr>
                    <td style="vertical-align: middle; text-align: center">
                        <h1>Please select an action to continue.</h1>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; text-align: center">
                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="Brown" PostBackUrl="~/Admin/CRUD/Auth.aspx">Add/Edit Authors</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; text-align: center">
                        <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="Brown" PostBackUrl="~/Admin/CRUD/Cat.aspx">Add/Edit Categories</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; text-align: center">
                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="Brown" PostBackUrl="~/Admin/CRUD/Title.aspx">Add/Edit Titles</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; text-align: center">
                        <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="Brown" PostBackUrl="~/Admin/CRUD/Rev.aspx">Manage Reviews</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: middle; text-align: center">
                        <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="Brown" PostBackUrl="~/Admin/UploadWiz/SelectTitle.aspx">Upload Wizard</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    
    </div>
    </form>
</body>
</html>

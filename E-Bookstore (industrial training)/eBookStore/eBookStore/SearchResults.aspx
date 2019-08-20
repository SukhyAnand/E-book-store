<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="SearchResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Primary.css" />
</head>
<body>
    <form id="form1" runat="server">
   <div id="MainColoumn">
        <section class ="headerSec">
            <div id="headerLinks">
                <asp:LinkButton ID="lbLogin" runat="server" OnClick="lbLogin_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Log In</asp:LinkButton>
                &nbsp;<asp:LinkButton ID="lbReg" runat="server" OnClick="lbReg_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Register</asp:LinkButton>
                &nbsp;<asp:LinkButton ID="lbAcc" runat="server" OnClick="lbAcc_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">My Account</asp:LinkButton>
                &nbsp;<asp:LinkButton ID="lbLogOut" runat="server" OnClick="lbLogOut_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Log Out</asp:LinkButton>
                &nbsp;<asp:LinkButton ID="lbCart" runat="server" OnClick="lbCart_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Cart</asp:LinkButton>
            </div>    
            <h1>The eBook Store.</h1>
            You are signed in
             as
            <asp:Label ID="lblMsg" runat="server" Text="Anonymous"></asp:Label>
            <br />
        </section>
        <br />
        <div id="SearchContainer">
            Search in
                    <asp:DropDownList ID="ddlCategories" runat="server">
                        <asp:ListItem Selected="True" Value="0">Authors</asp:ListItem>
                        <asp:ListItem Value="1">Titles</asp:ListItem>
                        <asp:ListItem Value="2">Categories</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
        </div>            
        <br />    
        <div id="SearchResContainer">
        <h4>Search Results</h4>
        <asp:GridView ID="gvSearchResults" runat="server" OnRowDataBound="gvSearchResults_RowDataBound" AllowPaging="True" PageSize="4">
        </asp:GridView>    
        </div>
        <br /> 
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>    
        <footer>
            <asp:LinkButton ID="lbAdmin" runat="server" OnClick="lbAdmin_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Admin Login</asp:LinkButton>
        </footer>            
    </div>
    </form>
</body>
</html>

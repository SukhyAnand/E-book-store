<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="User_Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Primary.css" />
    <link rel="stylesheet" href="../CSS/Inputpage.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="MainColoumn">
    <section class ="headerSec">
            <div id="headerLinks">
                <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Home</asp:LinkButton>
                &nbsp;<asp:LinkButton ID="lbAcc" runat="server" OnClick="lbAcc_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">My Account</asp:LinkButton>
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
            <h3>Purchase History</h3>     
        <asp:ListBox ID="lbBills" runat="server" AutoPostBack="True" Width="100%"></asp:ListBox>
        <hr><br />
            <h3>Bill Details</h3>
        Amount:<asp:Label ID="lblAmt" runat="server"></asp:Label>            
            <br />
        Date:<asp:Label ID="lblDate" runat="server"></asp:Label>        
            <h3>Titles Purchased</h3>
&nbsp;<asp:GridView ID="gvTitles" runat="server" OnRowDataBound="gvTitles_RowDataBound" Width="100%">
        </asp:GridView>
    
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

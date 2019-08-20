<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TitleDetails.aspx.cs" Inherits="TitleDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Primary.css" />
    <link rel="stylesheet" href="CSS/TitleDetails.css" />
    <style type="text/css">
        .auto-style2 {
            color: #666666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="MainColoumn">
            <section class="headerSec">
                <div id ="headerLinks">
                    <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Home</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbLogin" runat="server" OnClick="lbLogin_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Log In</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbReg" runat="server" OnClick="lbReg_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Register</asp:LinkButton>
                    <asp:LinkButton ID="lbAcc" runat="server" OnClick="lbAcc_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">My Account</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbLogOut" runat="server" OnClick="lbLogOut_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Log Out</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbCart" runat="server" OnClick="lbCart_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Cart</asp:LinkButton>
                </div>
                <h1>The eBook Store.</h1>
                You are logged in as <asp:Label ID="lblMsg" runat="server">Anonymous</asp:Label>
            </section>
                <br />
                <div id="TitleDetailsContainer">
                    <div id="imageContainer">
                        Product details for
                
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Image ID="imgCover" runat="server" Width="80%" />
                    </div>
                    <div id="detailsContainer">
                        <br />
                        <asp:Label ID="lblTitleBig" runat="server"></asp:Label>
                        <br />
                        by
                <asp:Label ID="lblAuthList" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblCatList" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblDesc" runat="server" Text="Description appears here."></asp:Label>
                        <br />
                        <table class="detailsTable">
                            <tr>
                                <td>Price:</td>
                                <td>
                                    <asp:Label ID="lblPrice" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Edition:</td>
                                <td>
                                    <asp:Label ID="lblEdition" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>ISBN:</td>
                                <td>
                                    <asp:Label ID="lblISBN" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Pages:</td>
                                <td>
                                    <asp:Label ID="lblPages" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Publishing Year:</td>
                                <td>
                                    <asp:Label ID="lblPubDate" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Downloads:</td>
                                <td>
                                    <asp:Label ID="lblDownloads" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>File Format:</td>
                                <td>
                                    <asp:Label ID="lblFormat" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <br />

            <div id="lowerDiv">
                <div id="innerLowerDiv">
                    <asp:TextBox ID="txtRev" runat="server" placeholder="Add a review..."></asp:TextBox>
                    <asp:Button ID="btnAddrev" runat="server" Text="Post" OnClick="btnAddrev_Click" />
                    <asp:RadioButtonList ID="radRating" runat="server" RepeatDirection="Horizontal" TextAlign="Left" OnSelectedIndexChanged="radRating_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:RadioButtonList>
                    <h4>
                        <asp:Label ID="lbRating" runat="server"></asp:Label>
                        /5</h4>
                   <h5><span class="auto-style2">(Rated
                    by </span>
                        <asp:Label ID="lbRatingCount" runat="server" CssClass="auto-style2"></asp:Label>
                        <span class="auto-style2">&nbsp;people)</span></h5>
                </div id="innerLowerDiv">
                <asp:GridView ID="gvReviews" runat="server" OnRowDataBound="gvReviews_RowDataBound" OnSelectedIndexChanged="gvReviews_SelectedIndexChanged">
                </asp:GridView>
                <asp:Button ID="btnCart" runat="server" Text="      Add To Cart" OnClick="btnCart_Click" />
                &nbsp;
                <asp:Label ID="lblCartStat" runat="server"></asp:Label>
            </div>

                <asp:Label ID="lblErr" runat="server"></asp:Label>

            <br />
            <footer>
            <asp:LinkButton ID="lbAdmin" runat="server" OnClick="lbAdmin_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Admin Login</asp:LinkButton>
            </footer>

        </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/UploadWiz/UploadWizMaster.master" AutoEventWireup="true" CodeFile="UploadSummary.aspx.cs" Inherits="Admin_UploadWiz_UploadSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
    <div id="MainColoumn">
        <section class="headerSec">
            <div id="headerLinks">
                <asp:LinkButton ID="lbHome" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="White" PostBackUrl="~/Home.aspx">Home</asp:LinkButton>
                &nbsp;|
                    <asp:LinkButton ID="lbLanding" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="White" PostBackUrl="~/Admin/Landing.aspx">Landing</asp:LinkButton>
                &nbsp;|
                    <asp:LinkButton ID="lbLogOut" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="White" OnClick="lbLogOut_Click">Log Out</asp:LinkButton>
            </div>
            <h1>The eBook Store.</h1>
            Welcome
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            .
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
        <asp:Button ID="btnNew" runat="server" OnClick="btnNew_Click" Text="New Upload" />
                    <asp:Button ID="btnFin" runat="server" OnClick="btnFin_Click" Text="Go to Landing Page" />
                </div
        <br />
        <br />
        &nbsp;<br />
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
        <br />

    </div id="MainColoumn">        </asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/UploadWiz/UploadWizMaster.master" AutoEventWireup="true" CodeFile="SelectTitle.aspx.cs" Inherits="Admin_UploadWiz_SelectTitle" %>

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
        <div class="wizardinner">

        <br />
        Select Title to proceed<br />
        <asp:ListBox ID="lbTitle" runat="server" Width="321px"></asp:ListBox>
        <br />
        <asp:Button ID="btnLand" runat="server" OnClick="btnLand_Click" Text="&lt; Back" CssClass="btnPrev" />
        <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="Next &gt;" CssClass="btnNext" />
        </div>
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>


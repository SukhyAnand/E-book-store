<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/UploadWiz/UploadWizMaster.master" AutoEventWireup="true" CodeFile="ImageUpload.aspx.cs" Inherits="Admin_UploadWiz_ImageUpload" %>

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
            Upload the image file for
        <asp:Label ID="lblTitle" runat="server"></asp:Label>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;<asp:Button ID="btnUpld" runat="server" Text="Upload" OnClick="btnUpld_Click" CssClass="btnGeneric" />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text="Browse for a file and click Upload."></asp:Label>
            <br />
            &nbsp;<asp:Button ID="btnPrev" runat="server" OnClick="btnprev_Click" Text="&lt; Back" CssClass="btnPrev" />
            <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="Next &gt;" Enabled="False" CssClass="btnNext" />
        </div>
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>


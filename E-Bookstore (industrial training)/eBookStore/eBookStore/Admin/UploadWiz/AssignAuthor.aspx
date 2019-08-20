﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/UploadWiz/UploadWizMaster.master" AutoEventWireup="true" CodeFile="AssignAuthor.aspx.cs" Inherits="Admin_UploadWiz_AssignAuthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="MainColoumn">
        <section class="headerSec">
            <div id="headerLinks">
                <asp:LinkButton ID="lbHome" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="White" PostBackUrl="~/Home.aspx">Home</asp:LinkButton>
                &nbsp;|
                <asp:LinkButton ID="lbLanding" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="White" PostBackUrl="~/Admin/Landing.aspx">Landing</asp:LinkButton>
                &nbsp;|
                <asp:LinkButton ID="lbLogOut" runat="server" OnClick="lbLogOut_Click" Font-Bold="True" Font-Underline="False" ForeColor="White">Log Out</asp:LinkButton>
            </div>
            <h1>The eBook Store.</h1>
            Welcome
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
            .
        </section>
        <br />
        <div class="wizardinner">
            Assign or delete authors for
        <asp:Label ID="lblTitle" runat="server"></asp:Label>
            <br />
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <h3>Add author:</h3>
            <asp:DropDownList ID="ddlAllAuth" runat="server">
            </asp:DropDownList>
            &nbsp;<asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" CssClass="btnGeneric" />
            <br />
            <br />
                        <h3>Delete author:</h3>
            <asp:DropDownList ID="ddlSelAuth" runat="server">
            </asp:DropDownList>
            &nbsp;<asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="Delete" CssClass="btnGeneric" />
                    </td>
                    <td>
            <asp:GridView ID="gvAuth" runat="server">
            </asp:GridView>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnPrev" runat="server" OnClick="btnprev_Click" Text="&lt; Back" CssClass="btnPrev" />
            <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="Next &gt;" CssClass="btnNext" />
        </div>
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>

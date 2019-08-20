<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/CRUD/CRUDMaster.master" AutoEventWireup="true" CodeFile="Rev.aspx.cs" Inherits="Admin_CRUD_Rev" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 250px;
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
        <div class="crudinner">
            <h3>Manage Reviews</h3>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" style="vertical-align: middle; text-align: right">
        <asp:ListBox ID="lbTitle" runat="server" AutoPostBack="True" Width="100%"></asp:ListBox>
                    </td>
                    <td style="vertical-align: middle; text-align: center">
        <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="Show Reviews &gt;" CssClass="btnGeneric" Width="250px" />
                    </td>
                    <td class="auto-style2" style="vertical-align: middle; text-align: left">
        <asp:ListBox ID="lbRev" runat="server" Width="100%"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="vertical-align: middle; text-align: right">&nbsp;</td>
                    <td style="vertical-align: middle; text-align: center">&nbsp;</td>
                    <td class="auto-style2" style="vertical-align: middle; text-align: left">
        <asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="Delete" CssClass="btnGeneric" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
        <br />
    </div id="MainColoumn">
</asp:Content>


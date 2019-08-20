<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/CRUD/CRUDMaster.master" AutoEventWireup="true" CodeFile="Title.aspx.cs" Inherits="Admin_CRUD_Title" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 30px;
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
        <br />
        <div class="crudinner">
            <h3>Manage Titles</h3>
            <br />
            <asp:GridView ID="gvTitle" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <table class="auto-style1">
                <tr>
                    <td style="text-align: right">Select Existing:</td>
                    <td>
        <asp:DropDownList ID="ddlTitle" runat="server">
        </asp:DropDownList>
            &nbsp;<asp:Button ID="btnFill" runat="server" OnClick="btnFill_Click" Text="Fill" CssClass="btnGeneric" />
            &nbsp;<asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="Delete" CssClass="btnGeneric" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Name:</td>
                    <td>
        <asp:TextBox ID="txtName" runat="server" CssClass="inputGeneric"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Description:</td>
                    <td>
        <asp:TextBox ID="txtDesc" runat="server" Height="69px" TextMode="MultiLine" Width="121px" CssClass="inputGeneric"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Edition:</td>
                    <td> 
    <asp:TextBox ID="txtEd" runat="server" CssClass="inputGeneric"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">ISBN:</td>
                    <td>
        <asp:TextBox ID="txtISBN" runat="server" CssClass="inputGeneric"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Pages:</td>
                    <td>
        <asp:TextBox ID="txtPgs" runat="server" CssClass="inputGeneric"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Publishing Date:</td>
                    <td>
        <asp:TextBox ID="txtPubDate" runat="server" CssClass="inputGeneric"></asp:TextBox>
            <cc1:CalendarExtender ID="txtPubDate_CalendarExtender" runat="server" BehaviorID="txtPubDate_CalendarExtender" TargetControlID="txtPubDate" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Price:</td>
                    <td>
        <asp:TextBox ID="txtPrice" runat="server" CssClass="inputGeneric"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">File Format:</td>
                    <td>
        <asp:DropDownList ID="ddlFormat" runat="server">
            <asp:ListItem Selected="True">PDF</asp:ListItem>
            <asp:ListItem Value="EPUB">ePub</asp:ListItem>
            <asp:ListItem>Mobi</asp:ListItem>
            <asp:ListItem Value="DJVU">djVu</asp:ListItem>
            <asp:ListItem>CBR</asp:ListItem>
        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right"></td>
                    <td class="auto-style2">
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add New" CssClass="btnGeneric" />
            &nbsp;<asp:Button ID="btnUpdt" runat="server" OnClick="btnUpdt_Click" Text="Update" CssClass="btnGeneric" />
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;</div>
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
        <br />
    </div id="MainColoumn">            </asp:Content>


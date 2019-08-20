<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/CRUD/CRUDMaster.master" AutoEventWireup="true" CodeFile="Cat.aspx.cs" Inherits="Admin_CRUD_Cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id ="MainColoumn">
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
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
            <asp:GridView ID="gvCat" runat="server">
            </asp:GridView>
                    </td>
                    <td>
                        <h4>Add:</h4>
&nbsp;<asp:TextBox ID="txtAdd" runat="server" CssClass="inputGeneric"></asp:TextBox>
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" CssClass="btnGeneric" placeholder="Category Name"/>
            <br />
                        <h4>Select:</h4>
&nbsp;<asp:DropDownList ID="ddlCat" runat="server">
        </asp:DropDownList>
            &nbsp;<asp:Button ID="btnFill" runat="server" OnClick="btnFill_Click" Text="Fill" CssClass="btnGeneric" />
                        <asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="Delete" CssClass="btnGeneric" />
                        <br />
                        <h4>Edit</h4>
                        <asp:TextBox ID="txtUpdt" runat="server" CssClass="inputGeneric" placeholder="Category Name"></asp:TextBox>
            &nbsp;&nbsp;<asp:Button ID="btnUpdt" runat="server" OnClick="btnUpdt_Click" Text="Update" CssClass="btnGeneric" />
            &nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        <br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
        <br />
    </div id ="MainColoumn">         </asp:Content>


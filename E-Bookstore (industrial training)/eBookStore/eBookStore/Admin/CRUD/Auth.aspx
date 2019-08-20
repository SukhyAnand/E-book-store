<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/CRUD/CRUDMaster.master" AutoEventWireup="true" CodeFile="Auth.aspx.cs" Inherits="Admin_CRUD_Auth" %>

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
        <div class="crudinner">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>
                        <h3>Enlisted Authors</h3>
                        <asp:GridView ID="gvAuth" runat="server">
                        </asp:GridView>
                    </td>
                    <td>
                        <h4>Add:</h4>
                        <asp:TextBox ID="txtAddFname" runat="server" CssClass="inputGeneric" placeholder="First Name"></asp:TextBox>
                        &nbsp;<asp:TextBox ID="txtAddLName" runat="server" CssClass="inputGeneric" placeholder="Last Name"></asp:TextBox>
                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" CssClass="btnGeneric" />
                        <br />
                        <h4>Select:</h4>
                        <asp:DropDownList ID="ddlAuth" runat="server">
    </asp:DropDownList>
        &nbsp;<asp:Button ID="btnFill" runat="server" OnClick="btnFill_Click" Text="Fill" CssClass="btnGeneric" />
        &nbsp;<asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="Delete" CssClass="btnGeneric" />
                        <br />
                        <h4>Edit:
                        </h4><asp:TextBox ID="txtUpdtFName" runat="server" CssClass="inputGeneric" placeholder="First Name"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="txtUpdtLName" runat="server" CssClass="inputGeneric" placeholder="Last Name"></asp:TextBox>
        <asp:Button ID="btnUpdt" runat="server" OnClick="btnUpdt_Click" Text="Update" CssClass="btnGeneric" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        &nbsp;&nbsp;<br />
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div id="MainColoumn">
</asp:Content>


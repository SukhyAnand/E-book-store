using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    eBookStoreDBModelContainer ebs;
    public void AuthenticateUser()
    {
        try
        {
            lblMsg.Text = Session["eStoreUser"].ToString();
            lbAcc.Visible = true;
            lbLogOut.Visible = true;
            lbReg.Visible = false;
            lbLogin.Visible = false;
            lbCart.Visible = true;
            if (Session["eStoreCart"]!=null)
            {
                List<Title> cartItems = (List<Title>)Session["eStoreCart"];
                int cartCount = cartItems.Count();
                lbCart.Text = "Cart(" + cartCount + ")";
            }
        }
        catch (Exception)
        {
            lbAcc.Visible = false;
            lbLogOut.Visible = false;
            lbReg.Visible = true;
            lbLogin.Visible = true;
            lbCart.Visible = false;
        }
    }
    
    private void GenData()
    {
        var query = (from ttl in ebs.Titles
                     where ttl.Status==1                   
                     select ttl).Distinct();
        List<Title> ttl_lst = query.ToList();
        List<SearchResultItem> tr_lst = new List<SearchResultItem>();
        SearchResultItem tr;
        foreach (Title item in ttl_lst)
        {
            tr = new SearchResultItem(item);
            tr_lst.Add(tr);
        }
        gvSearchResults.DataSource = tr_lst;
        gvSearchResults.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
            AuthenticateUser();
            GenData();
   
    }
    protected void lbLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Login.aspx");
    }
    protected void lbReg_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Register.aspx");
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.AddHeader("REFRESH", "0");
    }
    protected void lbAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin/Login.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        String q = txtSearch.Text.Trim();
        String n = ddlCategories.SelectedIndex.ToString();
        Response.Redirect("SearchResults.aspx?q=" + q + "&n=" + n);
    }
    protected void lbAcc_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Account.aspx");
    }
    protected void lbCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Checkout.aspx");
    }
    protected void gvSearchResults_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell cell in e.Row.Cells)
        {
            cell.Text = Server.HtmlDecode(cell.Text);
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Width = Unit.Percentage(15);
            e.Row.Cells[1].Width = Unit.Percentage(85);            
        }
    }

}
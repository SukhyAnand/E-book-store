using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UploadWiz_AssignAuthor : System.Web.UI.Page
{
    eBookStoreDBModelContainer ebs;
    private void AuthUser()
    {
        try
        {
            lblMsg.Text = Session["eStoreAdmin"].ToString();
        }
        catch (Exception)
        {
            Response.Redirect("../Login.aspx");
        }
    }
    public void GenData()
    {
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        var query = from a in ebs.Authors
                    select new
                    {
                        a.AuthorId,
                        Name = string.Concat(a.FirstName, " ", a.LastName)
                    };
        ddlAllAuth.DataSource = query.ToList().OrderBy(a => a.Name);
        ddlAllAuth.DataTextField = "Name";
        ddlAllAuth.DataValueField = "AuthorId";
        ddlAllAuth.DataBind();

        var query1 = from au in ebs.Authors
                     from ttl in au.Titles
                     where ttl.TitleId == TitleId
                     select new
                     {
                         au.AuthorId,
                         Name = string.Concat(au.FirstName, " ", au.LastName)
                     };
        ddlSelAuth.DataSource = query1.ToList().OrderBy(a => a.Name);
        ddlSelAuth.DataTextField = "Name";
        ddlSelAuth.DataValueField = "AuthorId";
        ddlSelAuth.DataBind();

        var query2 = from au in ebs.Authors
                     from ttl in au.Titles
                     where ttl.TitleId == TitleId
                     select new
                     {
                         Name = string.Concat(au.FirstName, " ", au.LastName)
                     };
        gvAuth.DataSource = query2.ToList().OrderBy(n => n.Name);
        gvAuth.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        AuthUser();

        try
        {
            if (!IsPostBack)
            {
                GenData();
            }
            int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
            Title t = ebs.Titles.SingleOrDefault(a => a.TitleId == TitleId);
            lblTitle.Text = t.TitleName + " " + t.Edition + " edition.";
        }
        catch (Exception ex)
        {
            lblTitle.Text = "Undefined.";
            lblErr.Text = ex.Message;
            lblErr.Text += "<br> You probably arrived to this page directly.";
        }

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (ddlSelAuth.Items.Count != 0)
        {
            string TitleId = Request.QueryString["TitleId"];
            Response.Redirect("AssignCategory.aspx?TitleId=" + TitleId);
        }
        else
        {
            lblErr.Text = "Select at least one author.";
        }
    }
    protected void btnprev_Click(object sender, EventArgs e)
    {
        Response.Redirect("SelectTitle.aspx?=");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int AuthorId = Int32.Parse(ddlAllAuth.SelectedItem.Value);
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        Author au = ebs.Authors.Single(a => a.AuthorId == AuthorId);
        Title t = ebs.Titles.SingleOrDefault(a => a.TitleId == TitleId);
        t.Authors.Add(au);
        ebs.SaveChanges();
        GenData();
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        int AuthorId = Int32.Parse(ddlSelAuth.SelectedItem.Value);
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        Author a = ebs.Authors.SingleOrDefault(au => au.AuthorId == AuthorId);
        Title t = ebs.Titles.SingleOrDefault(ttl => ttl.TitleId == TitleId);
        a.Titles.Remove(t);
        ebs.SaveChanges();
        GenData();
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
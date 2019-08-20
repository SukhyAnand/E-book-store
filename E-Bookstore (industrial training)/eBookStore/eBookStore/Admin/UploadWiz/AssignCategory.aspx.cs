using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UploadWiz_AssignCategory : System.Web.UI.Page
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
        var query = from c in ebs.Categories
                    select new
                    {
                        c.CategoryId,
                        c.CategoryName
                    };
        ddlAllCat.DataSource = query.ToList().OrderBy(a => a.CategoryName);
        ddlAllCat.DataTextField = "CategoryName";
        ddlAllCat.DataValueField = "CategoryId";
        ddlAllCat.DataBind();

        var query1 = from c in ebs.Categories
                     from ttl in c.Titles
                     where ttl.TitleId == TitleId
                     select new
                     {
                         c.CategoryId,
                         c.CategoryName
                     };
        ddlSelCat.DataSource = query1.ToList().OrderBy(a => a.CategoryName);
        ddlSelCat.DataTextField = "CategoryName";
        ddlSelCat.DataValueField = "CategoryId";
        ddlSelCat.DataBind();

        var query2 = from c in ebs.Categories
                     from ttl in c.Titles
                     where ttl.TitleId == TitleId
                     select new
                     {
                         c.CategoryName
                     };
        gvCat.DataSource = query2.ToList().OrderBy(n => n.CategoryName);
        gvCat.DataBind();
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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int CatId = Int32.Parse(ddlAllCat.SelectedItem.Value);
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == TitleId);
        Category cat = ebs.Categories.SingleOrDefault(c => c.CategoryId == CatId);
        ttl.Categories.Add(cat);
        ebs.SaveChanges();
        GenData();
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        int CatId = Int32.Parse(ddlSelCat.SelectedItem.Value);
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == TitleId);
        Category cat = ebs.Categories.SingleOrDefault(c => c.CategoryId == CatId);
        ttl.Categories.Remove(cat);
        ebs.SaveChanges();
        GenData();
    }
    protected void btnprev_Click(object sender, EventArgs e)
    {
        string TitleId = Request.QueryString["TitleId"];
        Response.Redirect("AssignAuthor.aspx?TitleId=" + TitleId);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (ddlSelCat.Items.Count != 0)
        {
            string TitleId = Request.QueryString["TitleId"];
            Response.Redirect("FileUpload.aspx?TitleId=" + TitleId);
        }
        else
        {
            lblErr.Text = "Select at least one category";
        }
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
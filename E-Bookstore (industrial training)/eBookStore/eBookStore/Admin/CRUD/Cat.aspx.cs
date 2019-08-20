using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CRUD_Cat : System.Web.UI.Page
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
        try
        {
            var query = from a in ebs.Categories
                        select a;
            gvCat.DataSource = query.ToList();
            gvCat.DataBind();
            ddlCat.DataSource = query.ToList().OrderBy(a => a.CategoryName);
            ddlCat.DataValueField = "CategoryID";
            ddlCat.DataTextField = "CategoryName";
            ddlCat.DataBind();
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        AuthUser();
        if (!IsPostBack)
        {
            GenData();
        }
        try
        {
            if (!IsPostBack)
            {
                lblMsg.Text = Session["eStoreAdmin"].ToString();
            }
        }
        catch (Exception)
        {
            Response.Redirect("../Login.aspx");
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Category c = new Category();
            c.CategoryName = txtAdd.Text;
            ebs.Categories.Add(c);
            ebs.SaveChanges();
            GenData();
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
        }
    }
    protected void btnFill_Click(object sender, EventArgs e)
    {
        try
        {
            int catid = Int32.Parse(ddlCat.SelectedValue);
            Category cat = ebs.Categories.SingleOrDefault(c => c.CategoryId == catid);
            txtUpdt.Text = cat.CategoryName;
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
        }
    }
    protected void btnUpdt_Click(object sender, EventArgs e)
    {
        try
        {
            int catid = Int32.Parse(ddlCat.SelectedValue);
            Category cat = ebs.Categories.SingleOrDefault(c => c.CategoryId == catid);
            cat.CategoryName = txtUpdt.Text;
            ebs.SaveChanges();
            GenData();
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        try
        {
            int catid = Int32.Parse(ddlCat.SelectedValue);
            Category cat = ebs.Categories.SingleOrDefault(c => c.CategoryId == catid);
            if (cat != null)
            {
                ebs.Categories.Remove(cat);
                ebs.SaveChanges();
                GenData();
            }
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
        }
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void lbLanding_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Landing.aspx");
    }
}
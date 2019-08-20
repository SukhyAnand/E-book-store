using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CRUD_Auth : System.Web.UI.Page
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
            var query = from a in ebs.Authors
                        select a;
            gvAuth.DataSource = query.ToList();
            gvAuth.DataBind();

            var query1 = from au in ebs.Authors
                         select new
                         {
                             au.AuthorId,
                             Name = string.Concat(au.FirstName, " ", au.LastName)
                         };
            ddlAuth.DataSource = query1.ToList().OrderBy(a => a.Name);
            ddlAuth.DataValueField = "AuthorId";
            ddlAuth.DataTextField = "Name";
            ddlAuth.DataBind();
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
            Author au = new Author();
            au.FirstName = txtAddFname.Text;
            au.LastName = txtAddLName.Text;
            ebs.Authors.Add(au);
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
            int authid = Int32.Parse(ddlAuth.SelectedItem.Value);
            Author au = ebs.Authors.SingleOrDefault(a => a.AuthorId == authid);
            if (au != null)
            {
                ebs.Authors.Remove(au);
                ebs.SaveChanges();
                GenData();
            }
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
            int authid = Int32.Parse(ddlAuth.SelectedItem.Value);
            Author au = ebs.Authors.SingleOrDefault(a => a.AuthorId == authid);
            if (au != null)
            {
                txtUpdtFName.Text = au.FirstName;
                txtUpdtLName.Text = au.LastName;
            }
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
            int authid = Int32.Parse(ddlAuth.SelectedItem.Value);
            Author au = ebs.Authors.SingleOrDefault(a => a.AuthorId == authid);
            au.FirstName = txtUpdtFName.Text;
            au.LastName = txtUpdtLName.Text;
            ebs.SaveChanges();
            GenData();
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
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CRUD_Title : System.Web.UI.Page
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
            var query = from a in ebs.Titles
                        select a;
            gvTitle.DataSource = query.ToList();
            gvTitle.DataBind();
            var query1 = from a in ebs.Titles
                         select new
                         {
                             a.TitleId,
                             Name = string.Concat(a.TitleName, " (", a.Edition, ") ")
                         };
            ddlTitle.DataSource = query1.ToList().OrderBy(a => a.Name);
            ddlTitle.DataTextField = "Name";
            ddlTitle.DataValueField = "TitleId";
            ddlTitle.DataBind();
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
            Title ttl = new Title();
            ttl.TitleName = txtName.Text;
            ttl.TitleDescription = txtDesc.Text;
            ttl.Edition = txtEd.Text;
            ttl.ISBN = txtISBN.Text;
            ttl.Pages = Int32.Parse(txtPgs.Text);
            ttl.PubDate = Convert.ToDateTime(txtPubDate.Text);
            ttl.Rating = 0;
            ttl.RatingCount = 0;
            ttl.DownloadCount = 0;
            ttl.Status = 0;
            ttl.FileFormat = ddlFormat.SelectedValue;
            ttl.Price = Decimal.Parse(txtPrice.Text);
            ebs.Titles.Add(ttl);
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
            int tid = Int32.Parse(ddlTitle.SelectedValue);
            Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == tid);
            txtName.Text = ttl.TitleName;
            txtDesc.Text = ttl.TitleDescription;
            txtEd.Text = ttl.Edition;
            txtISBN.Text = ttl.ISBN.ToString();
            txtPgs.Text = ttl.Pages.ToString();
            txtPubDate.Text = ttl.PubDate.ToShortDateString();
            txtPrice.Text = ttl.Price.ToString();
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
            int tid = Int32.Parse(ddlTitle.SelectedValue);
            Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == tid);
            ttl.TitleName = txtName.Text;
            ttl.TitleDescription = txtDesc.Text;
            ttl.Edition = txtEd.Text;
            ttl.ISBN = txtISBN.Text;
            ttl.Pages = Int32.Parse(txtPgs.Text);
            ttl.PubDate = Convert.ToDateTime(txtPubDate.Text);
            ttl.FileFormat = ddlFormat.SelectedValue;
            ttl.Price = Decimal.Parse(txtPrice.Text);
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
            int tid = Int32.Parse(ddlTitle.SelectedValue);
            Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == tid);
            ebs.Titles.Remove(ttl);
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
    protected void lbLanding_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Landing.aspx");
    }
}
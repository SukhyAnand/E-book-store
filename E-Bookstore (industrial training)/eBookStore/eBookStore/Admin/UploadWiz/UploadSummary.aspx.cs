using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UploadWiz_UploadSummary : System.Web.UI.Page
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

    protected void FillPage()
    {
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        imgCover.ImageUrl = "../../Storage/Images/" + TitleId.ToString() + ".png";
        Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == TitleId);
        lblTitleBig.Text = ttl.TitleName;
        lblDesc.Text = ttl.TitleDescription;
        lblEdition.Text = ttl.Edition;
        lblFormat.Text = ttl.FileFormat;
        lblISBN.Text = ttl.ISBN.ToString();
        lblPages.Text = ttl.Pages.ToString();
        lblPrice.Text = ttl.Price.ToString();

        //get list of authors as string
        var queryAuthList = from au in ebs.Authors
                            from t in au.Titles
                            where t.TitleId == TitleId
                            select string.Concat(au.FirstName, " ", au.LastName);

        lblAuthList.Text = String.Join(", ", queryAuthList);

        //get list of categories as string
        var queryCatList = from cat in ebs.Categories
                           from t in cat.Titles
                           where t.TitleId == TitleId
                           select cat.CategoryName;

        lblCatList.Text = String.Join(", ", queryCatList);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        AuthUser();
        try
        {
            int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
            Title t = ebs.Titles.SingleOrDefault(a => a.TitleId == TitleId);
            t.Status = 1;
            ebs.SaveChanges();
            lblTitle.Text = t.TitleName + " " + t.Edition + " edition.";
            FillPage();
        }
        catch (Exception ex)
        {
            lblTitle.Text = "Undefined.";
            lblErr.Text = ex.Message;
            lblErr.Text += "<br> You probably arrived to this page directly.";
        }

    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("SelectTitle.aspx");
    }
    protected void btnFin_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Landing.aspx");
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
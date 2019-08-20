using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UploadWiz_ImageUpload : System.Web.UI.Page
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
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        AuthUser();
        try
        {
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
        string TitleId = Request.QueryString["TitleId"];
        Response.Redirect("UploadSummary.aspx?TitleId=" + TitleId);
    }
    protected void btnprev_Click(object sender, EventArgs e)
    {
        string TitleId = Request.QueryString["TitleId"];
        Response.Redirect("FileUpload.aspx?TitleId=" + TitleId);
    }

    protected void btnUpld_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.HasFile)
            {
                string TitleId = Request.QueryString["TitleId"];
                string dirpath = Server.MapPath("../../Storage/Images/");
                string filename = FileUpload1.FileName;
                string ext = System.IO.Path.GetExtension(filename);
                string _filename = TitleId + ext;
                FileUpload1.SaveAs(dirpath + _filename);
                btnNext.Enabled = true;
                lblStatus.Text = "File uploaded successfully. Click next to proceed.";
            }
            else
            {
                lblStatus.Text = "Please specify a file to upload.";
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
}
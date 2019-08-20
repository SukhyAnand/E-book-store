using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UploadWiz_SelectTitle : System.Web.UI.Page
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
        var query = from a in ebs.Titles
                    select new
                    {
                        a.TitleId,
                        Name = string.Concat(a.TitleName, " (", a.Edition, ") ")
                    };
        lbTitle.DataSource = query.ToList().OrderBy(a => a.Name);
        lbTitle.DataTextField = "Name";
        lbTitle.DataValueField = "TitleId";
        lbTitle.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        AuthUser();
        if (!IsPostBack)
        {
            GenData();
        }
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        try
        {
            string TitleId = lbTitle.SelectedItem.Value;
            Response.Redirect("AssignAuthor.aspx?TitleId=" + TitleId);
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
            lblErr.Text += "<br>Probably there are no titles added yet or nothing has been selected.";
        }
    }
    protected void btnLand_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Landing.aspx");
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
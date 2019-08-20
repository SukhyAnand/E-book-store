using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CRUD_Rev : System.Web.UI.Page
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
    private void GenDataOuter()
    {
        // populate titiles list box
        var queryTitles = from t in ebs.Titles
                          where t.Status == 1
                          select new
                          {
                              t.TitleId,
                              t.TitleName
                          };
        lbTitle.DataSource = queryTitles.ToList().OrderBy(a => a.TitleName);
        lbTitle.DataTextField = "TitleName";
        lbTitle.DataValueField = "TitleId";
        lbTitle.DataBind();        
    }

    private void GenDataInner()
    {
        if (lbTitle.Items.Count != 0)
        {
            if (!IsPostBack) lbTitle.SelectedIndex = 0;
            //populate reviews in list box
            int titleid = Int32.Parse(lbTitle.SelectedItem.Value);
            var queryRev = from rev in ebs.Reviews
                           where rev.Title.TitleId == titleid
                           select new
                           {
                               rev.ReviewText,
                               rev.ReviewId
                           };
            lbRev.DataSource = queryRev.ToList();
            lbRev.DataTextField = "ReviewText";
            lbRev.DataValueField = "ReviewId";
            lbRev.DataBind();           
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        if (!IsPostBack)
        {
            GenDataOuter();
        }              
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {       
            int revid = Int32.Parse(lbRev.SelectedItem.Value);
            Review rev = ebs.Reviews.SingleOrDefault(a => a.ReviewId == revid);
            ebs.Reviews.Remove(rev);
            ebs.SaveChanges();
            GenDataInner();
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        GenDataInner();
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
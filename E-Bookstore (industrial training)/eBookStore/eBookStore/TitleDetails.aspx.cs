using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TitleDetails : System.Web.UI.Page
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
                int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
                Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == TitleId);
                List<Title> cartItems = (List<Title>)Session["eStoreCart"];
                int cartCount = cartItems.Count();
                lbCart.Text = "Cart(" + cartCount + ")";
                if (cartItems.Contains(ttl))
                {
                    btnCart.Enabled = false;
                    btnCart.Text = "Added to Cart";
                } 
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
        lblPubDate.Text = ttl.PubDate.ToShortDateString();
        lbRating.Text = System.Math.Round(ttl.Rating,2).ToString();
        lbRatingCount.Text = ttl.RatingCount.ToString();
        lblDownloads.Text = ttl.DownloadCount.ToString();
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

        //get reviews
        var queryReviews = from rev in ebs.Reviews
                           where rev.Title.TitleId == TitleId
                           select rev;
        List<ReviewItem> lst_rev = new List<ReviewItem>();
        ReviewItem revitm;
        foreach (Review item in queryReviews)
        {
            revitm = new ReviewItem(item);
            lst_rev.Add(revitm);
        }
        gvReviews.DataSource = lst_rev;
        gvReviews.DataBind();
    }
    private void CartButtonState()
    {
        try
        {
            int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
            Title t = ebs.Titles.SingleOrDefault(a => a.TitleId == TitleId);
            List<Title> cartItems = (List<Title>)Session["eStoreCart"];
            var query = from ttl in cartItems
                        where ttl.TitleId == TitleId
                        select ttl;
            if (query.ToList().Count() != 0)
            {
                btnCart.Enabled = false;
            }
        }
        catch (Exception)
        {
            //do nothing
        }
    }
    private void ReviewButtonState()
    {
        if (Session["eStoreuser"]!=null)
        {
            btnAddrev.Enabled = true;
        }
        else
        {
            btnAddrev.Enabled = false;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {        
        ebs = new eBookStoreDBModelContainer();
        if (!IsPostBack)
        {
            AuthenticateUser();
        }
        try
        {
            int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
            Title t = ebs.Titles.SingleOrDefault(a => a.TitleId == TitleId);
            lblTitle.Text = t.TitleName + " " + t.Edition + " edition.";
            FillPage();
        }
        catch (Exception ex)
        {
            lblTitle.Text = "Undefined.";
            lblErr.Text = ex.Message;
            lblErr.Text += "<br> You probably arrived to this page directly.";
        }
        CartButtonState();
        ReviewButtonState();
        
    }
    protected void lbLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Login.aspx");
    }
    protected void lbReg_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Register.aspx");
    }
    protected void lbAcc_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Account.aspx");
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.AddHeader("REFRESH", "0");
    }
    protected void lbCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("User/Checkout.aspx");
    }
    protected void btnCart_Click(object sender, EventArgs e)
    {
        if (Session["eStoreUser"]!=null)
        {
            try
            {
                int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
                Title t = ebs.Titles.SingleOrDefault(a => a.TitleId == TitleId);
                t.DownloadCount++;
                if (Session["eStoreCart"] == null)
                {
                    Session["eStoreCart"] = new List<Title>();
                }
                List<Title> cartItems = (List<Title>)Session["eStoreCart"];
                cartItems.Add(t);
                Session["eStoreCart"] = cartItems;
                AuthenticateUser();
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message;
            } 
        }
        else
        {
            Response.Redirect("User/Login.aspx");
        }
    }
    protected void btnAddrev_Click(object sender, EventArgs e)
    {
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        imgCover.ImageUrl = "../../Storage/Images/" + TitleId.ToString() + ".png";
        Title ttl = ebs.Titles.SingleOrDefault(t => t.TitleId == TitleId);
        Review rev = new Review();
        Htmlify htex = new Htmlify();
        rev.ReviewText = htex.Convert(txtRev.Text);
        rev.ReviewDate = DateTime.Now;
        rev.UserUserId = Int32.Parse(Session["eStoreUserId"].ToString());
        rev.TitleTitleId = TitleId;
        ebs.Reviews.Add(rev);
        ebs.SaveChanges();
        FillPage();
    }
    protected void gvReviews_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell cell in e.Row.Cells)
        {
            cell.Text = Server.HtmlDecode(cell.Text);
        }
    }
    protected void gvReviews_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void radRating_SelectedIndexChanged(object sender, EventArgs e)
    {
        int TitleId = Int32.Parse(Request.QueryString["TitleId"]);
        Title t = ebs.Titles.SingleOrDefault(a => a.TitleId == TitleId);
        t.Rating = (t.Rating + Decimal.Parse(radRating.SelectedItem.Value))/(++(t.RatingCount));
        ebs.SaveChanges();
        FillPage();
    }
    protected void lbHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void lbAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin/Login.aspx");
    }
}
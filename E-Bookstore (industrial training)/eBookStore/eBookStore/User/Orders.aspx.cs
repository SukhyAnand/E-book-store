using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Objects.SqlClient;

public partial class User_Orders : System.Web.UI.Page
{
    eBookStoreDBModelContainer ebs;
    private void AuthenticateUser()
    {
        if (Session["eStoreUser"] != null)
        {
            lblMsg.Text = Session["eStoreUser"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    private void FillListBox()
    {
        int userid = Int32.Parse(Session["eStoreUserId"].ToString());
        var query = from b in ebs.Bills
                    where b.UserUserId == userid
                    select new
                    {
                        b.BillId,
                        b.BillDate
                    };
        lbBills.DataSource = query.ToList().OrderByDescending(a => a.BillId);
        lbBills.DataTextField = "BillDate";
        lbBills.DataValueField = "BillId";
        lbBills.DataBind();        
              
    }
    private void GetTitles()
    {
        List<BillTitleItem> lst_blttlitm = new List<BillTitleItem>();
        int BillId = Int32.Parse(lbBills.SelectedItem.Value);
        var query = from bl in ebs.Bills
                    from ttl in bl.Titles
                    where bl.BillId == BillId
                    select ttl;
        foreach (Title item in query.ToList())
        {
            BillTitleItem btl = new BillTitleItem(item);
            lst_blttlitm.Add(btl);
        }
        gvTitles.DataSource = lst_blttlitm;
        gvTitles.DataBind();
        Bill _bl = ebs.Bills.Single(b => b.BillId == BillId);
        lblAmt.Text = _bl.BillAmount.ToString();
        lblDate.Text = _bl.BillDate.ToShortDateString();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        AuthenticateUser();
        try
        {
            if (!IsPostBack)
            {
                FillListBox();                                
            }
            if (lbBills.Items.Count != 0)
            {
                GetTitles();
            }
            else
            {
                lblErr.Text = "You have made no purchases.";
            }
            
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;           
        }
    }
    protected void gvTitles_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell cell in e.Row.Cells)
        {
            cell.Text = Server.HtmlDecode(cell.Text);
        }
    }
    protected void lbHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Home.aspx");
    }
    protected void lbAcc_Click(object sender, EventArgs e)
    {
        Response.Redirect("Account.aspx");
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../Home.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Checkout : System.Web.UI.Page
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
        List<Title> cartItems = new List<Title>();
        try
        {
            cartItems = (List<Title>)Session["eStoreCart"];
            var query = from item in cartItems
                        select new
                        {
                            item.TitleId,
                            name = string.Concat(item.TitleName, " (", item.Edition, ")")
                        };
            lbCartItems.DataSource = query.ToList().OrderBy(t => t.name);
            lbCartItems.DataTextField = "name";
            lbCartItems.DataValueField = "TitleId";
            lbCartItems.DataBind();
            decimal sum = 0;
            foreach (Title item in cartItems)
            {
                sum += item.Price;
            }
            lblBill.Text = sum.ToString();
            if (lbCartItems.Items.Count == 0)
            {
                btnCart.Enabled = false;
                btnPay.Enabled = false;
            }
            else
            {
                lbCartItems.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
            
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        if (!IsPostBack)
        {
            AuthenticateUser();
            FillListBox(); 
        }        
    }
    protected void btnCart_Click(object sender, EventArgs e)
    {
        List<Title> cartItems = (List<Title>)Session["eStoreCart"];
        int itemToRemove = Int32.Parse(lbCartItems.SelectedItem.Value);
        Title ttl = cartItems.SingleOrDefault(c => c.TitleId == itemToRemove);
        cartItems.Remove(ttl);
        Session["eStoreCart"] = cartItems;
        FillListBox();
    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        List<Title> cartItems = (List<Title>)Session["eStoreCart"];
        int userid = Int32.Parse(Session["eStoreUserId"].ToString());
        Bill bl = new Bill();
        User us = ebs.Users.SingleOrDefault(u => u.UserId == userid);
        bl.BillAmount = Decimal.Parse(lblBill.Text);
        bl.BillDate = DateTime.Now;
        bl.User = us;
        foreach (Title item in cartItems)
        {
            bl.Titles.Add(ebs.Titles.SingleOrDefault(ttl => ttl.TitleId == item.TitleId));
        }       
        ebs.Bills.Add(bl);
        ebs.SaveChanges();
        Response.Redirect("Orders.aspx"); 
    }
    protected void lbHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Home.aspx");
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../Home.aspx");
    }
    protected void lbContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Home.aspx");
    }
}
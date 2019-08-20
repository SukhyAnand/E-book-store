using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Account : System.Web.UI.Page
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
    private void FillData(int userid)
    {
        try
        {
            User us = ebs.Users.SingleOrDefault(u => u.UserId == userid);
            txtContact.Text = us.Contact.ToString();
            txtName.Text = us.UserName;
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
            lbOrders.Visible = false;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
        AuthenticateUser();
        int userid = Int32.Parse(Session["eStoreUserId"].ToString());
        if (!IsPostBack)
        {
            FillData(userid);
        }
    }
    protected void btnUpdate0_Click(object sender, EventArgs e)
    {
        try
        {
            if ((txtContact.Text.Trim() != "") && (txtName.Text.Trim() != ""))
            {
                int userid = Int32.Parse(Session["eStoreUserId"].ToString());
                User us = ebs.Users.Single(u => u.UserId == userid);
                us.UserName = txtName.Text;
                us.Contact = txtContact.Text;
                ebs.SaveChanges();
                Response.AddHeader("REFRESH", "0");
                btnUpdate0.Visible = false;
                btnEdit.Visible = true;
            }
            else
            {
                lblMsg.Text = "You cannot leave any fields blank.";
            }
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
        }
    }
    protected void btnUpdate1_Click(object sender, EventArgs e)
    {
        try
        {
            RijndaelAES r = new RijndaelAES();
            int userid = Int32.Parse(Session["eStoreUserId"].ToString());
            User us = ebs.Users.Single(u => u.UserId == userid);
            if (txtOldPass.Text == r.Crypto(us.Pass,1))
            {
                if (txtNewPass.Text == txtRePass.Text)
                {
                    us.Pass = r.Crypto(txtRePass.Text,0);
                    ebs.SaveChanges();
                }
                else
                {
                    lblMsg.Text = "Passwords do not match.";
                }
            }
            else
            {
                lblMsg.Text = "Current password do not match.";
            }
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message;
        }
    }
    protected void lbHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Home.aspx");
    }
    protected void lbOrders_Click(object sender, EventArgs e)
    {
        Response.Redirect("Orders.aspx");
    }
    protected void lbLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../Home.aspx");
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        txtContact.ReadOnly = false;
        txtName.ReadOnly = false;
        btnUpdate0.Visible = true;
        btnEdit.Visible = false;

    }
    protected void lbAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Admin/Login.aspx");
    }
}
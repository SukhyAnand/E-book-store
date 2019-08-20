using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    eBookStoreDBModelContainer ebs;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        ebs = new eBookStoreDBModelContainer();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String login = txtLogin.Text.Trim();
        String pass = txtPass.Text;
        Admin ad = ebs.Admins.SingleOrDefault(a => a.AdminLogin == login);
        if (ad != null)
        {
            if (ad.Pass == pass)
            {
                Session["eStoreAdmin"] = ad.AdminName.ToString();
                if ((!System.Text.RegularExpressions.Regex.IsMatch(txtTimeOut.Text, @"(^([0-9]*|\d*\d{1}?\d*)$)")) || (txtTimeOut.Text.Trim() == ""))
                {
                    Session.Timeout = 20;
                }
                else
                {
                    Session.Timeout = Int32.Parse(txtTimeOut.Text);
                }
                Response.Redirect("Landing.aspx");
            }
            else
            {
                lblMsg.Text = "Incorrect Password.";
            }
        }
        else
        {
            lblMsg.Text = "User does not exist.";
        }
    }

    protected void lbHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Home.aspx");
    }

}
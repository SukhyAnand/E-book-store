using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Register : System.Web.UI.Page
{
    eBookStoreDBModelContainer ebs;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        try
        {
            ebs = new eBookStoreDBModelContainer();
            RijndaelAES ri = new RijndaelAES();
            User us = new User();
            string login = txtLogin.Text;
            var unique_check = from u in ebs.Users
                               where u.UserLogin == login
                               select u.UserName;
            if (txtPass.Text == txtrePass.Text)
            {
                if (unique_check.ToList().Count == 0)
                {
                    us.UserLogin = login;
                    us.UserName = txtName.Text.Trim();
                    us.Pass = ri.Crypto(txtPass.Text,0);
                    us.Contact = txtContact.Text;
                    ebs.Users.Add(us);
                    ebs.SaveChanges();
                    lblMsg.Text = "Successfully Registered. Redirecting now.";
                    Response.AddHeader("REFRESH", "2;URL=../Home.aspx");
                }
                else
                {
                    lblMsg.Text = "Cannot register. An account with this email already exists.";
                }
            }
            else
            {
                lblMsg.Text = "Passwords do not match.";
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
    protected void lbAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Admin/Login.aspx");
    }
}
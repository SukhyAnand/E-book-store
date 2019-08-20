using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ReviewItem
/// </summary>
public class ReviewItem
{
    public string desc { get; set; }
	public ReviewItem(Review rev)
	{
        int userid = rev.UserUserId;
        eBookStoreDBModelContainer _ebs = new eBookStoreDBModelContainer();
        string username = _ebs.Users.SingleOrDefault(u => u.UserId == userid).UserName;
        string date = rev.ReviewDate.ToShortDateString();
        string text = rev.ReviewText;
        Htmlify ptex = new Htmlify();
        text = ptex.Revert(text);
        desc = "<p class=\"revname\">" + username + "</p> <p class=\"revdate\">" + date + "</p><p class=\"revtext\">" + text + "</p>";
	}
}
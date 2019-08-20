using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BillTitleItem
/// </summary>
public class BillTitleItem
{
    public String imgUrl { get; set; }
    public String desc { get; set; }
    public String link { get; set; }
	public BillTitleItem(Title ttl)       
	{        
        var queryAuthList = from a in ttl.Authors
                            select string.Concat(a.FirstName, " ", a.LastName);
        string AuthList = String.Join(", ", queryAuthList);
        var queryCatList = from c in ttl.Categories
                           select c.CategoryName;
        string CatList = String.Join(", ", queryCatList);
        string imgsrc = "../Storage/Images/" + ttl.TitleId.ToString() + ".png";
        desc = "<a href = \"../TitleDetails.aspx?TitleId=" + ttl.TitleId.ToString() + "\">" + ttl.TitleName + "</a> </br> by " + AuthList + "<br/>" + CatList +"</br>" + ttl.Price.ToString();
        imgUrl = "<img src=\"" + imgsrc + "\" alt = \"Product Image\" height = \"100\">";
        link = "<a href = \"../Storage/Books/" + ttl.TitleId.ToString() + "." + ttl.FileFormat.ToString() +  "\"> Download </a>" ;
	}
}
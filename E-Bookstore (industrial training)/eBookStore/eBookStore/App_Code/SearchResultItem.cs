using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SearchResultItem
/// </summary>
public class SearchResultItem
{
    public string imgUrl { get; set; }
    public string desc { get; set; }
	public SearchResultItem(Title ttl)
	{
        var queryAuthList = from a in ttl.Authors
                            select string.Concat(a.FirstName," ",a.LastName);
        string AuthList = String.Join(", ", queryAuthList);
        var queryCatList = from c in ttl.Categories
                           select c.CategoryName;
        string CatList = String.Join(", ", queryCatList);
        string imgsrc = "Storage/Images/" + ttl.TitleId.ToString() + ".png";
        desc = "<p><a class=\"searchHeader\" href = \"TitleDetails.aspx?TitleId=" + ttl.TitleId.ToString() + "\">" + ttl.TitleName + "</a></p><p class = \"authList\"> by " + AuthList + "</p><p class= \"catList\">" + CatList + "</p><p class= \"price\"> " + ttl.Price + "</p>"; 
        imgUrl = "<img src=\"" + imgsrc + "\" alt = \"Product Image\" height = \"100\">";
	}
}
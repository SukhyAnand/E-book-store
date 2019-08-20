﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Admin
{
    public int AdminId { get; set; }
    public string AdminName { get; set; }
    public string AdminLogin { get; set; }
    public string Pass { get; set; }
}

public partial class Author
{
    public Author()
    {
        this.Titles = new HashSet<Title>();
    }

    public int AuthorId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }

    public virtual ICollection<Title> Titles { get; set; }
}

public partial class Bill
{
    public Bill()
    {
        this.Titles = new HashSet<Title>();
    }

    public int BillId { get; set; }
    public System.DateTime BillDate { get; set; }
    public decimal BillAmount { get; set; }
    public int UserUserId { get; set; }

    public virtual User User { get; set; }
    public virtual ICollection<Title> Titles { get; set; }
}

public partial class Category
{
    public Category()
    {
        this.Titles = new HashSet<Title>();
    }

    public int CategoryId { get; set; }
    public string CategoryName { get; set; }

    public virtual ICollection<Title> Titles { get; set; }
}

public partial class Review
{
    public int ReviewId { get; set; }
    public System.DateTime ReviewDate { get; set; }
    public string ReviewText { get; set; }
    public Nullable<int> TitleTitleId { get; set; }
    public int UserUserId { get; set; }

    public virtual Title Title { get; set; }
    public virtual User User { get; set; }
}

public partial class Title
{
    public Title()
    {
        this.Authors = new HashSet<Author>();
        this.Categories = new HashSet<Category>();
        this.Reviews = new HashSet<Review>();
        this.Bills = new HashSet<Bill>();
    }

    public int TitleId { get; set; }
    public string TitleName { get; set; }
    public string TitleDescription { get; set; }
    public string Edition { get; set; }
    public string ISBN { get; set; }
    public int RatingCount { get; set; }
    public int DownloadCount { get; set; }
    public int Status { get; set; }
    public int Pages { get; set; }
    public decimal Rating { get; set; }
    public System.DateTime PubDate { get; set; }
    public string FileFormat { get; set; }
    public decimal Price { get; set; }

    public virtual ICollection<Author> Authors { get; set; }
    public virtual ICollection<Category> Categories { get; set; }
    public virtual ICollection<Review> Reviews { get; set; }
    public virtual ICollection<Bill> Bills { get; set; }
}

public partial class User
{
    public User()
    {
        this.Reviews = new HashSet<Review>();
        this.Bills = new HashSet<Bill>();
    }

    public int UserId { get; set; }
    public string UserName { get; set; }
    public string UserLogin { get; set; }
    public string Pass { get; set; }
    public string Contact { get; set; }

    public virtual ICollection<Review> Reviews { get; set; }
    public virtual ICollection<Bill> Bills { get; set; }
}
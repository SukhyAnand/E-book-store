
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/09/2015 17:29:12
-- Generated from EDMX file: C:\Users\Rangan\Documents\Visual Studio 2015\WebSites\eBookStore\App_Code\eBookStoreDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [eBookStoreDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TitleAuthor_Title]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TitleAuthor] DROP CONSTRAINT [FK_TitleAuthor_Title];
GO
IF OBJECT_ID(N'[dbo].[FK_TitleAuthor_Author]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TitleAuthor] DROP CONSTRAINT [FK_TitleAuthor_Author];
GO
IF OBJECT_ID(N'[dbo].[FK_TitleCategory_Title]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TitleCategory] DROP CONSTRAINT [FK_TitleCategory_Title];
GO
IF OBJECT_ID(N'[dbo].[FK_TitleCategory_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TitleCategory] DROP CONSTRAINT [FK_TitleCategory_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_TitleReview]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_TitleReview];
GO
IF OBJECT_ID(N'[dbo].[FK_UserReview]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_UserReview];
GO
IF OBJECT_ID(N'[dbo].[FK_UserBill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bills] DROP CONSTRAINT [FK_UserBill];
GO
IF OBJECT_ID(N'[dbo].[FK_TitleBill_Title]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TitleBill] DROP CONSTRAINT [FK_TitleBill_Title];
GO
IF OBJECT_ID(N'[dbo].[FK_TitleBill_Bill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TitleBill] DROP CONSTRAINT [FK_TitleBill_Bill];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Admins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Admins];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Authors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Authors];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Reviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reviews];
GO
IF OBJECT_ID(N'[dbo].[Bills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bills];
GO
IF OBJECT_ID(N'[dbo].[Titles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Titles];
GO
IF OBJECT_ID(N'[dbo].[TitleAuthor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TitleAuthor];
GO
IF OBJECT_ID(N'[dbo].[TitleCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TitleCategory];
GO
IF OBJECT_ID(N'[dbo].[TitleBill]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TitleBill];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [AdminId] int IDENTITY(1,1) NOT NULL,
    [AdminName] varchar(max)  NOT NULL,
    [AdminLogin] varchar(max)  NOT NULL,
    [Pass] varchar(max)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [UserName] varchar(max)  NOT NULL,
    [UserLogin] varchar(max)  NOT NULL,
    [Pass] varchar(max)  NOT NULL,
    [Contact] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Authors'
CREATE TABLE [dbo].[Authors] (
    [AuthorId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [ReviewId] int IDENTITY(1,1) NOT NULL,
    [ReviewDate] datetime  NOT NULL,
    [ReviewText] nvarchar(max)  NOT NULL,
    [TitleTitleId] int  NULL,
    [UserUserId] int  NOT NULL
);
GO

-- Creating table 'Bills'
CREATE TABLE [dbo].[Bills] (
    [BillId] int IDENTITY(1,1) NOT NULL,
    [BillDate] datetime  NOT NULL,
    [BillAmount] decimal(7,2)  NOT NULL,
    [UserUserId] int  NOT NULL
);
GO

-- Creating table 'Titles'
CREATE TABLE [dbo].[Titles] (
    [TitleId] int IDENTITY(1,1) NOT NULL,
    [TitleName] nvarchar(max)  NOT NULL,
    [TitleDescription] nvarchar(max)  NOT NULL,
    [Edition] nvarchar(max)  NOT NULL,
    [ISBN] nvarchar(max)  NOT NULL,
    [RatingCount] int  NOT NULL,
    [DownloadCount] int  NOT NULL,
    [Status] int  NOT NULL,
    [Pages] int  NOT NULL,
    [Rating] decimal(4,2)  NOT NULL,
    [PubDate] datetime  NOT NULL,
    [FileFormat] nvarchar(max)  NOT NULL,
    [Price] decimal(7,2)  NOT NULL
);
GO

-- Creating table 'TitleAuthor'
CREATE TABLE [dbo].[TitleAuthor] (
    [Titles_TitleId] int  NOT NULL,
    [Authors_AuthorId] int  NOT NULL
);
GO

-- Creating table 'TitleCategory'
CREATE TABLE [dbo].[TitleCategory] (
    [Titles_TitleId] int  NOT NULL,
    [Categories_CategoryId] int  NOT NULL
);
GO

-- Creating table 'TitleBill'
CREATE TABLE [dbo].[TitleBill] (
    [Titles_TitleId] int  NOT NULL,
    [Bills_BillId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AdminId] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([AdminId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [AuthorId] in table 'Authors'
ALTER TABLE [dbo].[Authors]
ADD CONSTRAINT [PK_Authors]
    PRIMARY KEY CLUSTERED ([AuthorId] ASC);
GO

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [ReviewId] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [PK_Reviews]
    PRIMARY KEY CLUSTERED ([ReviewId] ASC);
GO

-- Creating primary key on [BillId] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [PK_Bills]
    PRIMARY KEY CLUSTERED ([BillId] ASC);
GO

-- Creating primary key on [TitleId] in table 'Titles'
ALTER TABLE [dbo].[Titles]
ADD CONSTRAINT [PK_Titles]
    PRIMARY KEY CLUSTERED ([TitleId] ASC);
GO

-- Creating primary key on [Titles_TitleId], [Authors_AuthorId] in table 'TitleAuthor'
ALTER TABLE [dbo].[TitleAuthor]
ADD CONSTRAINT [PK_TitleAuthor]
    PRIMARY KEY CLUSTERED ([Titles_TitleId], [Authors_AuthorId] ASC);
GO

-- Creating primary key on [Titles_TitleId], [Categories_CategoryId] in table 'TitleCategory'
ALTER TABLE [dbo].[TitleCategory]
ADD CONSTRAINT [PK_TitleCategory]
    PRIMARY KEY CLUSTERED ([Titles_TitleId], [Categories_CategoryId] ASC);
GO

-- Creating primary key on [Titles_TitleId], [Bills_BillId] in table 'TitleBill'
ALTER TABLE [dbo].[TitleBill]
ADD CONSTRAINT [PK_TitleBill]
    PRIMARY KEY CLUSTERED ([Titles_TitleId], [Bills_BillId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Titles_TitleId] in table 'TitleAuthor'
ALTER TABLE [dbo].[TitleAuthor]
ADD CONSTRAINT [FK_TitleAuthor_Title]
    FOREIGN KEY ([Titles_TitleId])
    REFERENCES [dbo].[Titles]
        ([TitleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Authors_AuthorId] in table 'TitleAuthor'
ALTER TABLE [dbo].[TitleAuthor]
ADD CONSTRAINT [FK_TitleAuthor_Author]
    FOREIGN KEY ([Authors_AuthorId])
    REFERENCES [dbo].[Authors]
        ([AuthorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TitleAuthor_Author'
CREATE INDEX [IX_FK_TitleAuthor_Author]
ON [dbo].[TitleAuthor]
    ([Authors_AuthorId]);
GO

-- Creating foreign key on [Titles_TitleId] in table 'TitleCategory'
ALTER TABLE [dbo].[TitleCategory]
ADD CONSTRAINT [FK_TitleCategory_Title]
    FOREIGN KEY ([Titles_TitleId])
    REFERENCES [dbo].[Titles]
        ([TitleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Categories_CategoryId] in table 'TitleCategory'
ALTER TABLE [dbo].[TitleCategory]
ADD CONSTRAINT [FK_TitleCategory_Category]
    FOREIGN KEY ([Categories_CategoryId])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TitleCategory_Category'
CREATE INDEX [IX_FK_TitleCategory_Category]
ON [dbo].[TitleCategory]
    ([Categories_CategoryId]);
GO

-- Creating foreign key on [TitleTitleId] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_TitleReview]
    FOREIGN KEY ([TitleTitleId])
    REFERENCES [dbo].[Titles]
        ([TitleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TitleReview'
CREATE INDEX [IX_FK_TitleReview]
ON [dbo].[Reviews]
    ([TitleTitleId]);
GO

-- Creating foreign key on [UserUserId] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_UserReview]
    FOREIGN KEY ([UserUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserReview'
CREATE INDEX [IX_FK_UserReview]
ON [dbo].[Reviews]
    ([UserUserId]);
GO

-- Creating foreign key on [UserUserId] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [FK_UserBill]
    FOREIGN KEY ([UserUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserBill'
CREATE INDEX [IX_FK_UserBill]
ON [dbo].[Bills]
    ([UserUserId]);
GO

-- Creating foreign key on [Titles_TitleId] in table 'TitleBill'
ALTER TABLE [dbo].[TitleBill]
ADD CONSTRAINT [FK_TitleBill_Title]
    FOREIGN KEY ([Titles_TitleId])
    REFERENCES [dbo].[Titles]
        ([TitleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Bills_BillId] in table 'TitleBill'
ALTER TABLE [dbo].[TitleBill]
ADD CONSTRAINT [FK_TitleBill_Bill]
    FOREIGN KEY ([Bills_BillId])
    REFERENCES [dbo].[Bills]
        ([BillId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TitleBill_Bill'
CREATE INDEX [IX_FK_TitleBill_Bill]
ON [dbo].[TitleBill]
    ([Bills_BillId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
CREATE DATABASE LibraryDB;

CREATE TABLE [users] (
  [id] int IDENTITY (1,1) NOT NULL
, [email] ntext NULL
, [password] ntext NULL
);
GO
CREATE TABLE [books] (
  [id] int IDENTITY (1,1) NOT NULL
, [books_title] nvarchar(50) NULL
, [books_isbn] nvarchar(50) NULL
, [available_qty] nvarchar(50) NULL
);
GO
CREATE TABLE [book_user] (
  [id] int IDENTITY (1,1) NOT NULL
, [book_id] int NULL
, [user_id] int NULL
);
GO
CREATE TABLE [book_author] (
  [id] int IDENTITY (1,1) NOT NULL
, [book_id] int NULL
, [author_id] int NULL
);
GO
CREATE TABLE [authors] (
  [id] int IDENTITY (1,1) NOT NULL
, [name] nvarchar(50) NULL
);
GO
CREATE TABLE [admin] (
  [id] int IDENTITY (1,1) NOT NULL
, [email] nvarchar(50) NULL
, [password] nchar(10) NULL
);
GO
ALTER TABLE [users] ADD CONSTRAINT [PK__users__3213E83FD0FDABEC] PRIMARY KEY ([id]);
GO
ALTER TABLE [books] ADD CONSTRAINT [PK__books__3213E83FBC6673A4] PRIMARY KEY ([id]);
GO
ALTER TABLE [book_user] ADD CONSTRAINT [PK__book_use__3213E83F4C1C7B29] PRIMARY KEY ([id]);
GO
ALTER TABLE [book_author] ADD CONSTRAINT [PK__book_aut__3213E83F568CDEBC] PRIMARY KEY ([id]);
GO
ALTER TABLE [authors] ADD CONSTRAINT [PK__authors__3213E83F9CD620EC] PRIMARY KEY ([id]);
GO
ALTER TABLE [admin] ADD CONSTRAINT [PK__admin__3213E83FF782F01A] PRIMARY KEY ([id]);
GO
ALTER TABLE [book_user] ADD CONSTRAINT [FK__book_user__book___398D8EEE] FOREIGN KEY ([book_id]) REFERENCES [books]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [book_user] ADD CONSTRAINT [FK__book_user__user___3A81B327] FOREIGN KEY ([user_id]) REFERENCES [users]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [book_author] ADD CONSTRAINT [FK__book_auth__book___36B12243] FOREIGN KEY ([book_id]) REFERENCES [books]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO


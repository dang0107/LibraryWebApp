CREATE DATABASE LibraryDB;

USE DATABASE LibraryDB;
CREATE TABLE [users] (
  [id] int IDENTITY (2,1) NOT NULL
, [email] ntext NULL
, [password] ntext NULL
);
GO
CREATE TABLE [books] (
  [id] int IDENTITY (19,1) NOT NULL
, [books_title] nvarchar(50) NULL
, [books_isbn] nvarchar(50) NULL
, [available_qty] nvarchar(50) NULL
);
GO
CREATE TABLE [book_user] (
  [id] int IDENTITY (2,1) NOT NULL
, [book_id] int NULL
, [user_id] int NULL
);
GO
CREATE TABLE [book_author] (
  [id] int IDENTITY (19,1) NOT NULL
, [book_id] int NULL
, [author_id] int NULL
);
GO
CREATE TABLE [authors] (
  [id] int IDENTITY (16,1) NOT NULL
, [name] nvarchar(50) NULL
);
GO
CREATE TABLE [admin] (
  [id] int IDENTITY (2,1) NOT NULL
, [email] nvarchar(50) NULL
, [password] nchar(10) NULL
);
GO
SET IDENTITY_INSERT [users] OFF;
GO
SET IDENTITY_INSERT [books] ON;
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
4,N'In Search of Lost Time',N'23341',N'29');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
6,N'The Dead',N'87541',N'15');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
7,N'Harry Potter',N'34512',N'27');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
8,N'The Adventure of Sherlock Holmes',N'77441',N'34');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
9,N'Breaking Dawn',N'45235',N'43');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
11,N'Life of Pi',N'99832',N'5');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
12,N'Twilight',N'45612',N'7');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
13,N'One Day',N'62345',N'78');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
14,N'New Moon',N'35124',N'20');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
15,N'Man and Boy',N'88451',N'32');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
16,N'PS, I Love You',N'87531',N'12');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
17,N'Dear Fatty',N'50123',N'71');
GO
INSERT INTO [books] ([id],[books_title],[books_isbn],[available_qty]) VALUES (
18,N'Room on the Broom',N'85103',N'2');
GO
SET IDENTITY_INSERT [books] OFF;
GO
SET IDENTITY_INSERT [book_user] OFF;
GO
SET IDENTITY_INSERT [book_author] ON;
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
4,4,3);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
6,6,5);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
7,7,6);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
8,8,7);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
9,9,8);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
11,11,10);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
12,12,8);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
13,13,11);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
14,14,8);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
15,15,12);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
16,16,13);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
17,17,14);
GO
INSERT INTO [book_author] ([id],[book_id],[author_id]) VALUES (
18,18,15);
GO
SET IDENTITY_INSERT [book_author] OFF;
GO
SET IDENTITY_INSERT [authors] ON;
GO
INSERT INTO [authors] ([id],[name]) VALUES (
1,N'James Gosling');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
3,N'Marcel Proust');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
4,N'');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
5,N'James Joyce');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
6,N'JK Rowling');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
7,N'Authur Conan Doyle');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
8,N'Meyer Stephenie');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
9,N'Nicholls, David');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
10,N'Martel Yann');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
11,N'Nicholls David');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
12,N'Parsons Tony');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
13,N'Ahern Cecelia');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
14,N'French Dawn');
GO
INSERT INTO [authors] ([id],[name]) VALUES (
15,N'Donaldson Julia');
GO
SET IDENTITY_INSERT [authors] OFF;
GO
SET IDENTITY_INSERT [admin] ON;
GO
INSERT INTO [admin] ([id],[email],[password]) VALUES (
1,N'admin@gmail.com',N'admin     ');
GO
SET IDENTITY_INSERT [admin] OFF;
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




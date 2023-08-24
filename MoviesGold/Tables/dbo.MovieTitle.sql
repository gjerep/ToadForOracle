SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovieTitle] (
		[MovieId]         [int] NOT NULL,
		[Title]           [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Year]            [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Description]     [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[CategoryId]      [int] NOT NULL,
		[Duration]        [int] NULL,
		[Rating]          [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [MovieTitle_UK]
		UNIQUE
		NONCLUSTERED
		([Title], [Year])
		ON [PRIMARY],
		CONSTRAINT [MovieTitle_PK]
		PRIMARY KEY
		CLUSTERED
		([MovieId])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[MovieTitle]
	ADD
	CONSTRAINT [CK__MovieTitl__Movie__33D4B598]
	CHECK
	([MovieId]>(0))
GO
ALTER TABLE [dbo].[MovieTitle]
CHECK CONSTRAINT [CK__MovieTitl__Movie__33D4B598]
GO
ALTER TABLE [dbo].[MovieTitle]
	ADD
	CONSTRAINT [CK__MovieTitl__Categ__34C8D9D1]
	CHECK
	([CategoryId]>(0))
GO
ALTER TABLE [dbo].[MovieTitle]
CHECK CONSTRAINT [CK__MovieTitl__Categ__34C8D9D1]
GO
ALTER TABLE [dbo].[MovieTitle]
	ADD
	CONSTRAINT [CK__MovieTitl__Durat__35BCFE0A]
	CHECK
	([Duration]>(0))
GO
ALTER TABLE [dbo].[MovieTitle]
CHECK CONSTRAINT [CK__MovieTitl__Durat__35BCFE0A]
GO
ALTER TABLE [dbo].[MovieTitle]
	ADD
	CONSTRAINT [CK__MovieTitl__Ratin__36B12243]
	CHECK
	([Rating]='X' OR [Rating]='R' OR [Rating]='PG' OR [Rating]='G')
GO
ALTER TABLE [dbo].[MovieTitle]
CHECK CONSTRAINT [CK__MovieTitl__Ratin__36B12243]
GO
ALTER TABLE [dbo].[MovieTitle]
	WITH CHECK
	ADD CONSTRAINT [MovieTitle_FK]
	FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[MovieCategory] ([CategoryId])
ALTER TABLE [dbo].[MovieTitle]
	CHECK CONSTRAINT [MovieTitle_FK]

GO
CREATE NONCLUSTERED INDEX [MovieTitle_IE1]
	ON [dbo].[MovieTitle] ([Rating])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Movie_title_FK]
	ON [dbo].[MovieTitle] ([CategoryId])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovieTitle] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer] (
		[CustomerId]     [int] NOT NULL,
		[FirstName]      [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[LastName]       [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Phone]          [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Address]        [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[City]           [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[State]          [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Zip]            [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BirthDate]      [date] NULL,
		[Gender]         [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Education]      [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [Customer_UK]
		UNIQUE
		NONCLUSTERED
		([FirstName], [LastName], [Phone])
		ON [PRIMARY],
		CONSTRAINT [Customer_PK]
		PRIMARY KEY
		CLUSTERED
		([CustomerId])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[Customer]
	ADD
	CONSTRAINT [CK__Customer__Gender__24927208]
	CHECK
	([Gender]='F' OR [Gender]='M')
GO
ALTER TABLE [dbo].[Customer]
CHECK CONSTRAINT [CK__Customer__Gender__24927208]
GO
ALTER TABLE [dbo].[Customer]
	ADD
	CONSTRAINT [CK__Customer__Custom__25869641]
	CHECK
	([CustomerId]>(0))
GO
ALTER TABLE [dbo].[Customer]
CHECK CONSTRAINT [CK__Customer__Custom__25869641]
GO
ALTER TABLE [dbo].[Customer]
	ADD
	CONSTRAINT [DF__Customer__Educat__5AEE82B9]
	DEFAULT ('BS') FOR [Education]
GO
CREATE NONCLUSTERED INDEX [Customer_IE1]
	ON [dbo].[Customer] ([LastName])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Customer_IE2]
	ON [dbo].[Customer] ([Phone])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Customer_IE3]
	ON [dbo].[Customer] ([Zip])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] SET (LOCK_ESCALATION = TABLE)
GO

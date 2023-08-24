SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee] (
		[EmployeeId]     [int] NOT NULL,
		[FirstName]      [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[LastName]       [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[SSN]            [char](11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Phone]          [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Address]        [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[City]           [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[State]          [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Zip]            [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BirthDate]      [date] NULL,
		[Gender]         [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[HireDate]       [date] NULL,
		CONSTRAINT [Employee_UK1]
		UNIQUE
		NONCLUSTERED
		([FirstName], [LastName], [Phone])
		ON [PRIMARY],
		CONSTRAINT [Employee_UK2]
		UNIQUE
		NONCLUSTERED
		([SSN])
		ON [PRIMARY],
		CONSTRAINT [Employee_PK]
		PRIMARY KEY
		CLUSTERED
		([EmployeeId])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[Employee]
	ADD
	CONSTRAINT [CK__Employee__Employ__2A4B4B5E]
	CHECK
	([EmployeeId]>(0))
GO
ALTER TABLE [dbo].[Employee]
CHECK CONSTRAINT [CK__Employee__Employ__2A4B4B5E]
GO
ALTER TABLE [dbo].[Employee]
	ADD
	CONSTRAINT [CK__Employee__Gender__2B3F6F97]
	CHECK
	([Gender]='F' OR [Gender]='M')
GO
ALTER TABLE [dbo].[Employee]
CHECK CONSTRAINT [CK__Employee__Gender__2B3F6F97]
GO
CREATE NONCLUSTERED INDEX [Employee_IE1]
	ON [dbo].[Employee] ([LastName])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Employee_IE2]
	ON [dbo].[Employee] ([Phone])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Employee_IE3]
	ON [dbo].[Employee] ([Zip])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] SET (LOCK_ESCALATION = TABLE)
GO

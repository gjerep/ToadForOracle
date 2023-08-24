SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovieCopy] (
		[MovieCopyId]       [int] NOT NULL,
		[CopyFormat]        [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[MovieId]           [int] NOT NULL,
		[CopyCondition]     [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [MovieCopy_PK]
		PRIMARY KEY
		CLUSTERED
		([MovieCopyId])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[MovieCopy]
	ADD
	CONSTRAINT [CK__MovieCopy__Movie__3C69FB99]
	CHECK
	([MovieCopyId]>(0))
GO
ALTER TABLE [dbo].[MovieCopy]
CHECK CONSTRAINT [CK__MovieCopy__Movie__3C69FB99]
GO
ALTER TABLE [dbo].[MovieCopy]
	ADD
	CONSTRAINT [CK__MovieCopy__CopyF__3D5E1FD2]
	CHECK
	([CopyFormat]='VHS' OR [CopyFormat]='DVD')
GO
ALTER TABLE [dbo].[MovieCopy]
CHECK CONSTRAINT [CK__MovieCopy__CopyF__3D5E1FD2]
GO
ALTER TABLE [dbo].[MovieCopy]
	ADD
	CONSTRAINT [CK__MovieCopy__CopyC__3E52440B]
	CHECK
	([CopyCondition]='OLD' OR [CopyCondition]='AVG' OR [CopyCondition]='NEW')
GO
ALTER TABLE [dbo].[MovieCopy]
CHECK CONSTRAINT [CK__MovieCopy__CopyC__3E52440B]
GO
ALTER TABLE [dbo].[MovieCopy]
	ADD
	CONSTRAINT [DF__MovieCopy__CopyF__3A81B327]
	DEFAULT ('VHS') FOR [CopyFormat]
GO
ALTER TABLE [dbo].[MovieCopy]
	ADD
	CONSTRAINT [DF__MovieCopy__CopyC__3B75D760]
	DEFAULT ('AVG') FOR [CopyCondition]
GO
ALTER TABLE [dbo].[MovieCopy]
	WITH CHECK
	ADD CONSTRAINT [MovieCopy_FK]
	FOREIGN KEY ([MovieId]) REFERENCES [dbo].[MovieTitle] ([MovieId])
ALTER TABLE [dbo].[MovieCopy]
	CHECK CONSTRAINT [MovieCopy_FK]

GO
CREATE NONCLUSTERED INDEX [MovieCopy_IE1]
	ON [dbo].[MovieCopy] ([CopyFormat])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MovieCopy_IE2]
	ON [dbo].[MovieCopy] ([CopyCondition])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MovieCopy_FK]
	ON [dbo].[MovieCopy] ([MovieId])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovieCopy] SET (LOCK_ESCALATION = TABLE)
GO

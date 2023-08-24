USE [mathew_dev];
GO
ALTER TABLE [dbo].[MovieRental]
DROP CONSTRAINT [MovieRental_FK1]
ALTER TABLE [dbo].[Customer]
DROP CONSTRAINT [Customer_UK]
GO
DROP INDEX [Customer_IE1] ON [dbo].[Customer]
GO
DROP INDEX [Customer_IE2] ON [dbo].[Customer]
GO
DROP INDEX [Customer_IE3] ON [dbo].[Customer]
GO
ALTER TABLE [dbo].[Customer]
ALTER COLUMN [FirstName] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
ALTER TABLE [dbo].[Customer]
 ADD CONSTRAINT [Customer_UK] UNIQUE([FirstName], [LastName], [Phone]) WITH (FILLFACTOR=100,
		DATA_COMPRESSION = NONE) ON [PRIMARY]
CREATE INDEX [Customer_IE1]
 ON [dbo].[Customer] ([LastName])
WITH (FILLFACTOR=100,
	DATA_COMPRESSION = NONE)
ON [PRIMARY]
CREATE INDEX [Customer_IE2]
 ON [dbo].[Customer] ([Phone])
WITH (FILLFACTOR=100,
	DATA_COMPRESSION = NONE)
ON [PRIMARY]
CREATE INDEX [Customer_IE3]
 ON [dbo].[Customer] ([Zip])
WITH (FILLFACTOR=100,
	DATA_COMPRESSION = NONE)
ON [PRIMARY]
ALTER TABLE [dbo].[MovieRental]
 ADD CONSTRAINT [MovieRental_FK1] FOREIGN KEY ([CustomerId])
		REFERENCES [dbo].[Customer] ([CustomerId])
	
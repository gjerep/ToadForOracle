SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MovieRental] (
		[RentalId]        [int] NOT NULL,
		[RentalDate]      [date] NOT NULL,
		[DueDate]         [date] NOT NULL,
		[TotalCharge]     [money] NOT NULL,
		[CustomerId]      [int] NOT NULL,
		[EmployeeId]      [int] NOT NULL,
		CONSTRAINT [MovieRental_PK]
		PRIMARY KEY
		CLUSTERED
		([RentalId])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[MovieRental]
	ADD
	CONSTRAINT [CK__MovieRent__Renta__4222D4EF]
	CHECK
	([RentalId]>(0))
GO
ALTER TABLE [dbo].[MovieRental]
CHECK CONSTRAINT [CK__MovieRent__Renta__4222D4EF]
GO
ALTER TABLE [dbo].[MovieRental]
	ADD
	CONSTRAINT [CK__MovieRent__Custo__4316F928]
	CHECK
	([CustomerId]>(0))
GO
ALTER TABLE [dbo].[MovieRental]
CHECK CONSTRAINT [CK__MovieRent__Custo__4316F928]
GO
ALTER TABLE [dbo].[MovieRental]
	ADD
	CONSTRAINT [CK__MovieRent__Emplo__440B1D61]
	CHECK
	([EmployeeId]>(0))
GO
ALTER TABLE [dbo].[MovieRental]
CHECK CONSTRAINT [CK__MovieRent__Emplo__440B1D61]
GO
ALTER TABLE [dbo].[MovieRental]
	ADD
	CONSTRAINT [CK__MovieRent__Total__44FF419A]
	CHECK
	([TotalCharge]>(0))
GO
ALTER TABLE [dbo].[MovieRental]
CHECK CONSTRAINT [CK__MovieRent__Total__44FF419A]
GO
ALTER TABLE [dbo].[MovieRental]
	WITH CHECK
	ADD CONSTRAINT [MovieRental_FK1]
	FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId])
ALTER TABLE [dbo].[MovieRental]
	CHECK CONSTRAINT [MovieRental_FK1]

GO
ALTER TABLE [dbo].[MovieRental]
	WITH CHECK
	ADD CONSTRAINT [MovieRental_FK2]
	FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
ALTER TABLE [dbo].[MovieRental]
	CHECK CONSTRAINT [MovieRental_FK2]

GO
CREATE NONCLUSTERED INDEX [MovieRental_IE1]
	ON [dbo].[MovieRental] ([RentalDate])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MovieRental_IE2]
	ON [dbo].[MovieRental] ([DueDate])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MovieRental_FK1]
	ON [dbo].[MovieRental] ([CustomerId])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MovieRental_FK2]
	ON [dbo].[MovieRental] ([EmployeeId])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovieRental] SET (LOCK_ESCALATION = TABLE)
GO

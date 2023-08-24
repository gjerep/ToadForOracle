SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW Rent_View AS
SELECT Mo.RentalId, Mo.RentalDate, Mo.TotalCharge, Re.ItemNumber, Movi.Title, Mov.CopyFormat
FROM MovieRental Mo, RentalItem Re, MovieCopy Mov, MovieTitle Movi
WHERE Re.RentalId = Mo.RentalId AND Re.MovieCopyId = Mov.MovieCopyId AND Mov.MovieId = Movi.MovieId
WITH CHECK OPTION;
GO

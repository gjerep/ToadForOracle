SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW Emp_View AS
SELECT Em.FirstName, Em.LastName, Em.Phone, Em.Gender
FROM Employee Em;
GO

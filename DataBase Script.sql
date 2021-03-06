USE [RemindMe]
GO
/****** Object:  Table [dbo].[Reminder_Data]    Script Date: 27-06-2020 10:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reminder_Data](
	[DATE] [datetime] NULL,
	[SUBJECT] [nvarchar](50) NULL,
	[REMINDER_NAME] [nvarchar](50) NULL,
	[DESCRYPTION] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[MOBILE] [nvarchar](50) NULL,
	[SMS_NO] [nvarchar](50) NULL,
	[RECUR] [int] NULL,
	[STATUS] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 27-06-2020 10:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[User_Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[USP_GETLOGINDETAILS]    Script Date: 27-06-2020 10:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_GETLOGINDETAILS]
(@USERID NVARCHAR(40),@PASSWORD NVARCHAR(40))
AS
BEGIN
select * from UserMaster where User_Name=@USERID and Password=@PASSWORD
END
GO
/****** Object:  StoredProcedure [dbo].[USP_REGISTER_USER_REMINDER]    Script Date: 27-06-2020 10:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_REGISTER_USER_REMINDER]    
(@USERNAME NVARCHAR(20),@EMAIL NVARCHAR(40),@MOBILE NVARCHAR(20),@PASSWORD NVARCHAR(20),@MESSAGE NVARCHAR(200) OUTPUT)      
AS      
BEGIN     
IF EXISTS(SELECT * FROM UserMaster WHERE User_Name = @USERNAME AND Email=@EMAIL)    
BEGIN     
SET @MESSAGE='User Already Exists'    
END    
ELSE    
BEGIN    
INSERT INTO UserMaster VALUES(@USERNAME ,@EMAIL,@MOBILE,@PASSWORD)    
set @MESSAGE='User Registered Successfully'    
END    
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SEND_MAIL_NOTIFICATION]    Script Date: 27-06-2020 10:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USP_SEND_MAIL_NOTIFICATION]
AS 
BEGIN
select SUBJECT,DESCRYPTION,EMAIL INTO #TEMPTABLE from Reminder_Data WHERE DATE=CAST(GETDATE() AS DATE) AND STATUS=1

DECLARE @counter INT = 1;
DECLARE @EMAIL NVARCHAR(50);
DECLARE @SUBJECT NVARCHAR(50);
DECLARE @DESCRYPTION NVARCHAR(50);

WHILE @counter <= (select count(*) from #TEMPTABLE)
BEGIN
Select Top 1 @EMAIL = EMAIL From #TEMPTABLE
Select Top 1 @SUBJECT = SUBJECT From #TEMPTABLE
Select Top 1 @DESCRYPTION = DESCRYPTION From #TEMPTABLE

Delete Top (1) FROM #TEMPTABLE ;
EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'Notifications',
     @recipients = @EMAIL,
     @body = @DESCRYPTION,
     @subject = @SUBJECT;

END
DROP TABLE #TEMPTABLE
END






GO
/****** Object:  StoredProcedure [dbo].[USP_SETREMINDER]    Script Date: 27-06-2020 10:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_SETREMINDER]  
(@DATE DATE,@SUBJECT NVARCHAR(20),@REMINDER_NAME NVARCHAR(30),@DESCRYPTION NVARCHAR(40),@EMAIL NVARCHAR(40),@MOBILE NVARCHAR(20),  
@SMS NVARCHAR(20),@RECUR NVARCHAR(20))  
--declare @DATE DATE='',@SUBJECT NVARCHAR(20)='',@REMINDER_NAME NVARCHAR(20)='',@DESCRYPTION NVARCHAR(20)='',@EMAIL NVARCHAR(20)='abc',@MOBILE NVARCHAR(20)='',  
--@SMS NVARCHAR(20)='',@RECUR NVARCHAR(20)=''  
AS  
BEGIN  
insert into Reminder_Data values(@DATE ,@SUBJECT,@REMINDER_NAME,@DESCRYPTION ,@EMAIL,@MOBILE,  
@SMS,@RECUR,0)  
END
GO
/****** Object:  StoredProcedure [dbo].[USP_VIEWREMINDER]    Script Date: 27-06-2020 10:30:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USP_VIEWREMINDER]    
(@FROMDATE DATE,@TODATE DATE,@SUBJECT NVARCHAR(20),@EMAIL NVARCHAR(40))    
AS    
BEGIN    
select CONVERT(NVARCHAR,DATE,105) AS DATE,SUBJECT,REMINDER_NAME,DESCRYPTION,EMAIL,MOBILE,SMS_NO,RECUR,  
(CASE WHEN STATUS=0 THEN 'DISABLED' ELSE 'ENABLED' END) AS STATUS from Reminder_Data   
where DATE>=cast(@FROMDATE as date) and DATE<=cast(@TODATE as date) and  
SUBJECT LIKE CASE WHEN LEN(@SUBJECT)>0 THEN @SUBJECT ELSE '%'END   and
EMAIL=@EMAIL
END
GO

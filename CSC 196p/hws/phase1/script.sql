use MlaDatabase;
/****** Object:  User [root]    Script Date: 11/2/2016 8:34:25 PM ******/
/****** Object:  Table [dbo].[admin]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[idAdmin] [nvarchar](12) NOT NULL,
	[firstName] [nvarchar](45) NULL,
	[lastName] [nvarchar](45) NULL,
	[emailId] [nvarchar](45) NULL,
	[telephone] [nvarchar](15) NULL,
	[userId] [bigint] NULL,
	[aliasMailId] [nvarchar](45) NULL,
	[address] [nvarchar](100) NULL,
	[skypeId] [nvarchar](100) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[idAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[grade]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[idGrade] [bigint] IDENTITY(1,1) NOT NULL,
	[instructorGrade] [nvarchar](10) NULL,
	[subject_id] [nvarchar](10) NULL,
	[instructor_id] [nvarchar](12) NULL,
	[student_id] [nvarchar](12) NULL,
	[task_id] [bigint] NULL,
 CONSTRAINT [PK__grade__000000000000024F] PRIMARY KEY CLUSTERED 
(
	[idGrade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[group_roster]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_roster](
	[groupId] [bigint] NULL,
	[userId] [bigint] NULL,
	[mailing_alias] [nvarchar](45) NULL,
	[groupSeqId] [bigint] IDENTITY(2,1) NOT NULL,
 CONSTRAINT [PK__group_roster__00000000000005D2] PRIMARY KEY CLUSTERED 
(
	[groupSeqId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[instructor]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[idInstructor] [nvarchar](12) NOT NULL,
	[firstName] [nvarchar](45) NULL,
	[lastName] [nvarchar](45) NULL,
	[userId] [bigint] NOT NULL,
	[telephone] [nvarchar](15) NULL,
	[address] [nvarchar](100) NULL,
	[aliasMailId] [nvarchar](100) NULL,
	[emailId] [nvarchar](45) NULL,
	[skypeId] [nvarchar](100) NULL,
 CONSTRAINT [PK__instructor__00000000000000AC] PRIMARY KEY CLUSTERED 
(
	[idInstructor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__instructor__0000000000000450] UNIQUE NONCLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[instructor_tasks]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor_tasks](
	[taskId] [bigint] NOT NULL,
	[instructor_Id] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_instructor_tasks] PRIMARY KEY CLUSTERED 
(
	[taskId] ASC,
	[instructor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[interest_group]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interest_group](
	[groupId] [bigint] IDENTITY(5,1) NOT NULL,
	[groupName] [nvarchar](100) NULL,
	[groupDescription] [nvarchar](100) NULL,
	[groupMailingAlias] [nvarchar](100) NULL,
 CONSTRAINT [PK__interest_group__0000000000000307] PRIMARY KEY CLUSTERED 
(
	[groupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[message_table]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_table](
	[msgId] [bigint] IDENTITY(1,1) NOT NULL,
	[fromList] [nvarchar](45) NULL,
	[toList] [nvarchar](1000) NULL,
	[msgSubject] [nvarchar](45) NULL,
	[msgBody] [nvarchar](200) NULL,
	[creationDate] [datetime] NULL,
 CONSTRAINT [PK__message_table__000000000000033A] PRIMARY KEY CLUSTERED 
(
	[msgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[msg_alias_details]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msg_alias_details](
	[msg_alias_id] [bigint] IDENTITY(1,1) NOT NULL,
	[msg_alias] [nvarchar](45) NULL,
	[alias_type] [nvarchar](2) NULL,
 CONSTRAINT [PK__msg_alias_details__0000000000000354] PRIMARY KEY CLUSTERED 
(
	[msg_alias_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[navMenu]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[navMenu](
	[menuId] [bigint] NOT NULL,
	[menuName] [nvarchar](50) NULL,
	[menuType] [nvarchar](12) NULL,
 CONSTRAINT [PK_navMenu] PRIMARY KEY CLUSTERED 
(
	[menuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[register]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[register](
	[userName] [nvarchar](12) NULL,
	[password] [nvarchar](100) NULL,
	[userType] [nvarchar](100) NULL,
	[userId] [bigint] IDENTITY(73,1) NOT NULL,
 CONSTRAINT [PK__register__000000000000037E] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[idStudent] [nvarchar](12) NOT NULL,
	[firstName] [nvarchar](100) NULL,
	[lastName] [nvarchar](100) NULL,
	[emailId] [nvarchar](100) NULL,
	[telephone] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[userId] [bigint] NOT NULL,
	[aliasMailId] [nvarchar](100) NULL,
	[skypeId] [nvarchar](100) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[idStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__student__000000000000044B] UNIQUE NONCLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student_tasks]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_tasks](
	[student_id] [nvarchar](12) NOT NULL,
	[subject_id] [nvarchar](10) NOT NULL,
	[instr_grade] [nvarchar](100) NULL,
	[tasks_id] [bigint] NOT NULL,
 CONSTRAINT [PK__student_tasks__000000000000069F] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[subject_id] ASC,
	[tasks_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subject]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[idSubject] [nvarchar](10) NOT NULL,
	[title] [nvarchar](25) NULL,
	[description] [nvarchar](200) NULL,
	[subjectTerm] [nvarchar](20) NULL,
	[videoEnabled] [nvarchar](3) NULL,
	[audioEnabled] [nvarchar](3) NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[idInstructor] [nvarchar](12) NULL,
	[startTime] [nvarchar](100) NULL,
	[endTime] [nvarchar](100) NULL,
	[mailingAlias] [nvarchar](100) NULL,
	[duration] [int] NULL,
	[subjectType] [nvarchar](5) NULL,
 CONSTRAINT [PK__subject__0000000000000540] PRIMARY KEY CLUSTERED 
(
	[idSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subject_roster]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_roster](
	[subject_id] [nvarchar](10) NOT NULL,
	[student_id] [nvarchar](12) NOT NULL,
	[instructor_id] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_subject_roster] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC,
	[student_id] ASC,
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tasks]    Script Date: 11/2/2016 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tasks](
	[idTask] [bigint] IDENTITY(53,1) NOT NULL,
	[subject_id] [nvarchar](10) NULL,
	[instructor_id] [nvarchar](12) NULL,
	[topic] [nvarchar](20) NULL,
	[description] [nvarchar](100) NULL,
	[schedule_startTime] [datetime] NULL,
	[schedule_endTime] [datetime] NULL,
	[isQuiz] [nvarchar](3) NULL,
	[repeatTask] [nvarchar](100) NULL,
 CONSTRAINT [PK__tasks__00000000000002E5] PRIMARY KEY CLUSTERED 
(
	[idTask] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[admin]  WITH CHECK ADD  CONSTRAINT [register_admin_fk] FOREIGN KEY([userId])
REFERENCES [dbo].[register] ([userId])
GO
ALTER TABLE [dbo].[admin] CHECK CONSTRAINT [register_admin_fk]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [grade_instructor_fk] FOREIGN KEY([instructor_id])
REFERENCES [dbo].[instructor] ([idInstructor])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [grade_instructor_fk]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [grade_student_fk] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([idStudent])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [grade_student_fk]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [grade_subject_fk] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([idSubject])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [grade_subject_fk]
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD  CONSTRAINT [register_instructor_fk] FOREIGN KEY([userId])
REFERENCES [dbo].[register] ([userId])
GO
ALTER TABLE [dbo].[instructor] CHECK CONSTRAINT [register_instructor_fk]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [register_student_fk] FOREIGN KEY([userId])
REFERENCES [dbo].[register] ([userId])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [register_student_fk]
GO
ALTER TABLE [dbo].[student_tasks]  WITH CHECK ADD  CONSTRAINT [st_studentId] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([idStudent])
GO
ALTER TABLE [dbo].[student_tasks] CHECK CONSTRAINT [st_studentId]
GO
ALTER TABLE [dbo].[student_tasks]  WITH CHECK ADD  CONSTRAINT [st_subjectId] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([idSubject])
GO
ALTER TABLE [dbo].[student_tasks] CHECK CONSTRAINT [st_subjectId]
GO
ALTER TABLE [dbo].[student_tasks]  WITH CHECK ADD  CONSTRAINT [st_tests_fk] FOREIGN KEY([tasks_id])
REFERENCES [dbo].[tasks] ([idTask])
GO
ALTER TABLE [dbo].[student_tasks] CHECK CONSTRAINT [st_tests_fk]
GO
ALTER TABLE [dbo].[subject]  WITH CHECK ADD  CONSTRAINT [subj_intr] FOREIGN KEY([idInstructor])
REFERENCES [dbo].[instructor] ([idInstructor])
GO
ALTER TABLE [dbo].[subject] CHECK CONSTRAINT [subj_intr]
GO
ALTER TABLE [dbo].[subject_roster]  WITH CHECK ADD  CONSTRAINT [sr_studentId] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([idStudent])
GO
ALTER TABLE [dbo].[subject_roster] CHECK CONSTRAINT [sr_studentId]
GO
ALTER TABLE [dbo].[subject_roster]  WITH CHECK ADD  CONSTRAINT [sr_subjectId] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([idSubject])
GO
ALTER TABLE [dbo].[subject_roster] CHECK CONSTRAINT [sr_subjectId]
GO
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [task_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([idSubject])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [task_subject]
GO
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [tasks_instructor_fk] FOREIGN KEY([instructor_id])
REFERENCES [dbo].[instructor] ([idInstructor])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [tasks_instructor_fk]
GO
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [tasks_subject_fk] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([idSubject])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [tasks_subject_fk]
GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 11/2/2016 8:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [rds_deny_backups_trigger] ON DATABASE WITH EXECUTE AS 'dbo' FOR
 ADD_ROLE_MEMBER, GRANT_DATABASE AS BEGIN
   SET NOCOUNT ON;
   SET ANSI_PADDING ON;
 
   DECLARE @data xml;
   DECLARE @user sysname;
   DECLARE @role sysname;
   DECLARE @type sysname;
   DECLARE @sql NVARCHAR(MAX);
   DECLARE @permissions TABLE(name sysname PRIMARY KEY);
   
   SELECT @data = EVENTDATA();
   SELECT @type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    
   IF @type = 'ADD_ROLE_MEMBER' BEGIN
      SELECT @user = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
       @role = @data.value('(/EVENT_INSTANCE/RoleName)[1]', 'sysname');

      IF @role IN ('db_owner', 'db_backupoperator') BEGIN
         SELECT @sql = 'DENY BACKUP DATABASE, BACKUP LOG TO ' + QUOTENAME(@user);
         EXEC(@sql);
      END
   END ELSE IF @type = 'GRANT_DATABASE' BEGIN
      INSERT INTO @permissions(name)
      SELECT Permission.value('(text())[1]', 'sysname') FROM
       @data.nodes('/EVENT_INSTANCE/Permissions/Permission')
      AS DatabasePermissions(Permission);
      
      IF EXISTS (SELECT * FROM @permissions WHERE name IN ('BACKUP DATABASE',
       'BACKUP LOG'))
         RAISERROR('Cannot grant backup database or backup log', 15, 1) WITH LOG;       
   END
END


GO
ENABLE TRIGGER [rds_deny_backups_trigger] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [MlaDatabase] SET  READ_WRITE 
GO

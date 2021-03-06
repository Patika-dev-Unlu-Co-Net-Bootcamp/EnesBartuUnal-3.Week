USE [Patika.dev]
GO
/****** Object:  Table [dbo].[EDU_STUDENTS]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDU_STUDENTS](
	[EducationID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SuccesStatus] [int] NULL,
 CONSTRAINT [PK_EDU_STUDENTS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENTS]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENTS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__STUDENTS__3213E83F145C8599] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EDUCATİONS]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDUCATİONS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK__EDUCATİO__3213E83FDF7A01ED] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwStudentListByEDU]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwStudentListByEDU]
as
select e.Name as EducationName,s.name as StudentName from STUDENTS s left join EDU_STUDENTS es 
on s.id=es.StudentID 
join EDUCATİONS e 
on es.EducationID=e.ID 
order by EducationName offset 0 rows
GO
/****** Object:  Table [dbo].[ASİSTANTS]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASİSTANTS](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__ASİSTANT__3213E83F741E2EE9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EDU_ASİSTANTS]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDU_ASİSTANTS](
	[EducationID] [int] NOT NULL,
	[AsistantID] [int] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_EDU_ASİSTANTS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLLCALL]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLLCALL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateWeek] [tinyint] NULL,
	[EduID] [int] NULL,
 CONSTRAINT [PK_ROLLCALL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENTS_ROLLCALLS]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENTS_ROLLCALLS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RollCallID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_STUDENTS_ROLLCALLS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEACHERS]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEACHERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TEACHERS__3213E83F8F0AC9EA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uniqueName] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EDU_ASİSTANTS]  WITH CHECK ADD  CONSTRAINT [FK_EDU_ASİSTANTS_ASİSTANTS] FOREIGN KEY([AsistantID])
REFERENCES [dbo].[ASİSTANTS] ([id])
GO
ALTER TABLE [dbo].[EDU_ASİSTANTS] CHECK CONSTRAINT [FK_EDU_ASİSTANTS_ASİSTANTS]
GO
ALTER TABLE [dbo].[EDU_ASİSTANTS]  WITH CHECK ADD  CONSTRAINT [FK_EDU_ASİSTANTS_EDUCATİONS] FOREIGN KEY([EducationID])
REFERENCES [dbo].[EDUCATİONS] ([ID])
GO
ALTER TABLE [dbo].[EDU_ASİSTANTS] CHECK CONSTRAINT [FK_EDU_ASİSTANTS_EDUCATİONS]
GO
ALTER TABLE [dbo].[EDU_STUDENTS]  WITH CHECK ADD  CONSTRAINT [FK_EDU_STUDENTS_EDUCATİONS] FOREIGN KEY([EducationID])
REFERENCES [dbo].[EDUCATİONS] ([ID])
GO
ALTER TABLE [dbo].[EDU_STUDENTS] CHECK CONSTRAINT [FK_EDU_STUDENTS_EDUCATİONS]
GO
ALTER TABLE [dbo].[EDU_STUDENTS]  WITH CHECK ADD  CONSTRAINT [FK_EDU_STUDENTS_STUDENTS] FOREIGN KEY([StudentID])
REFERENCES [dbo].[STUDENTS] ([id])
GO
ALTER TABLE [dbo].[EDU_STUDENTS] CHECK CONSTRAINT [FK_EDU_STUDENTS_STUDENTS]
GO
ALTER TABLE [dbo].[EDUCATİONS]  WITH CHECK ADD  CONSTRAINT [FK_EDUCATİONS_TEACHERS] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TEACHERS] ([id])
GO
ALTER TABLE [dbo].[EDUCATİONS] CHECK CONSTRAINT [FK_EDUCATİONS_TEACHERS]
GO
ALTER TABLE [dbo].[ROLLCALL]  WITH CHECK ADD  CONSTRAINT [FK_ROLLCALL_EDUCATİONS] FOREIGN KEY([EduID])
REFERENCES [dbo].[EDUCATİONS] ([ID])
GO
ALTER TABLE [dbo].[ROLLCALL] CHECK CONSTRAINT [FK_ROLLCALL_EDUCATİONS]
GO
ALTER TABLE [dbo].[STUDENTS_ROLLCALLS]  WITH CHECK ADD  CONSTRAINT [FK_STUDENTS_ROLLCALLS_ROLLCALL] FOREIGN KEY([RollCallID])
REFERENCES [dbo].[ROLLCALL] ([ID])
GO
ALTER TABLE [dbo].[STUDENTS_ROLLCALLS] CHECK CONSTRAINT [FK_STUDENTS_ROLLCALLS_ROLLCALL]
GO
ALTER TABLE [dbo].[STUDENTS_ROLLCALLS]  WITH CHECK ADD  CONSTRAINT [FK_STUDENTS_ROLLCALLS_STUDENTS] FOREIGN KEY([StudentID])
REFERENCES [dbo].[STUDENTS] ([id])
GO
ALTER TABLE [dbo].[STUDENTS_ROLLCALLS] CHECK CONSTRAINT [FK_STUDENTS_ROLLCALLS_STUDENTS]
GO
ALTER TABLE [dbo].[ASİSTANTS]  WITH CHECK ADD  CONSTRAINT [NameRange3] CHECK  ((len([name])>=(2)))
GO
ALTER TABLE [dbo].[ASİSTANTS] CHECK CONSTRAINT [NameRange3]
GO
ALTER TABLE [dbo].[EDUCATİONS]  WITH CHECK ADD  CONSTRAINT [NameRange4] CHECK  ((len([name])>=(2)))
GO
ALTER TABLE [dbo].[EDUCATİONS] CHECK CONSTRAINT [NameRange4]
GO
ALTER TABLE [dbo].[STUDENTS]  WITH CHECK ADD  CONSTRAINT [NameRange] CHECK  ((len([name])>=(2)))
GO
ALTER TABLE [dbo].[STUDENTS] CHECK CONSTRAINT [NameRange]
GO
ALTER TABLE [dbo].[TEACHERS]  WITH CHECK ADD  CONSTRAINT [NameRange2] CHECK  ((len([name])>=(2)))
GO
ALTER TABLE [dbo].[TEACHERS] CHECK CONSTRAINT [NameRange2]
GO
/****** Object:  StoredProcedure [dbo].[spAddStudentToEDU]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAddStudentToEDU](@EDUname nvarchar(50),@StudentName nvarchar(50))
as
begin
	declare @EDUid int
	set @EDUid=(select e.ID from EDUCATİONS e where e.Name=@EDUname)
	
			declare @STUid int
			set @STUid=(select s.id from STUDENTS s where s.name=@StudentName)
		
			if((select COUNT(r.EduId) from ROLLCALL r where r.EduId=@EDUid)=0)
				begin
					print 'Wrong Education Name or the start and end dates of this education are not specified. Please enter the start and end dates for this education.'
				end
			else
				begin
					if not exists(
					select r.DateWeek from EDU_STUDENTS es join EDUCATİONS e on e.ID=es.EducationID
					join ROLLCALL r on e.ID=r.EduID
					where es.StudentID=@STUid and es.EducationID=@EDUid group by r.DateWeek having COUNT(*)>0)
						begin
							insert EDU_STUDENTS(EducationID,StudentID) values (@EDUid,@STUid)
						end
					else
						begin
							PRINT 'There is another education that conflicts with this education or you try 
enrolling a student in the same training twice'
						end
				end
		
	

end
GO
/****** Object:  StoredProcedure [dbo].[spCreate_Edu]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spCreate_Edu](@EDUname nvarchar(50),@TeacherName nvarchar(50))
	as
	begin
		declare @TeacherID int
		set @TeacherID=(select t.id from TEACHERS t where  t.name=@TeacherName)
		insert EDUCATİONS(Name,TeacherID) values (@EDUname,@TeacherID)
		
	end
GO
/****** Object:  StoredProcedure [dbo].[spCreate_RollCall]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spCreate_RollCall](@EDUname nvarchar(50),@Started_Week tinyint,@Sum_week int)
	as
	begin
		
		declare @EduID int
		set @EduID=(select e.ID from EDUCATİONS e where e.Name=@EDUname)
		declare @i int=0
		while @i<@Sum_week
		begin
			insert ROLLCALL(DateWeek,EduID) values (@Started_Week+@i,@EduID)
			set @i=@i+1
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[spCreate_Teacher]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spCreate_Teacher](@Name nvarchar(50))
as
begin
insert TEACHERS(name) values (@Name)
end
GO
/****** Object:  StoredProcedure [dbo].[spTake_RollCall]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spTake_RollCall](@StudentName nvarchar(50),@EDUname nvarchar(50),@DateWeek tinyint)
as
begin

	declare @STUid int
	if((select COUNT(s.id) from STUDENTS s where s.name=@StudentName)=0)
		begin
			print 'Check student name!'
		end
	else
		begin
			set @STUid=(select s.id from STUDENTS s where s.name=@StudentName)
			declare @EDUid int
			set @EDUid=(select e.ID from EDUCATİONS e where e.Name=@EDUname)
			if((select COUNT(r.EduId) from ROLLCALL r where r.EduId=@EDUid)=0)
				begin
					print 'Wrong Education Name or the start and end dates of this education are not specified. Please enter the start and end dates for this education.'
				end
			else
				begin
					if((select COUNT(r.EduId) from ROLLCALL r where r.EduId=@EDUid and r.DateWeek=@DateWeek)=0)
						begin
							print 'Check DateWeek.There is not this week'
						end
					else
						begin
							declare @RollcallID int
							set @RollcallID=( select r.ID from ROLLCALL r where r.EduID=@EDUid and r.DateWeek=@DateWeek)
							insert STUDENTS_ROLLCALLS(RollCallID,StudentID) values (@RollcallID,@STUid)
						end
				end
		end
end
GO
/****** Object:  Trigger [dbo].[tgSuccessStatusUpdate]    Script Date: 5.02.2022 19:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[tgSuccessStatusUpdate]
on [dbo].[STUDENTS_ROLLCALLS]
after insert
as
begin
	declare @EDUıd int
	set @EDUıd=(select r.EduID from ROLLCALL r where r.ID=(select ins.RollCallID from inserted as ins))
	declare @JoinedWeek float
	declare @studentId int
	set @studentId=(select i.StudentID from inserted as i)
	set @JoinedWeek=(select COUNT(r.DateWeek) from ROLLCALL r join STUDENTS_ROLLCALLS sr on r.ID=sr.RollCallID
	where  r.EduID=@EDUıd and sr.StudentID=@studentId) 
	declare @SumWeek float
	set @SumWeek=(select COUNT(r.DateWeek) from ROLLCALL r where  r.EduID=@EDUıd)
	declare @SuccesStatus float
	set @SuccesStatus=(@JoinedWeek/@SumWeek)*100
	Update EDU_STUDENTS 
	set SuccesStatus=@SuccesStatus where EDU_STUDENTS.EducationID=@EDUıd and EDU_STUDENTS.StudentID=@studentId
end
GO
ALTER TABLE [dbo].[STUDENTS_ROLLCALLS] ENABLE TRIGGER [tgSuccessStatusUpdate]
GO

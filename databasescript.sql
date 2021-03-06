USE [master]
GO
/****** Object:  Database [FinalProject]    Script Date: 5/3/2022 8:51:40 PM ******/
CREATE DATABASE [FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject', FILENAME = N'D:\Spring2021\MSSQL15.SQLEXPRESS\MSSQL\DATA\FinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProject_log', FILENAME = N'D:\Spring2021\MSSQL15.SQLEXPRESS\MSSQL\DATA\FinalProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinalProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalProject] SET QUERY_STORE = OFF
GO
USE [FinalProject]
GO
/****** Object:  Table [dbo].[Comment_Like]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment_Like](
	[UserID] [int] NOT NULL,
	[CommentID] [int] NOT NULL,
	[isLike] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[user_send] [int] NULL,
	[user_receive] [int] NULL,
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[lastModify] [datetime] NULL,
 CONSTRAINT [PK_Conversation] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[featureID] [int] IDENTITY(1,1) NOT NULL,
	[featureName] [varchar](150) NULL,
	[url] [varchar](1000) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[groupID] [int] IDENTITY(1,1) NOT NULL,
	[groupName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Feature]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Feature](
	[featureID] [int] NOT NULL,
	[groupID] [int] NOT NULL,
 CONSTRAINT [PK_Group_Feature] PRIMARY KEY CLUSTERED 
(
	[featureID] ASC,
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[ID] [int] NOT NULL,
	[userID] [int] NULL,
	[sourceID] [int] NULL,
	[isLike] [bit] NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Main_Tag]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Tag](
	[mtid] [varchar](50) NOT NULL,
	[des] [nvarchar](150) NULL,
 CONSTRAINT [PK_Main_Tag] PRIMARY KEY CLUSTERED 
(
	[mtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainTag_Question]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainTag_Question](
	[mtid] [varchar](50) NOT NULL,
	[questionid] [int] NOT NULL,
 CONSTRAINT [PK_MainTag_Question] PRIMARY KEY CLUSTERED 
(
	[mtid] ASC,
	[questionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainTag_User]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainTag_User](
	[mtid] [varchar](50) NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_MainTag_User] PRIMARY KEY CLUSTERED 
(
	[mtid] ASC,
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[MajorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Summary] [nvarchar](150) NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[message_content] [ntext] NULL,
	[createdAt] [datetime] NULL,
	[messageID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[c_id] [int] NULL,
 CONSTRAINT [PK_Message_1] PRIMARY KEY CLUSTERED 
(
	[messageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[toUser] [int] NULL,
	[source] [nchar](10) NULL,
	[fromUser] [int] NULL,
	[sourceID] [int] NULL,
	[isRead] [bit] NULL,
	[type] [nchar](10) NULL,
	[createdAt] [datetime] NULL,
	[notificationID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[notificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[UserID] [int] NULL,
	[title] [nvarchar](max) NULL,
	[summary] [nvarchar](150) NULL,
	[createdAt] [datetime] NULL,
	[content] [nvarchar](max) NULL,
	[majorID] [int] NULL,
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[totalLike] [int] NULL,
	[lastActive] [datetime] NULL,
	[totalComment] [int] NULL,
	[totalViews] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_comment]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[UserID] [int] NULL,
	[content] [ntext] NULL,
	[replyTo] [int] NULL,
	[createdAt] [datetime] NULL,
	[isBest] [bit] NULL,
	[totalReplies] [int] NULL,
	[TotalLike] [int] NULL,
 CONSTRAINT [PK_Question_comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Like]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Like](
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[isLike] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Tag]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Tag](
	[TagID] [nvarchar](50) NOT NULL,
	[QuestionID] [int] NOT NULL,
 CONSTRAINT [PK_Question_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](150) NULL,
	[middleName] [nvarchar](150) NULL,
	[lastName] [nvarchar](150) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](32) NULL,
	[registeredAt] [datetime] NULL,
	[lastLogin] [datetime] NULL,
	[username] [nvarchar](150) NULL,
	[onlineStatus] [bit] NULL,
	[img] [varchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Follow_Tag]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Follow_Tag](
	[UserID] [int] NOT NULL,
	[TagID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User_Follow_Tag] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Group]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Group](
	[groupID] [int] NOT NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_User_Group] PRIMARY KEY CLUSTERED 
(
	[groupID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[views]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[views](
	[mo] [int] NULL,
	[tu] [int] NULL,
	[we] [int] NULL,
	[th] [int] NULL,
	[fr] [int] NULL,
	[sa] [int] NULL,
	[su] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Comment_Like] ([UserID], [CommentID], [isLike]) VALUES (21, 60, NULL)
INSERT [dbo].[Comment_Like] ([UserID], [CommentID], [isLike]) VALUES (21, 72, NULL)
INSERT [dbo].[Comment_Like] ([UserID], [CommentID], [isLike]) VALUES (21, 74, NULL)
GO
SET IDENTITY_INSERT [dbo].[Conversation] ON 

INSERT [dbo].[Conversation] ([user_send], [user_receive], [c_id], [lastModify]) VALUES (2, 4, 29, CAST(N'2022-03-05T15:13:50.520' AS DateTime))
INSERT [dbo].[Conversation] ([user_send], [user_receive], [c_id], [lastModify]) VALUES (1, 4, 31, CAST(N'2022-03-10T22:52:48.183' AS DateTime))
INSERT [dbo].[Conversation] ([user_send], [user_receive], [c_id], [lastModify]) VALUES (1, 2, 36, CAST(N'2022-03-12T09:22:10.463' AS DateTime))
INSERT [dbo].[Conversation] ([user_send], [user_receive], [c_id], [lastModify]) VALUES (1, 5, 37, CAST(N'2022-03-16T10:23:02.570' AS DateTime))
INSERT [dbo].[Conversation] ([user_send], [user_receive], [c_id], [lastModify]) VALUES (2, 5, 38, CAST(N'2022-03-16T10:23:11.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[Conversation] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (1, N'comment', N'/Comment')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (2, N'delete', N'/delete')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (3, N'band', N'/band')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (4, N'post', N'/ask')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (5, N'likecomment', N'/Comment_Like')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (6, N'likepost', N'/Post_Like')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (7, N'followtag', N'/tag')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (8, N'deletemem', N'/admin/deletemem')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (9, N'flag', N'/admin/flag')
INSERT [dbo].[Feature] ([featureID], [featureName], [url]) VALUES (10, N'vote', N'/admin/vote')
SET IDENTITY_INSERT [dbo].[Feature] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([groupID], [groupName]) VALUES (1, N'Admin')
INSERT [dbo].[Group] ([groupID], [groupName]) VALUES (2, N'Moderator')
INSERT [dbo].[Group] ([groupID], [groupName]) VALUES (3, N'User')
INSERT [dbo].[Group] ([groupID], [groupName]) VALUES (4, N'Super Moderator')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (1, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (1, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (1, 3)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (1, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (2, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (2, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (2, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (3, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (3, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (3, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (4, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (4, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (4, 3)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (4, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (5, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (5, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (5, 3)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (5, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (6, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (6, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (6, 3)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (6, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (7, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (7, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (7, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (8, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (8, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (9, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (9, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (9, 4)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (10, 1)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (10, 2)
INSERT [dbo].[Group_Feature] ([featureID], [groupID]) VALUES (10, 4)
GO
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'csd201', NULL)
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'dbi202', NULL)
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'fin202', NULL)
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'mas291', NULL)
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'prf192', NULL)
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'prj301', N' Phát triển back-end cho website bằng công nghệ jsp servlet')
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'pro192', NULL)
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'wdu202', NULL)
INSERT [dbo].[Main_Tag] ([mtid], [des]) VALUES (N'wed201c', N'Thiết kế giao diện front-end cho website')
GO
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 2)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 3)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 4)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 5)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 6)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 7)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 8)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 9)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 10)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 11)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 12)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 13)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 14)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 15)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 16)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 17)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 18)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 19)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 20)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 21)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'prj301', 32)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 23)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 24)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 25)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 26)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 27)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 28)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 29)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 30)
INSERT [dbo].[MainTag_Question] ([mtid], [questionid]) VALUES (N'wed201c', 31)
GO
INSERT [dbo].[MainTag_User] ([mtid], [userid]) VALUES (N'csd201', 1)
INSERT [dbo].[MainTag_User] ([mtid], [userid]) VALUES (N'prj301', 1)
GO
SET IDENTITY_INSERT [dbo].[Major] ON 

INSERT [dbo].[Major] ([MajorID], [Name], [Summary]) VALUES (1, N'Công nghệ thông tin', N'Những câu chuyện về các cô cậu coder')
INSERT [dbo].[Major] ([MajorID], [Name], [Summary]) VALUES (2, N'Quản trị kinh doanh', N'Bao lâu nữa thì bán được 1 tỷ gói mè')
INSERT [dbo].[Major] ([MajorID], [Name], [Summary]) VALUES (3, N'Ngôn ngữ Nhật', N'日本語を学ぶのは簡単です')
INSERT [dbo].[Major] ([MajorID], [Name], [Summary]) VALUES (4, N'Ngôn ngữ Anh', N'VietLish welcome everyone')
INSERT [dbo].[Major] ([MajorID], [Name], [Summary]) VALUES (5, N'Tạm thời chưa có', N'null')
SET IDENTITY_INSERT [dbo].[Major] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'chao dat', CAST(N'2022-03-11T21:21:49.340' AS DateTime), 88, 1, 31)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'ch�o', CAST(N'2022-03-11T21:46:36.950' AS DateTime), 92, 1, 31)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'hello', CAST(N'2022-03-12T09:22:16.810' AS DateTime), 105, 2, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'xin chaof', CAST(N'2022-03-12T22:30:01.500' AS DateTime), 106, 1, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'oi', CAST(N'2022-03-12T22:30:28.273' AS DateTime), 107, 2, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'xin ch�o th�i', CAST(N'2022-03-15T00:03:52.393' AS DateTime), 108, 2, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'xin chao thai', CAST(N'2022-03-15T00:04:03.983' AS DateTime), 109, 2, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'oi', CAST(N'2022-03-15T00:04:10.540' AS DateTime), 110, 1, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'gi', CAST(N'2022-03-15T00:04:22.047' AS DateTime), 111, 1, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'xin chao', CAST(N'2022-03-15T09:02:59.610' AS DateTime), 112, 1, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'toi day', CAST(N'2022-03-15T09:03:03.943' AS DateTime), 113, 2, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'chuc mung nam moi', CAST(N'2022-03-15T09:03:09.333' AS DateTime), 114, 1, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'the a', CAST(N'2022-03-15T09:03:13.610' AS DateTime), 115, 2, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'uhm', CAST(N'2022-03-15T09:03:17.473' AS DateTime), 116, 1, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'sao', CAST(N'2022-03-16T10:20:23.703' AS DateTime), 117, 1, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'khong sao', CAST(N'2022-03-16T10:20:27.893' AS DateTime), 118, 2, 36)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'chao ha', CAST(N'2022-03-16T10:25:26.863' AS DateTime), 119, 1, 37)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'chao trang', CAST(N'2022-03-16T10:43:57.107' AS DateTime), 120, 5, 37)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'chao ha', CAST(N'2022-03-25T13:38:23.140' AS DateTime), 1117, 5, 37)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N't bao ne', CAST(N'2022-03-25T13:38:44.070' AS DateTime), 1118, 5, 37)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'hello', CAST(N'2022-03-25T13:38:48.353' AS DateTime), 1119, 5, 37)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'xin chao', CAST(N'2022-03-25T13:39:36.320' AS DateTime), 1120, 5, 37)
INSERT [dbo].[Message] ([message_content], [createdAt], [messageID], [userID], [c_id]) VALUES (N'thai', CAST(N'2022-03-25T13:46:43.700' AS DateTime), 1121, 1, 37)
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (2, NULL, 5, 30, 0, N'comment   ', CAST(N'2022-03-14T23:14:17.000' AS DateTime), 25)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (2, NULL, 1, 17, 0, N'reply     ', CAST(N'2022-03-14T23:57:32.000' AS DateTime), 26)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (2, NULL, 1, 23, 0, N'comment   ', CAST(N'2022-03-15T00:00:28.000' AS DateTime), 27)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (2, NULL, 1, 17, 0, N'reply     ', CAST(N'2022-03-15T18:49:43.000' AS DateTime), 28)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (2, NULL, 1, 17, 0, N'reply     ', CAST(N'2022-03-15T18:52:39.000' AS DateTime), 29)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (1, NULL, 21, 17, 0, N'comment   ', CAST(N'2022-03-16T19:38:21.000' AS DateTime), 30)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (1, NULL, 21, 17, 0, N'reply     ', CAST(N'2022-03-16T19:38:21.000' AS DateTime), 31)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (1, NULL, 21, 17, 0, N'comment   ', CAST(N'2022-03-16T19:51:24.000' AS DateTime), 32)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (1, NULL, 21, 17, 0, N'reply     ', CAST(N'2022-03-16T19:51:24.000' AS DateTime), 33)
INSERT [dbo].[Notification] ([toUser], [source], [fromUser], [sourceID], [isRead], [type], [createdAt], [notificationID]) VALUES (1, NULL, 21, 17, 1, N'comment   ', CAST(N'2022-03-16T22:29:26.000' AS DateTime), 34)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.480' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 2, 0, CAST(N'2022-03-12T10:54:12.480' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.483' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 3, 0, CAST(N'2022-03-12T10:54:12.483' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.483' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 4, 0, CAST(N'2022-03-12T10:54:12.483' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.487' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 5, 0, CAST(N'2022-03-12T10:54:12.487' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.487' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 6, 0, CAST(N'2022-03-12T10:54:12.487' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.490' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 7, 0, CAST(N'2022-03-12T10:54:12.490' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.490' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 8, 0, CAST(N'2022-03-12T10:54:12.490' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.493' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 9, 0, CAST(N'2022-03-12T10:54:12.493' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.493' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 10, 0, CAST(N'2022-03-12T10:54:12.493' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.497' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 11, 0, CAST(N'2022-03-12T10:54:12.497' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.500' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 12, 0, CAST(N'2022-03-12T10:54:12.500' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.500' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 13, 0, CAST(N'2022-03-12T10:54:12.500' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.503' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 14, 0, CAST(N'2022-03-12T10:54:12.503' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.507' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 15, 0, CAST(N'2022-03-12T10:54:12.507' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.507' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 16, 0, CAST(N'2022-03-12T10:54:12.507' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.510' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 17, 1, CAST(N'2022-03-18T10:24:30.197' AS DateTime), 12, 603)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.510' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 18, 0, CAST(N'2022-03-12T10:54:12.510' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.510' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 19, 0, CAST(N'2022-03-12T10:54:12.510' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.513' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 20, 0, CAST(N'2022-03-12T10:54:12.513' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (1, N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', N'Hướng dẫn cách chèn thêm dòng trong Excel cực nhanh, đơn giản', CAST(N'2022-03-12T10:54:12.517' AS DateTime), N'Trong bài viết này, Học Excel cơ bản sẽ hướng dẫn một số cách nhanh nhất để thêm dòng mới trong Excel, các phím tắt chèn dòng trong excel. Bạn sẽ biết cách thêm dòng bằng thanh công cụ chuẩn hoặc phím tắt và thêm dòng giữa các dòng có dữ liệu.', NULL, 21, 0, CAST(N'2022-03-12T10:54:12.517' AS DateTime), 0, 1)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.043' AS DateTime), N'Cách để tạo emoji trên website', NULL, 23, 0, CAST(N'2022-03-15T00:00:28.467' AS DateTime), 1, 3)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.043' AS DateTime), N'Cách để tạo emoji trên website', NULL, 24, 0, CAST(N'2022-03-12T15:09:52.043' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.043' AS DateTime), N'Cách để tạo emoji trên website', NULL, 25, 0, CAST(N'2022-03-12T15:09:52.043' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.047' AS DateTime), N'Cách để tạo emoji trên website', NULL, 26, 0, CAST(N'2022-03-12T15:09:52.047' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.047' AS DateTime), N'Cách để tạo emoji trên website', NULL, 27, 0, CAST(N'2022-03-12T15:09:52.047' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.047' AS DateTime), N'Cách để tạo emoji trên website', NULL, 28, 0, CAST(N'2022-03-12T15:09:52.047' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.047' AS DateTime), N'Cách để tạo emoji trên website', NULL, 29, 0, CAST(N'2022-03-12T15:09:52.047' AS DateTime), 0, 0)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.050' AS DateTime), N'Cách để tạo emoji trên website', NULL, 30, 0, CAST(N'2022-03-14T23:14:17.300' AS DateTime), 1, 13)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'Cách để tạo emoji trên website', N'Cách để tạo emoji trên website', CAST(N'2022-03-12T15:09:52.050' AS DateTime), N'Cách để tạo emoji trên website', NULL, 31, 0, CAST(N'2022-03-12T15:09:52.050' AS DateTime), 0, 10)
INSERT [dbo].[Question] ([UserID], [title], [summary], [createdAt], [content], [majorID], [QuestionID], [totalLike], [lastActive], [totalComment], [totalViews]) VALUES (2, N'yyyyy', N'aaaa', CAST(N'2022-03-15T00:01:47.000' AS DateTime), N'aaaa', NULL, 32, 0, CAST(N'2022-03-15T00:01:47.540' AS DateTime), 0, 34)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Question_comment] ON 

INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (58, 17, 1, N'bình luận 1', NULL, CAST(N'2022-03-12T10:58:29.177' AS DateTime), NULL, 4, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (59, 17, 2, N'bình luận 2', NULL, CAST(N'2022-03-12T10:58:29.177' AS DateTime), 0, 1, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (60, 17, 3, N'bình luận 3', NULL, CAST(N'2022-03-12T10:58:29.177' AS DateTime), 1, 0, 1)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (61, 17, 5, N'bình luận 4', 58, CAST(N'2022-03-12T00:00:00.000' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (62, 30, 5, N'bình luận 5', NULL, CAST(N'2022-03-14T23:14:17.290' AS DateTime), 0, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (63, 17, 1, N'trả lời bình luận', 59, CAST(N'2022-03-14T23:57:32.110' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (64, 23, 1, N'chào thuận', 59, CAST(N'2022-03-15T00:00:28.460' AS DateTime), 1, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (68, 17, 1, N'trả lời bình luận 1', 58, CAST(N'2022-03-15T20:24:05.443' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (69, 17, 21, N'trả lời bình luận 1', 58, CAST(N'2022-03-16T19:38:21.483' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (70, 17, 21, N'f', 58, CAST(N'2022-03-16T19:41:12.780' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (71, 17, 21, N'f', 58, CAST(N'2022-03-16T19:41:34.527' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (72, 17, 21, N't', 58, CAST(N'2022-03-16T19:51:24.980' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (73, 17, 21, N':v á à', NULL, CAST(N'2022-03-16T22:29:26.733' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Question_comment] ([CommentID], [QuestionID], [UserID], [content], [replyTo], [createdAt], [isBest], [totalReplies], [TotalLike]) VALUES (74, 17, 1, N'xin chào', NULL, CAST(N'2022-03-18T10:24:30.000' AS DateTime), NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Question_comment] OFF
GO
INSERT [dbo].[Question_Like] ([UserID], [QuestionID], [isLike]) VALUES (21, 17, NULL)
GO
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 2)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 3)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 4)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 5)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 6)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 7)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 8)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 9)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 10)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 11)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 12)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 13)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 14)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 15)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 16)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 17)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 18)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 19)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 20)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaithuat', 21)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 23)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 24)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 25)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 26)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 27)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 28)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 29)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 30)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'giaodien', 31)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 2)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 3)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 4)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 5)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 6)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 7)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 8)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 9)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 10)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 11)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 12)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 13)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 14)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 15)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 16)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 17)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 18)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 19)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 20)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'laptrinhweb', 21)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'tag1', 32)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'tag2', 32)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'tag3', 32)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 23)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 24)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 25)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 26)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 27)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 28)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 29)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 30)
INSERT [dbo].[Question_Tag] ([TagID], [QuestionID]) VALUES (N'thietke', 31)
GO
INSERT [dbo].[Tag] ([TagID]) VALUES (N'')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'123')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'asd')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'asf')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'asfas')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'awe')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'b')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'bv')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'css301')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'dbi202')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'deptrai')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'f')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'fffff')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'fin202')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'ga')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'gaixinh')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'giaithuat')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'giaitri')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'giaodien')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'h')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'hello')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'hoctap')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'ik')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'laptrinhweb')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'mas201')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'mas291')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'prj301')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'son')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'ta')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tag1')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tag2')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tag3')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tg')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'thai')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'thaideptrai')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'thietke')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'thuatoan')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'thuy')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tr')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'trt')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'ttt')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'ttttt')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tuoitom')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'ty')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tyng')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'tyu')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'v')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'yu')
INSERT [dbo].[Tag] ([TagID]) VALUES (N'yuyu')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [firstName], [middleName], [lastName], [email], [password], [registeredAt], [lastLogin], [username], [onlineStatus], [img]) VALUES (1, N'123', N'123', N'123', N'trangqlhs163158@fpt.edu.vn', N'quynhtrang', CAST(N'2001-06-02T00:00:00.000' AS DateTime), CAST(N'2022-04-24T09:04:03.783' AS DateTime), N'quynhtrang', 0, N'user1.jpg')
INSERT [dbo].[User] ([UserID], [firstName], [middleName], [lastName], [email], [password], [registeredAt], [lastLogin], [username], [onlineStatus], [img]) VALUES (2, N'234', N'234', N'234', N'giangnhhs153143@fpt.edu.vn', N'huonggiang', CAST(N'2001-06-02T00:00:00.000' AS DateTime), CAST(N'2022-03-16T10:20:58.660' AS DateTime), N'huonggiang', 0, N'user2.jpg')
INSERT [dbo].[User] ([UserID], [firstName], [middleName], [lastName], [email], [password], [registeredAt], [lastLogin], [username], [onlineStatus], [img]) VALUES (3, NULL, NULL, NULL, N'linhdhhe156174@fpt.edu.vn', N'khanhlinh', NULL, CAST(N'2022-03-21T14:30:59.423' AS DateTime), N'khanhlinh', 0, N'user3.jpg')
INSERT [dbo].[User] ([UserID], [firstName], [middleName], [lastName], [email], [password], [registeredAt], [lastLogin], [username], [onlineStatus], [img]) VALUES (5, N'ha', N'ha', N'ha', N'hanths151145@fpt.edu.vn', N'thuha', NULL, CAST(N'2022-03-16T23:05:57.877' AS DateTime), N'thuha', 0, N'user5.jpg')
INSERT [dbo].[User] ([UserID], [firstName], [middleName], [lastName], [email], [password], [registeredAt], [lastLogin], [username], [onlineStatus], [img]) VALUES (6, N'linh', N'linh', N'linh', NULL, N'thulinh', NULL, CAST(N'2022-03-13T16:00:39.613' AS DateTime), N'thulinh', 0, NULL)
INSERT [dbo].[User] ([UserID], [firstName], [middleName], [lastName], [email], [password], [registeredAt], [lastLogin], [username], [onlineStatus], [img]) VALUES (8, NULL, NULL, NULL, NULL, N'thuthao', NULL, NULL, N'thuthao', 0, NULL)
INSERT [dbo].[User] ([UserID], [firstName], [middleName], [lastName], [email], [password], [registeredAt], [lastLogin], [username], [onlineStatus], [img]) VALUES (21, NULL, NULL, NULL, N'thainmhe153666@fpt.edu.vn', NULL, CAST(N'2022-03-16T19:33:25.353' AS DateTime), CAST(N'2022-04-02T19:48:02.600' AS DateTime), N'mra', 0, N'user21.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User_Group] ([groupID], [userID]) VALUES (1, 1)
INSERT [dbo].[User_Group] ([groupID], [userID]) VALUES (2, 2)
INSERT [dbo].[User_Group] ([groupID], [userID]) VALUES (2, 5)
INSERT [dbo].[User_Group] ([groupID], [userID]) VALUES (3, 6)
INSERT [dbo].[User_Group] ([groupID], [userID]) VALUES (3, 8)
INSERT [dbo].[User_Group] ([groupID], [userID]) VALUES (3, 21)
INSERT [dbo].[User_Group] ([groupID], [userID]) VALUES (4, 3)
GO
INSERT [dbo].[views] ([mo], [tu], [we], [th], [fr], [sa], [su]) VALUES (7, 0, 0, 0, 4, 2, 0)
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [total_like]  DEFAULT ((0)) FOR [totalLike]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [commentnum]  DEFAULT ((0)) FOR [totalComment]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [viewnum]  DEFAULT ((0)) FOR [totalViews]
GO
ALTER TABLE [dbo].[Question_comment] ADD  CONSTRAINT [totalrep]  DEFAULT ((0)) FOR [totalReplies]
GO
ALTER TABLE [dbo].[Question_comment] ADD  CONSTRAINT [Likenum]  DEFAULT ((0)) FOR [TotalLike]
GO
ALTER TABLE [dbo].[Comment_Like]  WITH CHECK ADD  CONSTRAINT [FK__Comment_L__Comme__40F9A68C] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Question_comment] ([CommentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment_Like] CHECK CONSTRAINT [FK__Comment_L__Comme__40F9A68C]
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Feature] FOREIGN KEY([featureID])
REFERENCES [dbo].[Feature] ([featureID])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Feature]
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Group] FOREIGN KEY([groupID])
REFERENCES [dbo].[Group] ([groupID])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Group]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Question] FOREIGN KEY([sourceID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Question]
GO
ALTER TABLE [dbo].[MainTag_Question]  WITH CHECK ADD  CONSTRAINT [FK_MainTag_Question_Main_Tag] FOREIGN KEY([mtid])
REFERENCES [dbo].[Main_Tag] ([mtid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MainTag_Question] CHECK CONSTRAINT [FK_MainTag_Question_Main_Tag]
GO
ALTER TABLE [dbo].[MainTag_Question]  WITH CHECK ADD  CONSTRAINT [FK_MainTag_Question_Question] FOREIGN KEY([questionid])
REFERENCES [dbo].[Question] ([QuestionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MainTag_Question] CHECK CONSTRAINT [FK_MainTag_Question_Question]
GO
ALTER TABLE [dbo].[MainTag_User]  WITH CHECK ADD  CONSTRAINT [FK_MainTag_User_Main_Tag] FOREIGN KEY([mtid])
REFERENCES [dbo].[Main_Tag] ([mtid])
GO
ALTER TABLE [dbo].[MainTag_User] CHECK CONSTRAINT [FK_MainTag_User_Main_Tag]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Conversation] FOREIGN KEY([c_id])
REFERENCES [dbo].[Conversation] ([c_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Conversation]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Question] FOREIGN KEY([sourceID])
REFERENCES [dbo].[Question] ([QuestionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Major] FOREIGN KEY([majorID])
REFERENCES [dbo].[Major] ([MajorID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Major]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_User]
GO
ALTER TABLE [dbo].[Question_Like]  WITH CHECK ADD  CONSTRAINT [FK__Question___Quest__3C34F16F] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question_Like] CHECK CONSTRAINT [FK__Question___Quest__3C34F16F]
GO
ALTER TABLE [dbo].[Question_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Question_Tag_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question_Tag] CHECK CONSTRAINT [FK_Question_Tag_Question]
GO
ALTER TABLE [dbo].[Question_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Question_Tag_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question_Tag] CHECK CONSTRAINT [FK_Question_Tag_Tag]
GO
ALTER TABLE [dbo].[User_Follow_Tag]  WITH CHECK ADD  CONSTRAINT [FK_User_Follow_Tag_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[User_Follow_Tag] CHECK CONSTRAINT [FK_User_Follow_Tag_Tag]
GO
ALTER TABLE [dbo].[User_Group]  WITH CHECK ADD  CONSTRAINT [FK_User_Group_Group] FOREIGN KEY([groupID])
REFERENCES [dbo].[Group] ([groupID])
GO
ALTER TABLE [dbo].[User_Group] CHECK CONSTRAINT [FK_User_Group_Group]
GO
ALTER TABLE [dbo].[User_Group]  WITH CHECK ADD  CONSTRAINT [FK_User_Group_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Group] CHECK CONSTRAINT [FK_User_Group_User]
GO
/****** Object:  StoredProcedure [dbo].[findComment]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[findComment] @comid INT,@questionid INT
AS BEGIN
    DECLARE @page INT;
    SET @page=1;
    WHILE @page <10 BEGIN
	
        IF(@comid in (SELECT tbl.CommentID
FROM(SELECT *, ROW_NUMBER() OVER (ORDER BY q.rs DESC, q.createdAt) AS row_index
     FROM(SELECT q1.CommentID, q1.QuestionID, q1.content, q1.createdAt, u.UserID, u.username, q2.CommentID AS commentid2, q2.QuestionID AS questionid2, q2.content AS content2, q2.createdAt AS createdat2, u2.UserID AS userid2, u2.username AS username2, 1 AS rs, q1.isBest, q1.totalReplies, q1.TotalLike, u.img, u2.img AS img2
          FROM dbo.Question_comment AS q1
               FULL OUTER JOIN dbo.[User] AS u ON u.UserID=q1.UserID
               FULL OUTER JOIN dbo.Question_comment AS q2 ON q2.CommentID=q1.replyTo
               FULL OUTER JOIN dbo.[User] AS u2 ON u2.UserID=q2.UserID
          WHERE q1.QuestionID=@questionid AND q1.isBest IS NULL
          UNION ALL
          SELECT q1.CommentID, q1.QuestionID, q1.content, q1.createdAt, u.UserID, u.username, q2.CommentID AS commentid2, q2.QuestionID AS questionid2, q2.content AS content2, q2.createdAt AS createdat2, u2.UserID AS userid2, u2.username AS username2, 2 AS rs, q1.isBest, q1.totalReplies, q1.TotalLike, u.img, u2.img AS img2
          FROM dbo.Question_comment AS q1
               FULL OUTER JOIN dbo.[User] AS u ON u.UserID=q1.UserID
               FULL OUTER JOIN dbo.Question_comment AS q2 ON q2.CommentID=q1.replyTo
               FULL OUTER JOIN dbo.[User] AS u2 ON u2.UserID=q2.UserID
          WHERE q1.QuestionID=@questionid AND q1.isBest=1
          UNION ALL
          SELECT q1.CommentID, q1.QuestionID, q1.content, q1.createdAt, u.UserID, u.username, q2.CommentID AS commentid2, q2.QuestionID AS questionid2, q2.content AS content2, q2.createdAt AS createdat2, u2.UserID AS userid2, u2.username AS username2, 0 AS rs, q1.isBest, q1.totalReplies, q1.TotalLike, u.img, u2.img AS img2
          FROM dbo.Question_comment AS q1
               FULL OUTER JOIN dbo.[User] AS u ON u.UserID=q1.UserID
               FULL OUTER JOIN dbo.Question_comment AS q2 ON q2.CommentID=q1.replyTo
               FULL OUTER JOIN dbo.[User] AS u2 ON u2.UserID=q2.UserID
          WHERE q1.QuestionID=@questionid AND q1.isBest=0) AS q ) tbl
WHERE row_index>=(@page-1)* 10+1 AND row_index<=@page * 10)) BEGIN SELECT @page;  BREAK; END 
		
		
        SET @page=@page+1;
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertAndReturnGroupID]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAndReturnGroupID] @send INT, @receive int
AS
INSERT INTO dbo.User_Message(user_send, user_receive)
VALUES(@send, -- user_send - int
@receive   -- user_receive - int
    )
	SELECT groupID FROM dbo.User_Message WHERE user_receive = @receive AND user_send = @send
GO
/****** Object:  StoredProcedure [dbo].[userIDCheck]    Script Date: 5/3/2022 8:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[userIDCheck]
(
@userid int
)
as
Begin
if not exists (SELECT * FROM dbo.Conversation WHERE user_send = @userid)
    Begin
           SELECT f.onlineStatus,f.img, f.userID,f.username,f.user_send AS usertwo,f.c_id,f.onlineStatus,f.lastLogin FROM (SELECT u.img, u.onlineStatus, u. lastLogin, c.user_receive AS userID,u.username, c.user_send, c.c_id, c.lastModify FROM dbo.Conversation AS c JOIN dbo.[User] AS u ON u.UserID = c.user_send WHERE c.user_receive = @userid 
		   UNION
		   SELECT u.img, u.onlineStatus, u. lastLogin, c.user_send AS userID, u.username, c.user_receive, c.c_id, c.lastModify FROM dbo.Conversation AS c JOIN dbo.[User] AS u ON u.UserID = c.user_receive WHERE c.user_send = @userid) AS f
		   ORDER BY f.lastModify DESC
    End
Else
    Begin
            SELECT f.onlineStatus,f.img, f.userID,f.username,f.user_receive AS usertwo,f.c_id,f.onlineStatus,f.lastLogin FROM ( SELECT u.img,u.onlineStatus, u. lastLogin,c.user_send AS userID, u.username, c.user_receive, c.c_id, c.lastModify FROM dbo.Conversation AS c JOIN dbo.[User] AS u ON u.UserID = c.user_receive WHERE c.user_send = @userid
			UNION
			SELECT u.img, u.onlineStatus, u. lastLogin, c.user_receive AS userID,u.username, c.user_send, c.c_id, c.lastModify FROM dbo.Conversation AS c JOIN dbo.[User] AS u ON u.UserID = c.user_send WHERE c.user_receive = @userid ) AS f
			 ORDER BY f.lastModify DESC
    End   
END
GO
USE [master]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [libraryMS]    Script Date: 2019-07-26 3:13:28 PM ******/
CREATE DATABASE [libraryMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libraryMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\libraryMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libraryMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\libraryMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [libraryMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libraryMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libraryMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libraryMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libraryMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libraryMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libraryMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [libraryMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [libraryMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libraryMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libraryMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libraryMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libraryMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libraryMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libraryMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libraryMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libraryMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [libraryMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libraryMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libraryMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libraryMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libraryMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libraryMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [libraryMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libraryMS] SET RECOVERY FULL 
GO
ALTER DATABASE [libraryMS] SET  MULTI_USER 
GO
ALTER DATABASE [libraryMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libraryMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libraryMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libraryMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libraryMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'libraryMS', N'ON'
GO
ALTER DATABASE [libraryMS] SET QUERY_STORE = OFF
GO
USE [libraryMS]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2019-07-26 3:13:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[id] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[isbn] [varchar](50) NOT NULL,
	[title] [varchar](50) NULL,
	[subject] [varchar](50) NULL,
	[publisher] [varchar](50) NULL,
	[language] [varchar](50) NULL,
	[numberOfPages] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[account_id] [varchar](50) NULL,
	[role] [varchar](50) NULL,
	[operation] [varchar](50) NULL,
	[date_and_time] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Books]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Books](
	[student_account_id] [varchar](50) NULL,
	[book_isbn] [varchar](50) NULL,
	[returnDate] [date] NOT NULL,
	[overdue] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] NOT NULL,
	[studentName] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phoneNumber] [varchar](50) NULL,
	[account_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'104181', N'8KiUcL0r1H9xmv71w8s2Y4z86w', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'104701', N'YvD3r7z50RgP564Kvhc', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'104736', N'420g13o26180cy7jZ58cW1K8z1v', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'106292', N'0R9cH42WowKTeL81QC', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'106465', N'i568erKEara137TCqgDeUkP7a0ABS3', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'106482', N'9j7hCY9e44tjcvki38lHR7', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'106857', N'5576xg79v79', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'107593', N'ymTy0763Y', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'107797', N'91pdetD2', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'109348', N'rJ0IzN87k4mF06CK0Jd8G2u727O73', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'111429', N'w3dVs3nr2WPyKX3', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'111664', N'Sd1pP1Fn5340h270P3F2', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'115311', N'J1974j5UC99gww4G490tJbe3516', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'116312', N'g9647WCQ5r4Wja9ySiDK53680vNL', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'117295', N'm724TJEM42724390d0191F7', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'118280', N'61o2T0k676U03fR130O4N6cF349G4', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'118479', N'6Gn9lw0G04t9w277a3LHs42', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'119279', N'k0309p1Z97z8f7Y5', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'119527', N'o635z6G16C9EJ76B5Ax4H8I3v50', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'122033', N'8484Z4sKb1Fp3w8y8l32GlcL88vZ788', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'123125', N'bd4Qwb0cqG', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'125078', N'4B397i6eAqKeDXIQH2cdQ71j', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'125158', N'25Hk9n6k5R06635ZiI', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'126198', N'20jIZ2203m8132MRDXc1EzQ14', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'128515', N'2YW5Q75qWcMe3g0n60h6035J65', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'129177', N'C8419HFrA9or7z9bGZ97', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'129947', N'pKo4fA65', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'130269', N'6z21Zz048p', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'130488', N't6j9N641IDjlA7', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'130779', N'7cv6jE18Xr', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'131996', N'hQ1GitX41p39pltfh1syUmG2263i7', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'132168', N'1u1RaY9KP5l44Y437667', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'133297', N'9PLq659a2UP84oH6592', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'133484', N'ls534E365743925J', N'Inactive', N'admin')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'133787', N'R7QFNYkR97ywR8y63D', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'133807', N'g71611g10pg18589jJw6', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'134351', N'54G86986Ue2X71V5m136', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'134416', N'd5y14kGv9ffJm22b4d1j7m873657', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'134747', N'4fhLe39oL4N676', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'136292', N'0846QhZ18h', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'136313', N'7B66521270z4106Q8923n662NXKvov', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'136638', N'0QFuhb590Jm93', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'136682', N'T42TP0AyU1x4025w3s1H45tJPy7', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'137563', N'aB379xud1520Kx7aZGgoc985', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'138284', N'OQP8C2Srbr81b91P3mQ5643Cj8j42q1d', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'138431', N'2WP2rJJS67899', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'139208', N'8yit75mm03C42ge1lI0f2hI35', N'Inactive', N'admin')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'139693', N'etGp6cV9g67dl04K9o9015x603UT', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'139701', N'9vV2U881150VX28F850jGX', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'140227', N'YhQw80J8p8ibi2SXt6334izT8S11', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'140599', N'YA50ax1M5W', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'141106', N'BNnfKlnNt6151890j513N7110', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'141362', N'si18R71G5I412', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'141582', N'585KxUI4Npv7zM796BR9Y141d60', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'141964', N'o746Rt5Qc053', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142144', N'02IN6S5w499kg9K59125909E', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142187', N'z28WUBK864MG724nmXn7HI04i211', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142232', N'06RMrDqn0ZQ9x86P6F5WmJ9vv048', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142527', N'48l2NPFOcu48Lmy', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142615', N'pc68n3rR878Y224du556w59', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142680', N'2k0yf9227JgkzG4', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142870', N'd618914F028o5d78', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'142879', N'3sm658EEVF35foxmG030q1w8IS', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143091', N'4U1679P204w704bT3fB2M5F5', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143127', N'wVNwBwTW16n6w', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143174', N'2a2fImGV6QD88H2p54iR6', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143358', N'45sBQ6Pv', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143453', N'Rk0M05K9x6rCnQd1979d20tU9974S', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143649', N'3u40P9d5p898KAs3Xg4naze3jN', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143674', N'778xx6BG0T7g22', N'Inactive', N'admin')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143745', N'VZsa221YJM802k0B0SA2r6882', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143819', N'd3Z1399Ipzw2q5B9fKLc4', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143825', N'x9538Zc0O6vA263oU1S7H0', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143952', N'I86as222l7O3v96q2', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'143957', N'40p02c1780e5SnTPe32764', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'144064', N'UP3D2I0Hp85Pm997948PdD', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'144248', N'r4696i38yK109', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'144699', N'2vlA5O80bd6vRhqt5o', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'144833', N'4z35QZF1100G15y09I85wF4T14o0556', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'145305', N'ypK595w704DKCr7FKQJJ', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'145329', N'K2b56y2G4jS', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'145342', N'tN3398D254nV2hM90686VwdqU1', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'145531', N'60K3CSP6OXyAyc48wk1qmJ87XA861', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'145585', N'0P54R7dOImeqe', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'146065', N'JT0Q6n7rU5Qo56kMG48OY8w7', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'146481', N'iUA8iD7D97s1Ar2Ls666fVlj8L333g', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'146575', N'knr7O8w649lfwFLWC0qLf8mj90N', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'146717', N'754L982g134Q4559P4i46WTBiyw', N'Inactive', N'admin')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'147158', N'4W06N24o', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'147763', N'q14f2K5247CBO5NDIq9', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'147964', N'U1W145R14oNG4b3Yj3NmRws', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'148156', N'183P4Q6Pd3YT61EYN4U84', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'148157', N'g3cv6473h9Ws925q499000TO2X', N'Inactive', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'148176', N'lsIsOqDIXhT', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'148428', N'6BfeC905QR862zVGV54N', N'Inactive', N'admin')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'admin', N'sa123456', N'Active', N'admin')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'staff1', N'sa123456', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'staff2', N'sa123456', N'Inactive', N'staff')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'student1', N'sa123456', N'Active', N'student')
INSERT [dbo].[Accounts] ([id], [password], [status], [role]) VALUES (N'student2', N'sa123456', N'Inactive', N'student')
GO
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'008838077-7', N'Ergonomic holistic ability', N'Information Technology', N'Mala Rugieri', N'French', 182)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'012941910-9', N'Compatible real-time attitude', N'Novel', N'Carol Beattie', N'French', 894)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'020146449-7', N'Universal global array', N'Information Technology', N'Tasia Staden', N'German', 339)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'024701551-2', N'Seamless uniform process improvement', N'Information Technology', N'Melisa Mongenot', N'French', 592)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'034706875-8', N'Right-sized eco-centric access', N'Business', N'Jameson Noades', N'German', 199)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'043918744-3', N'Persevering bifurcated software', N'Business', N'Kerr Sleightholme', N'German', 377)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'047231367-3', N'Reverse-engineered grid-enabled initiative', N'Information Technology', N'Moina Hambribe', N'German', 182)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'069992673-4', N'Open-source stable conglomeration', N'Science', N'Patricio Abrams', N'German', 871)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'076871374-9', N'Total coherent conglomeration', N'Fiction', N'Gabbie Dedman', N'German', 486)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'089261811-6', N'Decentralized maximized leverage', N'Business', N'Tildy Poynton', N'Spanish', 875)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'093183635-2', N'Implemented upward-trending functionalities', N'Information Technology', N'Torie Stitson', N'Spanish', 432)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'119558659-0', N'Pre-emptive radical open architecture', N'Novel', N'Jasen Fear', N'German', 404)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'132240665-0', N'Pre-emptive intangible conglomeration', N'Information Technology', N'Simone Blewitt', N'German', 970)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'148755175-4', N'Self-enabling maximized open system', N'Information Technology', N'Krissie Langworthy', N'German', 738)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'159939503-7', N'Configurable bifurcated leverage', N'Business', N'Nadiya Montacute', N'German', 225)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'183608636-9', N'Switchable demand-driven installation', N'Fiction', N'Barbara-anne Vittori', N'Spanish', 582)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'184989146-X', N'Switchable clear-thinking open architecture', N'Information Technology', N'Patrizia Lowdham', N'German', 396)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'188630756-3', N'Grass-roots 6th generation synergy', N'Novel', N'Morgen Dunstall', N'French', 556)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'204107255-5', N'Adaptive 24 hour access', N'Information Technology', N'Bartolomeo Scuse', N'German', 934)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'227874528-X', N'Innovative discrete definition', N'Novel', N'Nehemiah Gayther', N'German', 361)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'229976738-X', N'Reactive real-time algorithm', N'Information Technology', N'Mollie Taillard', N'German', 271)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'237165080-3', N'Virtual web-enabled instruction set', N'Information Technology', N'Curtice Ruler', N'German', 186)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'239173373-9', N'Face to face local instruction set', N'Business', N'Veronica Barke', N'English', 308)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'248415457-7', N'Reduced bandwidth-monitored open architecture', N'Information Technology', N'Pepe Augie', N'Spanish', 994)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'267499197-6', N'Right-sized radical data-warehouse', N'Business', N'Lynnett Addicote', N'English', 655)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'298208398-1', N'Up-sized demand-driven definition', N'Novel', N'Jewell Eastcourt', N'German', 770)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'305400587-9', N'Team-oriented responsive algorithm', N'Novel', N'Lanita Jaulmes', N'French', 451)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'308047826-6', N'Managed bottom-line hardware', N'Business', N'Georgi Geeraert', N'German', 385)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'311820138-X', N'Reactive disintermediate artificial intelligence', N'Information Technology', N'Tiphanie Attenbarrow', N'German', 183)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'315357949-0', N'Digitized encompassing matrix', N'Information Technology', N'Gerri Slowan', N'Spanish', 331)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'360051323-0', N'Triple-buffered dedicated database', N'Information Technology', N'Paula Goroni', N'German', 975)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'361688034-3', N'Reduced national infrastructure', N'Novel', N'Ricoriki Ost', N'German', 602)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'373421940-X', N'Organized impactful paradigm', N'Information Technology', N'Janifer Andreasson', N'English', 638)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'379042909-0', N'Sharable zero defect superstructure', N'Information Technology', N'Sibyl Cuncliffe', N'French', 333)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'398575223-0', N'Open-source system-worthy forecast', N'Information Technology', N'Deeanne Holdforth', N'German', 635)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'405145415-0', N'Streamlined coherent matrices', N'Information Technology', N'Jacquie Getsham', N'English', 581)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'442890462-2', N'Phased zero administration circuit', N'Information Technology', N'Egon Wallege', N'German', 387)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'481013650-7', N'Profound analyzing policy', N'Information Technology', N'Mickie Gritton', N'Spanish', 484)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'488526888-5', N'Virtual methodical info-mediaries', N'Information Technology', N'Berget Gauden', N'French', 317)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'495175666-8', N'Function-based 3rd generation open system', N'Science', N'Bryn Bartosek', N'German', 456)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'539249731-4', N'Inverse logistical knowledge user', N'Information Technology', N'Frederic Ayllett', N'German', 370)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'542611641-5', N'Cloned background emulation', N'Information Technology', N'Bidget Sayre', N'German', 615)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'542651118-7', N'Virtual client-server interface', N'Science', N'Katharine Pace', N'Spanish', 387)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'543751169-8', N'Horizontal asymmetric protocol', N'Business', N'Marisa Fair', N'German', 968)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'544153260-2', N'Progressive bi-directional hub', N'Novel', N'Henrik Nussey', N'German', 365)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'544242724-1', N'Enterprise-wide national knowledge base', N'Novel', N'Tracey Southey', N'German', 828)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'546521583-6', N'Streamlined scalable circuit', N'Novel', N'Giulietta Kenan', N'English', 515)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'562409403-5', N'Profit-focused human-resource flexibility', N'Information Technology', N'Agneta Gudyer', N'German', 303)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'572269261-1', N'Virtual explicit parallelism', N'Information Technology', N'Cord Cours', N'German', 845)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'589496470-9', N'Switchable background process improvement', N'Information Technology', N'Alon Hucknall', N'English', 712)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'595099589-9', N'Operative executive concept', N'Novel', N'Cassie Griffithe', N'French', 198)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'623979651-4', N'Balanced asymmetric leverage', N'Business', N'Luci Heeney', N'German', 481)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'627273819-6', N'Inverse upward-trending framework', N'Information Technology', N'Orrin Thurske', N'German', 480)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'632028984-8', N'Cloned explicit firmware', N'Information Technology', N'Noellyn Fritchley', N'German', 719)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'646541899-1', N'Fully-configurable uniform groupware', N'Information Technology', N'Elianore Grenshields', N'German', 258)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'650350051-3', N'Open-source bottom-line ability', N'Novel', N'Tate Mahody', N'French', 860)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'657330255-9', N'Persevering homogeneous interface', N'Information Technology', N'Rossie Windus', N'German', 850)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'669826099-1', N'Secured encompassing service-desk', N'Information Technology', N'Cleopatra O'' Markey', N'German', 227)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'678412249-6', N'User-centric analyzing success', N'Business', N'Cynthie Moreno', N'English', 902)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'679554999-2', N'Organic bifurcated hardware', N'Information Technology', N'Gerry Cohani', N'French', 578)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'686848288-4', N'Vision-oriented client-driven hub', N'Information Technology', N'Drusy Snoday', N'German', 446)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'693929585-2', N'Customizable reciprocal instruction set', N'Information Technology', N'Wilden Wickardt', N'German', 151)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'711358292-3', N'Mandatory even-keeled conglomeration', N'Information Technology', N'Hugues Commander', N'German', 691)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'721854003-1', N'Digitized contextually-based access', N'Finance', N'Burch Pavese', N'Spanish', 959)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'724667966-9', N'Object-based multimedia ability', N'Information Technology', N'Zuzana Shotboulte', N'German', 627)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'724884566-3', N'Down-sized zero defect groupware', N'Business', N'Jewel Prinn', N'German', 619)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'762143107-5', N'Triple-buffered empowering toolset', N'Finance', N'Wilmar Clemitt', N'German', 481)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'794440529-7', N'Proactive contextually-based extranet', N'Novel', N'Mauricio Goudge', N'French', 488)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'798719868-4', N'Diverse 3rd generation open system', N'Information Technology', N'Nichole Andresser', N'German', 189)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'809513547-X', N'Future-proofed homogeneous adapter', N'Science', N'Chrystal Caro', N'German', 190)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'829147803-1', N'Polarised 4th generation success', N'Information Technology', N'Mari Thresher', N'German', 319)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'831164028-9', N'Distributed bi-directional success', N'Science', N'Phip Stroyan', N'Spanish', 117)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'831505288-8', N'Multi-channelled multi-state system engine', N'Information Technology', N'Cale Oloshkin', N'German', 374)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'840745420-6', N'Optional well-modulated challenge', N'Information Technology', N'Jolee Inkster', N'French', 216)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'853741589-8', N'Virtual real-time forecast', N'Information Technology', N'Dixie Durtnell', N'Spanish', 842)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'861747497-1', N'Programmable eco-centric instruction set', N'Science', N'Bevin Enocksson', N'German', 960)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'870134468-4', N'Cross-platform motivating adapter', N'Information Technology', N'Silvie Edsell', N'French', 745)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'893357908-7', N'Open-architected multi-state throughput', N'Finance', N'Kassi Fenna', N'German', 229)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'916664669-3', N'Balanced mobile algorithm', N'Business', N'Bordy Passmore', N'Spanish', 588)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'916664789-4', N'Business-focused intermediate architecture', N'Information Technology', N'Cletis Ryle', N'French', 126)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'919045886-9', N'Business-focused modular capacity', N'Novel', N'Linea Jacobson', N'French', 512)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'940446160-1', N'Reactive 24/7 structure', N'Business', N'Kym Shiell', N'German', 560)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'941075131-4', N'Total reciprocal implementation', N'Business', N'Devin Coonan', N'German', 346)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'953569131-7', N'Open-architected dedicated customer loyalty', N'Information Technology', N'Sile Haverty', N'French', 639)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'968786405-2', N'Organized reciprocal attitude', N'Information Technology', N'Oralle Patemore', N'Spanish', 516)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'975800163-9', N'Upgradable well-modulated capacity', N'Business', N'Jyoti Walne', N'German', 582)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'993871554-0', N'Advanced zero administration benchmark', N'Science', N'Bobinette Bethune', N'French', 980)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'997827091-4', N'Synergistic national challenge', N'Information Technology', N'Basilio Noto', N'German', 534)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'9999-9999', N'Fuck You', N'Fuck You', N'Kaka', N'Hjhj', 999)
INSERT [dbo].[Books] ([isbn], [title], [subject], [publisher], [language], [numberOfPages]) VALUES (N'FAHFANNJ-31314', N'Java Book', N'Information Technology', N'Publisher1', N'English', 357)
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:26:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:28:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-19T15:29:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:29:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:34:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-19T15:38:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T19:35:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-19T20:48:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-21T20:40:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-21T20:46:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-21T20:47:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-21T20:49:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-25T14:23:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T14:39:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-25T14:42:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-25T14:43:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T14:49:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T15:29:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T15:30:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-25T16:02:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T16:04:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T16:42:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-25T16:44:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T16:45:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T16:47:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-25T16:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T08:21:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-26T08:25:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-26T08:27:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T08:27:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-26T09:10:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T09:10:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T09:29:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T09:31:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T09:53:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T09:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:12:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:13:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:15:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:17:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:19:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:21:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:27:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:34:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T10:38:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T11:00:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T11:07:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T11:22:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-26T11:42:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGOUT', CAST(N'2019-03-26T11:55:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T11:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-26T11:58:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-26T11:59:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-26T12:00:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T12:00:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T14:33:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T14:35:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'104181', N'staff', N'LOGOUT', CAST(N'2019-03-26T14:42:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'104736', N'student', N'LOGIN', CAST(N'2019-03-26T14:42:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'104736', N'student', N'LOGIN', CAST(N'2019-03-26T14:48:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'104736', N'student', N'LOGOUT', CAST(N'2019-03-26T14:48:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T14:48:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T15:47:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T15:58:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T16:00:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T16:02:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-26T16:06:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-26T16:06:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-26T16:12:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T16:12:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T16:23:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-26T16:26:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-26T16:30:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T19:04:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-27T14:46:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-27T14:52:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-27T14:54:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-27T14:58:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-27T15:01:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-27T15:01:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-27T15:09:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-27T15:09:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-27T21:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-27T21:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-27T21:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-27T21:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-27T21:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-28T07:44:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-28T07:45:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-28T07:45:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-28T08:04:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-28T08:07:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-28T08:07:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-28T08:09:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-28T08:10:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-28T08:10:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-28T08:11:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-28T08:14:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-05-16T15:35:00' AS SmallDateTime))
GO
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-19T15:27:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff2', N'staff', N'LOGIN', CAST(N'2019-03-19T15:36:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-26T09:53:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T11:55:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'104181', N'staff', N'LOGIN', CAST(N'2019-03-26T14:42:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-27T14:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-28T07:45:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-19T15:37:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-19T15:47:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-25T16:04:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-25T16:35:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T16:05:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T16:25:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-27T21:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-27T21:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-28T08:09:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:36:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-27T21:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-28T07:45:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-28T08:11:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:39:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-21T20:50:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T09:47:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGOUT', CAST(N'2019-03-26T09:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T15:59:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-26T16:05:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-26T16:24:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-26T16:25:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-26T16:27:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-27T21:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-19T15:36:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGOUT', CAST(N'2019-03-26T11:56:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-26T16:30:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T19:04:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-27T21:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-28T08:16:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:36:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-19T15:38:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGOUT', CAST(N'2019-03-25T16:18:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGOUT', CAST(N'2019-03-26T09:47:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'104736', N'student', N'LOGIN', CAST(N'2019-03-26T14:45:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T15:59:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-26T16:23:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-26T16:24:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T19:05:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-27T15:01:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:37:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-19T15:38:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:51:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T09:00:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T16:26:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T19:06:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGOUT', CAST(N'2019-03-27T21:57:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-19T15:55:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-21T20:52:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-25T14:43:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T11:08:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGOUT', CAST(N'2019-03-26T11:09:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T11:09:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGIN', CAST(N'2019-03-26T11:42:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'admin', N'admin', N'LOGIN', CAST(N'2019-03-26T16:04:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-26T16:26:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-26T19:04:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student2', N'student', N'LOGOUT', CAST(N'2019-03-27T15:01:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'student1', N'student', N'LOGIN', CAST(N'2019-03-28T07:45:00' AS SmallDateTime))
INSERT [dbo].[Log] ([account_id], [role], [operation], [date_and_time]) VALUES (N'staff1', N'staff', N'LOGIN', CAST(N'2019-03-28T07:45:00' AS SmallDateTime))
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student2', N'919045886-9', CAST(N'2019-06-08' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student2', N'693929585-2', CAST(N'2019-05-19' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student2', N'940446160-1', CAST(N'2020-05-31' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student2', N'721854003-1', CAST(N'2019-04-03' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student2', N'968786405-2', CAST(N'2019-04-27' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'679554999-2', CAST(N'2019-04-20' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'693929585-2', CAST(N'2019-04-04' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'711358292-3', CAST(N'2019-03-27' AS Date), 1)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'721854003-1', CAST(N'2019-03-15' AS Date), 1)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'724667966-9', CAST(N'2019-04-20' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'442890462-2', CAST(N'2019-04-09' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'FAHFANNJ-31314', CAST(N'2019-04-11' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'993871554-0', CAST(N'2019-04-03' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'248415457-7', CAST(N'2019-04-16' AS Date), 0)
INSERT [dbo].[Student_Books] ([student_account_id], [book_isbn], [returnDate], [overdue]) VALUES (N'student1', N'686848288-4', CAST(N'2019-04-03' AS Date), 0)
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (1, N'Lyell Agglione', N'lagglione0@weibo.com', N'464-196-9413', N'104181')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (2, N'Hadlee Diggar', N'hdiggar1@netscape.com', N'732-342-1770', N'106292')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (3, N'Em Bleiman', N'ebleiman2@prweb.com', N'158-148-5895', N'106465')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (4, N'Olenolin McKerron', N'omckerron3@webnode.com', N'493-631-8772', N'106482')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (5, N'Ingrid Enric', N'ienric4@narod.ru', N'535-982-3139', N'106857')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (6, N'Konstantin Thirlwell', N'kthirlwell5@exblog.jp', N'322-291-8707', N'107797')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (7, N'Seth Matuszynski', N'smatuszynski6@fastcompany.com', N'288-369-3380', N'109348')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (8, N'Ludovico Marchment', N'lmarchment7@drupal.org', N'631-184-8174', N'111429')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (9, N'Carole Levett', N'clevett8@cloudflare.com', N'128-704-5229', N'111664')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (10, N'Rutledge Fairest', N'rfairest9@wisc.edu', N'286-467-5071', N'115311')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (11, N'Jillie Fawckner', N'jfawcknera@wufoo.com', N'362-955-3454', N'116312')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (12, N'Isac Tandey', N'itandeyb@oracle.com', N'400-478-6131', N'117295')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (13, N'Silvie Bicheno', N'sbichenoc@discuz.net', N'921-278-0661', N'118479')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (14, N'Delano Shelborne', N'dshelborned@free.fr', N'289-952-4650', N'122033')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (15, N'Susy Upson', N'supsone@reddit.com', N'637-848-9536', N'123125')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (16, N'Jo ann McCuffie', N'jannf@blinklist.com', N'333-500-4923', N'125078')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (17, N'Franchot Gynne', N'fgynneg@yandex.ru', N'354-914-9152', N'125158')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (18, N'Angelica Sisland', N'asislandh@reuters.com', N'621-726-0025', N'128515')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (19, N'Malissia Hellard', N'mhellardi@nbcnews.com', N'986-256-2070', N'129177')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (20, N'Lillis Campany', N'lcampanyj@wordpress.com', N'385-888-4161', N'129947')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (21, N'Ciel Haddrill', N'chaddrillk@pagesperso-orange.fr', N'228-723-6357', N'130269')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (22, N'Clarita Oldcote', N'coldcotel@cornell.edu', N'850-862-8237', N'130488')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (23, N'Clarey Attree', N'cattreem@artisteer.com', N'630-122-4519', N'131996')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (24, N'Farleigh Gumme', N'fgummen@yolasite.com', N'690-416-3403', N'132168')
INSERT [dbo].[Students] ([id], [studentName], [email], [phoneNumber], [account_id]) VALUES (25, N'Kendra Lomansey', N'klomanseyo@abc.net.au', N'117-694-0335', N'student1')
ALTER TABLE [dbo].[Student_Books]  WITH CHECK ADD FOREIGN KEY([book_isbn])
REFERENCES [dbo].[Books] ([isbn])
GO
ALTER TABLE [dbo].[Student_Books]  WITH CHECK ADD FOREIGN KEY([student_account_id])
REFERENCES [dbo].[Accounts] ([id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([id])
GO
/****** Object:  StoredProcedure [dbo].[GetAccounts]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccounts]
@u int,
@v int
as
begin
 SELECT a.id, a.[password], a.[status], a.[role] FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY [status]) as row 
  FROM dbo.Accounts a
 ) a WHERE a.row >= @u and a.row <= @v and a.[status] != 'Inactive' and a.[role] != 'Admin';
end
GO
/****** Object:  StoredProcedure [dbo].[GetBooks]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetAccounts]    Script Date: 19-Mar-19 2:53:13 PM ******/


create proc [dbo].[GetBooks]
@u int,
@v int,
@s nvarchar(50)
as
begin
 SELECT a.isbn, a.title, a.[subject], a.publisher, a.[language], a.numberOfPages FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY title) as row 
  FROM dbo.Books a where title like ('%'+@s+'%')
 ) a WHERE a.row >= @u and a.row <= @v;
end
GO
/****** Object:  StoredProcedure [dbo].[GetLogs]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetLogs]
@u int,
@v int
as
begin
 SELECT a.[row] AS #, a.account_id, a.[role], a.operation, a.date_and_time FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY date_and_time DESC) as row 
  FROM dbo.Log a
 ) a WHERE a.row >= @u and a.row <= @v
end
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRoles]
@u int,
@v int
as
begin
 SELECT a.id, a.[password], a.[status], a.[role] FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY [role]) as row 
  FROM dbo.Accounts a WHERE a.[role] != 'Admin'
 ) a WHERE a.row >= @u and a.row <= @v;
end
GO
/****** Object:  StoredProcedure [dbo].[GetStudentBooks]    Script Date: 2019-07-26 3:13:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[GetAccounts]    Script Date: 19-Mar-19 2:53:13 PM ******/


create proc [dbo].[GetStudentBooks]
@u int,
@v int,
@s nvarchar(50)
as
begin
 SELECT isbn, title, publisher, returnDate, overdue FROM ( 
  SELECT b.isbn, b.title, b.publisher, sb.returnDate, sb.overdue, ROW_NUMBER() OVER (ORDER BY title) as row 
  from Student_Books sb, Books b
where sb.book_isbn = b.isbn and student_account_id = @s
 ) a WHERE a.row >= @u and a.row <= @v order by overdue desc;
end
GO
USE [master]
GO
ALTER DATABASE [libraryMS] SET  READ_WRITE 
GO

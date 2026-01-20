USE [MatchingDonorsDB]
GO
/****** Object:  Table [dbo].[Donors]    Script Date: 20-01-2026 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donors](
	[DonorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[BloodType] [nvarchar](max) NULL,
	[ContactEmail] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[DonorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Donors] ON 

INSERT [dbo].[Donors] ([DonorID], [FirstName], [LastName], [BloodType], [ContactEmail], [City]) VALUES (1, N'Alex', N'Smith', N'O-', N'alex@example.com', N'Boston')
INSERT [dbo].[Donors] ([DonorID], [FirstName], [LastName], [BloodType], [ContactEmail], [City]) VALUES (2, N'Jane', N'Doe', N'O+', NULL, N'New York')
INSERT [dbo].[Donors] ([DonorID], [FirstName], [LastName], [BloodType], [ContactEmail], [City]) VALUES (4, N'Lara', N'Green', N'A-', NULL, N'Edison')
INSERT [dbo].[Donors] ([DonorID], [FirstName], [LastName], [BloodType], [ContactEmail], [City]) VALUES (5, N'Monica', N'Evens', N'AB+', NULL, N'Warrensburg')
INSERT [dbo].[Donors] ([DonorID], [FirstName], [LastName], [BloodType], [ContactEmail], [City]) VALUES (6, N'Tom', N'Recks', N'B-', NULL, N'New Jersey')
INSERT [dbo].[Donors] ([DonorID], [FirstName], [LastName], [BloodType], [ContactEmail], [City]) VALUES (7, N'Chris', N'Oman', N'B+', NULL, N'Chicago')
INSERT [dbo].[Donors] ([DonorID], [FirstName], [LastName], [BloodType], [ContactEmail], [City]) VALUES (8, N'Imran', N'Ali', N'AB-', NULL, N'Las Vegas')
SET IDENTITY_INSERT [dbo].[Donors] OFF
GO

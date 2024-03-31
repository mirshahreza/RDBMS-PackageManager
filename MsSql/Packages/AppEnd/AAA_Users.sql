-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2024-03-31
-- Description:	Table to hold users - AppEnd LowCode system
-- =============================================
CREATE TABLE [dbo].[AAA_Users](
	[Id] [bigint] IDENTITY(100000,1) NOT NULL,
	[Gender] [int] NULL,
	[IsBuiltIn] [bit] NOT NULL,
	[UserName] [nvarchar](64) NOT NULL,
	[Email] [varchar](64) NULL,
	[Mobile] [varchar](14) NULL,
	[Picture_FileBody] [image] NULL,
	[Picture_FileBody_xs] [image] NULL,
	[Picture_FileName] [nvarchar](128) NULL,
	[Picture_FileSize] [int] NULL,
	[Picture_FileMime] [varchar](32) NULL,
	[Password] [varchar](256) NULL,
	[PasswordUpdatedBy] [nvarchar](64) NULL,
	[PasswordUpdatedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsActiveUpdatedBy] [nvarchar](64) NULL,
	[IsActiveUpdatedOn] [datetime] NULL,
	[LoginLocked] [bit] NOT NULL,
	[LoginLockedUpdatedOn] [datetime] NULL,
	[LoginTry] [bit] NULL,
	[LoginTryFails] [int] NULL,
	[LoginTryOn] [datetime] NULL,
	[Settings] [ntext] NULL,
	[CreatedBy] [nvarchar](64) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](64) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_AppEnd_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

ALTER TABLE [dbo].[AAA_Users] ADD  CONSTRAINT [IsBuiltIn_Default]  DEFAULT ('0') FOR [IsBuiltIn];

ALTER TABLE [dbo].[AAA_Users] ADD  CONSTRAINT [IsActive_Default]  DEFAULT ('1') FOR [IsActive];

ALTER TABLE [dbo].[AAA_Users] ADD  CONSTRAINT [LoginLocked_Default]  DEFAULT ('0') FOR [LoginLocked];

ALTER TABLE [dbo].[AAA_Users] ADD  CONSTRAINT [LoginFailed_Default]  DEFAULT ('0') FOR [LoginTryFails];

ALTER TABLE [dbo].[AAA_Users]  WITH CHECK ADD  CONSTRAINT [AppEnd_Users_Gender_AppEnd_BaseInfo_Id] FOREIGN KEY([Gender])
REFERENCES [dbo].[Common_BaseInfo] ([Id]);

ALTER TABLE [dbo].[AAA_Users] CHECK CONSTRAINT [AppEnd_Users_Gender_AppEnd_BaseInfo_Id];

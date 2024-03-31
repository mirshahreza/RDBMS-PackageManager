-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2024-03-31
-- Description:	Table to hold roles of users - AppEnd LowCode system
-- =============================================
CREATE TABLE [dbo].[AAA_Users_R_Roles](
	[Id] [bigint] IDENTITY(1000000,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedBy] [nvarchar](64) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_AppEnd_Users_R_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];

ALTER TABLE [dbo].[AAA_Users_R_Roles]  WITH CHECK ADD  CONSTRAINT [AAA_Users_R_Roles_RoleId_AAA_Roles_Id] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AAA_Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE [dbo].[AAA_Users_R_Roles] CHECK CONSTRAINT [AAA_Users_R_Roles_RoleId_AAA_Roles_Id];

ALTER TABLE [dbo].[AAA_Users_R_Roles]  WITH NOCHECK ADD  CONSTRAINT [AppEnd_Users_R_Roles_UserId_AppEnd_Users_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[AAA_Users] ([Id])
ON DELETE CASCADE;
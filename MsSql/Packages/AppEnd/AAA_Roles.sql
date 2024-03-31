-- =============================================
-- Author:		Mohsen Mirshahreza
-- Create date: 2024-03-31
-- Description:	Table to hold roles - AppEnd LowCode system
-- =============================================
CREATE TABLE [DBO].[AAA_Roles](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[IsBuiltIn] [bit] NULL,
	[RoleName] [nvarchar](64) NOT NULL,
	[Note] [nvarchar](256) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_AppEnd_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];

ALTER TABLE [dbo].[AAA_Roles] ADD  CONSTRAINT [AppEnd_Roles_IsBuiltIn_Default]  DEFAULT ('0') FOR [IsBuiltIn];

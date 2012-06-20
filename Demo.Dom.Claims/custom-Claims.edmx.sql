
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/20/2012 15:09:31
-- Generated from EDMX file: D:\GITHUB\danhaywood\nomvc-contrib\Demo.Dom.Claims\Claims.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Contrib];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO


-- --------------------------------------------------
-- CUSTOMER: Dropping views that correspond to the subtype tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Claims_FreeScooterClaim]', 'V') IS NOT NULL
    DROP VIEW [dbo].[Claims_FreeScooterClaim];
GO
IF OBJECT_ID(N'[dbo].[Claims_FreeBusPassClaim]', 'V') IS NOT NULL
    DROP VIEW [dbo].[Claims_FreeBusPassClaim];
GO
IF OBJECT_ID(N'[dbo].[Claims_FreeSchoolMealsClaim]', 'V') IS NOT NULL
    DROP VIEW [dbo].[Claims_FreeSchoolMealsClaim];
GO


-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FreeScooterClaim_inherits_Claim]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Claims_FreeScooterClaim] DROP CONSTRAINT [FK_FreeScooterClaim_inherits_Claim];
GO
IF OBJECT_ID(N'[dbo].[FK_FreeBusPassClaim_inherits_Claim]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Claims_FreeBusPassClaim] DROP CONSTRAINT [FK_FreeBusPassClaim_inherits_Claim];
GO
IF OBJECT_ID(N'[dbo].[FK_FreeSchoolMealsClaim_inherits_Claim]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Claims_FreeSchoolMealsClaim] DROP CONSTRAINT [FK_FreeSchoolMealsClaim_inherits_Claim];
GO


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Claims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Claims];
GO
IF OBJECT_ID(N'[dbo].[Claims_FreeScooterClaim]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Claims_FreeScooterClaim];
GO
IF OBJECT_ID(N'[dbo].[Claims_FreeBusPassClaim]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Claims_FreeBusPassClaim];
GO
IF OBJECT_ID(N'[dbo].[Claims_FreeSchoolMealsClaim]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Claims_FreeSchoolMealsClaim];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Claims'
CREATE TABLE [dbo].[Claims] (
    [Id] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
	[Discriminator] nvarchar(255) NULL   -- custom
);
GO



-- --------------------------------------------------
-- CUSTOM: Creating views instead of subtype tables
-- --------------------------------------------------

-- for 'Claims_FreeScooterClaim'
CREATE VIEW [dbo].[Claims_FreeScooterClaim]
  AS SELECT [Id]
       FROM [dbo].Claims
      WHERE [Discriminator] = "FreeScooterClaim"
GO

CREATE TRIGGER [dbo].[Claims_FreeScooterClaim_ins]
  ON [dbo].[Claims_FreeScooterClaim]
  INSTEAD OF INSERT AS
  BEGIN
	UPDATE Claims
	   SET Discriminator = "FreeScooterClaim"
      FROM inserted fsc
	 WHERE Claims.Id = fsc.Id
  END
GO

-- for 'Claims_FreeBusPassClaim'
CREATE VIEW [dbo].[Claims_FreeBusPassClaim] 
  AS SELECT [Id]
       FROM [dbo].Claims
      WHERE [Discriminator] = "FreeBusPassClaim"
GO

CREATE TRIGGER [dbo].[Claims_FreeBusPassClaim_ins]
  ON [dbo].[Claims_FreeBusPassClaim]
  INSTEAD OF INSERT AS
  BEGIN
	UPDATE Claims
	   SET Discriminator = "FreeBusPassClaim"
      FROM inserted fsc
	 WHERE Claims.Id = fsc.Id
  END
GO



-- for 'Claims_FreeSchoolMealsClaim'
CREATE VIEW [dbo].[Claims_FreeSchoolMealsClaim] 
  AS SELECT [Id]
       FROM [dbo].Claims
      WHERE [Discriminator] = "FreeSchoolMealsClaim"
GO

CREATE TRIGGER [dbo].[Claims_FreeSchoolMealsClaim_ins]
  ON [dbo].[Claims_FreeSchoolMealsClaim]
  INSTEAD OF INSERT AS
  BEGIN
	UPDATE Claims
	   SET Discriminator = "FreeSchoolMealsClaim"
      FROM inserted fsc
	 WHERE Claims.Id = fsc.Id
  END
GO




-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Claims'
ALTER TABLE [dbo].[Claims]
ADD CONSTRAINT [PK_Claims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- other PKs removed


-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- all FKs now removed here


-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
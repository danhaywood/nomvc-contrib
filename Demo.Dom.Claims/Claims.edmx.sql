
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
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Claims_FreeScooterClaim'
CREATE TABLE [dbo].[Claims_FreeScooterClaim] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Claims_FreeBusPassClaim'
CREATE TABLE [dbo].[Claims_FreeBusPassClaim] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Claims_FreeSchoolMealsClaim'
CREATE TABLE [dbo].[Claims_FreeSchoolMealsClaim] (
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Claims'
ALTER TABLE [dbo].[Claims]
ADD CONSTRAINT [PK_Claims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Claims_FreeScooterClaim'
ALTER TABLE [dbo].[Claims_FreeScooterClaim]
ADD CONSTRAINT [PK_Claims_FreeScooterClaim]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Claims_FreeBusPassClaim'
ALTER TABLE [dbo].[Claims_FreeBusPassClaim]
ADD CONSTRAINT [PK_Claims_FreeBusPassClaim]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Claims_FreeSchoolMealsClaim'
ALTER TABLE [dbo].[Claims_FreeSchoolMealsClaim]
ADD CONSTRAINT [PK_Claims_FreeSchoolMealsClaim]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id] in table 'Claims_FreeScooterClaim'
ALTER TABLE [dbo].[Claims_FreeScooterClaim]
ADD CONSTRAINT [FK_FreeScooterClaim_inherits_Claim]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Claims]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Claims_FreeBusPassClaim'
ALTER TABLE [dbo].[Claims_FreeBusPassClaim]
ADD CONSTRAINT [FK_FreeBusPassClaim_inherits_Claim]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Claims]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Claims_FreeSchoolMealsClaim'
ALTER TABLE [dbo].[Claims_FreeSchoolMealsClaim]
ADD CONSTRAINT [FK_FreeSchoolMealsClaim_inherits_Claim]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Claims]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
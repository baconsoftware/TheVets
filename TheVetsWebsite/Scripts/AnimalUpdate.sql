﻿/*
Deployment script for aspnet-TheVetsWebsite-20180422040229

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "aspnet-TheVetsWebsite-20180422040229"
:setvar DefaultFilePrefix "aspnet-TheVetsWebsite-20180422040229"
:setvar DefaultDataPath "C:\Users\Developer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Developer\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
PRINT N'Dropping unnamed constraint on [dbo].[Animals]...';


GO
ALTER TABLE [dbo].[Animals] DROP CONSTRAINT [DF__Animals__maxsize__32E0915F];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
/*
The column animaltype on table [dbo].[Animals] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column breed on table [dbo].[Animals] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column temperament on table [dbo].[Animals] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/
GO
PRINT N'Starting rebuilding table [dbo].[Animals]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Animals] (
    [id]                   INT            IDENTITY (1, 1) NOT NULL,
    [animaltype]           NVARCHAR (MAX) NOT NULL,
    [breed]                NVARCHAR (MAX) NOT NULL,
    [minsize]              REAL           NOT NULL,
    [maxsize]              REAL           NOT NULL,
    [minweight]            REAL           NOT NULL,
    [maxweight]            REAL           NOT NULL,
    [energylevel]          INT            NOT NULL,
    [temperament]          NVARCHAR (MAX) NOT NULL,
    [trainability]         INT            NOT NULL,
    [lifespan]             INT            NOT NULL,
    [goodwithkids]         BIT            NOT NULL,
    [goodwithotheranimals] BIT            NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_dbo.Animals1] PRIMARY KEY CLUSTERED ([id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Animals])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Animals] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Animals] ([id], [animaltype], [breed], [minsize], [minweight], [maxweight], [energylevel], [temperament], [trainability], [lifespan], [goodwithkids], [goodwithotheranimals], [maxsize])
        SELECT   [id],
                 [animaltype],
                 [breed],
                 [minsize],
                 [minweight],
                 [maxweight],
                 [energylevel],
                 [temperament],
                 [trainability],
                 [lifespan],
                 [goodwithkids],
                 [goodwithotheranimals],
                 [maxsize]
        FROM     [dbo].[Animals]
        ORDER BY [id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Animals] OFF;
    END

DROP TABLE [dbo].[Animals];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Animals]', N'Animals';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_dbo.Animals1]', N'PK_dbo.Animals', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'The transacted portion of the database update succeeded.'
COMMIT TRANSACTION
END
ELSE PRINT N'The transacted portion of the database update failed.'
GO
DROP TABLE #tmpErrors
GO
PRINT N'Update complete.';


GO
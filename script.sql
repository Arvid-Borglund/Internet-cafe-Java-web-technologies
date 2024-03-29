USE [master]
GO
/****** Object:  Database [GameCenterDatabase]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE DATABASE [GameCenterDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GameCenterDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GameCenterDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GameCenterDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GameCenterDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GameCenterDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameCenterDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameCenterDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameCenterDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameCenterDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GameCenterDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameCenterDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [GameCenterDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [GameCenterDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameCenterDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameCenterDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameCenterDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameCenterDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameCenterDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GameCenterDatabase', N'ON'
GO
ALTER DATABASE [GameCenterDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [GameCenterDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Login [vmdev001\admin001]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [vmdev001\admin001] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [LoginT4Lab]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [LoginT4Lab] WITH PASSWORD=N'IIIjlwwp98PRpShYZMEQxa6d1akzEK5A1cZ9htG8GWs=', DEFAULT_DATABASE=[T4Lab], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [LoginT4Lab] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [Larvid]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [Larvid] WITH PASSWORD=N'C1v8EXpGYs9JaMgW8Q0wrILl4IvpeCtMG9llViCJTCw=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [Larvid] DISABLE
GO
/****** Object:  Login [IIS APPPOOL\DefaultAppPool]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [IIS APPPOOL\DefaultAppPool] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [EntityFramework]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [EntityFramework] WITH PASSWORD=N'jZJ2yWQvRfhcumVW+dhOp0dV66Eb/NzOYR9qOx2jZto=', DEFAULT_DATABASE=[GameCenterDatabase], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [EntityFramework] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [baseUser]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [baseUser] WITH PASSWORD=N'AnuLY/JzqcIfYz9Gn+AjHzog1ctAw74sEERDq6se1qk=', DEFAULT_DATABASE=[GameCenterDatabase], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [baseUser] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [ArvidCronus]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [ArvidCronus] WITH PASSWORD=N'1+UDQXqWaOVZGhA5TRGjVHvEbiDdXpjajAtO6RehyyE=', DEFAULT_DATABASE=[Demo Database NAV (5-0)], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [ArvidCronus] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'KGTrotIM/uLb0VkVzsJZxTI1nKHE3gXhFmfdrpMGq18=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'/pLoBOoLTkGku4XlBgwBdJ3tNRTje8FUEWltv+5LV2Y=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_ServerStateReader##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_ServerStateManager##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_DefinitionReader##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_DatabaseConnector##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_DatabaseManager##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_LoginManager##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_SecurityDefinitionReader##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_PerformanceDefinitionReader##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_ServerSecurityStateReader##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [##MS_ServerPerformanceStateReader##] ADD MEMBER [vmdev001\admin001]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_ServerStateReader##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_ServerStateManager##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_DefinitionReader##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_DatabaseConnector##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_DatabaseManager##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_LoginManager##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_SecurityDefinitionReader##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_PerformanceDefinitionReader##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_ServerSecurityStateReader##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [##MS_ServerPerformanceStateReader##] ADD MEMBER [LoginT4Lab]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_ServerStateReader##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_ServerStateManager##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_DefinitionReader##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_DatabaseConnector##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_DatabaseManager##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_LoginManager##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_SecurityDefinitionReader##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_PerformanceDefinitionReader##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_ServerSecurityStateReader##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [##MS_ServerPerformanceStateReader##] ADD MEMBER [Larvid]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_ServerStateReader##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_ServerStateManager##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_DefinitionReader##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_DatabaseConnector##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_DatabaseManager##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_LoginManager##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_SecurityDefinitionReader##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_PerformanceDefinitionReader##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_ServerSecurityStateReader##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [##MS_ServerPerformanceStateReader##] ADD MEMBER [EntityFramework]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_ServerStateReader##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_ServerStateManager##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_DefinitionReader##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_DatabaseConnector##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_DatabaseManager##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_LoginManager##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_SecurityDefinitionReader##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_PerformanceDefinitionReader##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_ServerSecurityStateReader##] ADD MEMBER [ArvidCronus]
GO
ALTER SERVER ROLE [##MS_ServerPerformanceStateReader##] ADD MEMBER [ArvidCronus]
GO
USE [GameCenterDatabase]
GO
/****** Object:  User [Larvid]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE USER [Larvid] FOR LOGIN [Larvid] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [EntityFramework]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE USER [EntityFramework] FOR LOGIN [EntityFramework] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [baseUser]    Script Date: 5/12/2023 11:35:59 PM ******/
CREATE USER [baseUser] FOR LOGIN [baseUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Larvid]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_owner] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_datareader] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [EntityFramework]
GO
ALTER ROLE [db_datareader] ADD MEMBER [baseUser]
GO
GRANT CONNECT TO [baseUser] AS [dbo]
GO
GRANT CONNECT TO [EntityFramework] AS [dbo]
GO
GRANT CONNECT TO [IIS APPPOOL\DefaultAppPool] AS [dbo]
GO
GRANT CONNECT TO [Larvid] AS [dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[Computer]    Script Date: 5/12/2023 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computer](
	[computerId] [varchar](255) NOT NULL,
	[cpu] [varchar](255) NOT NULL,
	[gpu] [varchar](255) NOT NULL,
	[ram] [int] NOT NULL,
	[dataStorage] [varchar](255) NOT NULL,
	[reserved] [bit] NOT NULL,
 CONSTRAINT [PK__Computer__0DBB971FAF8B99E1] PRIMARY KEY CLUSTERED 
(
	[computerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/12/2023 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[adress] [varchar](255) NOT NULL,
	[phonenumber] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[loyaltyLevel] [int] NOT NULL,
 CONSTRAINT [PK__Customer__B611CB7DBA7F3938] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/12/2023 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeId] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[adress] [varchar](255) NOT NULL,
	[phonenumber] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[hireDate] [date] NOT NULL,
	[jobTitle] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Employee__C134C9C1BC594031] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSchedule]    Script Date: 5/12/2023 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSchedule](
	[employeeId] [varchar](255) NOT NULL,
	[shiftDate] [date] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[shiftResponsibilities] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Employee__A26E26435F997AF0] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC,
	[shiftDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 5/12/2023 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[gameId] [varchar](255) NOT NULL,
	[computerId] [varchar](255) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[genre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Game__DA90B452C233515E] PRIMARY KEY CLUSTERED 
(
	[gameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 5/12/2023 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[loginId] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[customerId] [varchar](255) NULL,
	[employeeId] [varchar](255) NULL,
	[accessLevel] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Login__1F5EF4CFD0AC5BAC] PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[Login] TO [IIS APPPOOL\DefaultAppPool] AS [dbo]
GO
GRANT ALTER ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT CONTROL ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT DELETE ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT INSERT ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT SELECT ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT TAKE OWNERSHIP ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT VIEW DEFINITION ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
GRANT VIEW CHANGE TRACKING ON [dbo].[Login] TO [Larvid] AS [dbo]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 5/12/2023 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[computerId] [varchar](255) NOT NULL,
	[timeDate] [date] NOT NULL,
	[customerId] [varchar](255) NULL,
	[employeeId] [varchar](255) NULL,
 CONSTRAINT [PK__Reservat__4BC549F57434BDC9] PRIMARY KEY CLUSTERED 
(
	[computerId] ASC,
	[timeDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 001', N'AMD Ryzen 5600X', N'AMD Vega 56', 8, N'1.5TB M2 SSD', 1)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 002', N'Intel i7 8700K', N'NVIDIA RTX 2060', 16, N'1TB M2 SSD', 0)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 003', N'AMD Ryzen 5800X', N'NVIDIA RTX 3060', 16, N'1TB M2 SSD', 0)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 004', N'Intel i9 9900K', N'AMD Vega 64', 32, N'2TB M2 SSD', 0)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 005', N'AMD Ryzen 5950X', N'NVIDIA RTX 3070', 32, N'2TB M2 SSD', 0)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 006', N'Intel i9 10900K', N'AMD RX 6700 XT', 64, N'2.5TB M2 SSD', 0)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 007', N'AMD Ryzen 5950X', N'NVIDIA RTX 3080', 64, N'2.5TB M2 SSD', 0)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 008', N'Intel i9 11900K', N'AMD RX 6800 XT', 128, N'3TB M2 SSD', 0)
INSERT [dbo].[Computer] ([computerId], [cpu], [gpu], [ram], [dataStorage], [reserved]) VALUES (N'PCID 009', N'AMD Ryzen 5950X', N'NVIDIA RTX 3090', 128, N'3.5TB M2 SSD', 1)
GO
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 001', N'Larvid', N'Vapenkroken 30', N'046127603', N'Larvid@mail.se', 4)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 002', N'Martha', N'Krukmakargatan 20', N'046127604', N'Martha@mail.se', 1)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 003', N'Nelson', N'Gjutargatan 40', N'046127605', N'Nelson@mail.se', 1)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 004', N'Olivia', N'Herrgårdsgatan 60', N'046127606', N'Olivia@mail.se', 1)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 005', N'Percy', N'Fågelbacksgatan 80', N'046127607', N'Percy@mail.se', 2)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 006', N'Quincy', N'Sparvögsgatan 100', N'046127608', N'Quincy@mail.se', 2)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 007', N'Rita', N'Skogsdungegatan 120', N'046127609', N'Rita@mail.se', 1)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 008', N'Stanley', N'Ängsmarksgatan 140', N'046127610', N'Stanley@mail.se', 0)
INSERT [dbo].[Customer] ([customerId], [name], [adress], [phonenumber], [email], [loyaltyLevel]) VALUES (N'CustID 009', N'Tina', N'Björkdungegatan 160', N'046127611', N'Tina@mail.se', 3)
GO
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 001', N'Arvid', N'Klostergatan 5C', N'0737472566', N'Arvid@mail.se', CAST(N'2023-05-27' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 002', N'Bertil', N'Smedjegatan 2B', N'0701234567', N'Bertil@mail.se', CAST(N'2023-05-28' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 003', N'Cecilia', N'Vasagatan 6D', N'0712345678', N'Cecilia@mail.se', CAST(N'2023-05-29' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 004', N'David', N'Storgatan 9E', N'0723456789', N'David@mail.se', CAST(N'2023-05-30' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 005', N'Erika', N'Brogatan 3F', N'0734567890', N'Erika@mail.se', CAST(N'2023-05-31' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 006', N'Fredrik', N'Kungsgatan 7G', N'0745678901', N'Fredrik@mail.se', CAST(N'2023-06-01' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 007', N'Greta', N'Linnegatan 4H', N'0756789012', N'Greta@mail.se', CAST(N'2023-06-02' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 008', N'Hampus', N'Drottninggatan 8I', N'0767890123', N'Hampus@mail.se', CAST(N'2023-06-03' AS Date), N'Developer')
INSERT [dbo].[Employee] ([employeeId], [name], [adress], [phonenumber], [email], [hireDate], [jobTitle]) VALUES (N'EmpID 009', N'Ida', N'Prinsgatan 5J', N'0778901234', N'Ida@mail.se', CAST(N'2023-06-04' AS Date), N'Developer')
GO
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 001', CAST(N'2023-05-12' AS Date), N'CustID 001', N'EmpID 001')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 001', CAST(N'2023-06-10' AS Date), N'CustID 001', N'EmpID 001')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 002', CAST(N'2023-05-17' AS Date), N'CustID 001', N'EmpID 006')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 002', CAST(N'2023-05-18' AS Date), N'CustID 001', N'EmpID 003')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 002', CAST(N'2023-06-10' AS Date), N'CustID 004', N'EmpID 006')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 003', CAST(N'2023-05-23' AS Date), N'CustID 003', N'EmpID 006')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 004', CAST(N'2023-05-23' AS Date), N'CustID 002', N'EmpID 006')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 004', CAST(N'2023-05-26' AS Date), N'CustID 006', N'EmpID 002')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 006', CAST(N'2023-06-08' AS Date), N'CustID 009', N'EmpID 005')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 007', CAST(N'2023-05-18' AS Date), N'CustID 005', N'EmpID 009')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 007', CAST(N'2023-05-19' AS Date), N'CustID 007', N'EmpID 009')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 008', CAST(N'2023-05-19' AS Date), N'CustID 006', N'EmpID 006')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 009', CAST(N'2023-05-12' AS Date), N'CustID 009', N'EmpID 009')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 009', CAST(N'2023-05-19' AS Date), N'CustID 005', N'EmpID 005')
INSERT [dbo].[Reservation] ([computerId], [timeDate], [customerId], [employeeId]) VALUES (N'PCID 009', CAST(N'2023-06-06' AS Date), N'CustID 009', N'EmpID 005')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__AB6E616446111CC3]    Script Date: 5/12/2023 11:36:00 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__AB6E616446111CC3] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__AB6E616468C38B68]    Script Date: 5/12/2023 11:36:00 PM ******/
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [UQ__Employee__AB6E616468C38B68] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Game__33E936A5B509FABA]    Script Date: 5/12/2023 11:36:00 PM ******/
ALTER TABLE [dbo].[Game] ADD  CONSTRAINT [UQ__Game__33E936A5B509FABA] UNIQUE NONCLUSTERED 
(
	[computerId] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeSchedule]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeS__emplo__412EB0B6] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([employeeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeSchedule] CHECK CONSTRAINT [FK__EmployeeS__emplo__412EB0B6]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK__Game__computerId__4BAC3F29] FOREIGN KEY([computerId])
REFERENCES [dbo].[Computer] ([computerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK__Game__computerId__4BAC3F29]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK__Login__customerI__5AEE82B9] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK__Login__customerI__5AEE82B9]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK__Login__employeeI__5BE2A6F2] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([employeeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK__Login__employeeI__5BE2A6F2]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Computer] FOREIGN KEY([computerId])
REFERENCES [dbo].[Computer] ([computerId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Computer]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Customer]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Employee] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([employeeId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Employee]
GO
USE [master]
GO
ALTER DATABASE [GameCenterDatabase] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [BusBookingSystem]    Script Date: 4/14/2024 8:11:29 PM ******/
CREATE DATABASE [BusBookingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bus_booking_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bus_booking_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bus_booking_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bus_booking_system_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BusBookingSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusBookingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusBookingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusBookingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusBookingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusBookingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusBookingSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusBookingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusBookingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusBookingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusBookingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusBookingSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BusBookingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BusBookingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusBookingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusBookingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusBookingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BusBookingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BusBookingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BusBookingSystem', N'ON'
GO
ALTER DATABASE [BusBookingSystem] SET QUERY_STORE = OFF
GO
USE [BusBookingSystem]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusID] [int] IDENTITY(1,1) NOT NULL,
	[Bus_Name] [varchar](100) NOT NULL,
	[Capacity] [int] NULL,
	[BusNo] [varchar](100) NULL,
	[BusType] [varchar](100) NULL,
	[Model] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRoutes](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[DepartureCity] [varchar](100) NOT NULL,
	[ArrivalCity] [varchar](100) NOT NULL,
	[Distance] [decimal](10, 2) NULL,
	[EstimatedDuration] [int] NULL,
	[BaseFare] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusSchedules]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusSchedules](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[BusID] [int] NULL,
	[RouteID] [int] NULL,
	[DepartureDate] [datetime] NULL,
	[DepartureTime] [datetime] NOT NULL,
	[ArrivalTime] [datetime] NOT NULL,
	[AvailableSeats] [int] NULL,
 CONSTRAINT [PK__BusSched__9C8A5B69430B9F5A] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City_Name] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(100,1) NOT NULL,
	[PaymentMode] [nchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nchar](100) NOT NULL,
	[PaymentStatus] [nchar](100) NOT NULL,
	[ReservationId] [nchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRCodes]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRCodes](
	[QRCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NULL,
	[QRCodeData] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[QRCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[BookingDateTime] [datetime] NOT NULL,
	[Bus_Id] [int] NOT NULL,
	[Charges] [nchar](10) NULL,
	[Reservation_Status] [nchar](100) NULL,
	[IsCancelled] [bit] NULL,
	[No_of_seats] [nchar](10) NULL,
	[Seat_No] [nchar](10) NULL,
	[Additional_luggage] [nchar](10) NULL,
	[Additional_luggage_details] [nchar](255) NULL,
	[CreatedBy] [nchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nchar](100) NULL,
 CONSTRAINT [PK__Reservat__B7EE5F045430630E] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCredentials]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCredentials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserCredentials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Role] [nchar](250) NULL,
	[CreatedBy] [nchar](250) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK__Users__1788CCAC860EFDC2] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Users__A9D105345F1E2598] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusRoutes] ADD  DEFAULT ((50.00)) FOR [BaseFare]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF__Reservati__Booki__2D27B809]  DEFAULT (getdate()) FOR [BookingDateTime]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF__Reservati__IsCan__2E1BDC42]  DEFAULT ((0)) FOR [IsCancelled]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBus]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddBus](
	@Bus_Name VARCHAR(100),
    @Capacity VARCHAR(100),
    @BusNo VARCHAR(100),
    @BusType VARCHAR(100)
)
AS
BEGIN
	INSERT INTO Buses(Bus_Name,Capacity,BusNo,BusType)
	VALUES(@Bus_Name,@Capacity,@BusNo,@BusType)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCity]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddCity](
	@City_Name VARCHAR(100),
    @Country VARCHAR(100),
    @CreatedBy VARCHAR(100)
)
AS
BEGIN
	INSERT INTO Cities(City_Name,Country,CreatedBy,CreatedDate)
	VALUES(@City_Name,@Country,@CreatedBy,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AssignRole]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AssignRole]
	@userID INT,
	@Role VARCHAR(100),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
  BEGIN TRY
	INSERT INTO UserRoles (UserID, [Role],CreatedBy,CreatedDate)
	VALUES(@userID, @Role, 'Admin', GETDATE());
	    SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'Success';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateTicketFare]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CalculateTicketFare]
    @RouteID INT,
    @BusID INT,
    @Fare DECIMAL(10, 2) OUTPUT
AS
BEGIN
    DECLARE @BaseFare DECIMAL(10, 2);
    DECLARE @Multiplier DECIMAL(4, 2);

    -- Get base fare for the given route
    SELECT @BaseFare = BaseFare
    FROM BusRoutes
    WHERE RouteID = @RouteID;

    -- Get multiplier based on bus type (e.g., AC buses may have a higher multiplier)
    SELECT @Multiplier = CASE 
                            WHEN BusType = 'Executive' THEN 2.5
                            ELSE 1.5
                         END
    FROM Buses
    WHERE BusID = @BusID;

    -- Calculate the fare
    SET @Fare = @BaseFare * @Multiplier;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelReservation]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CancelReservation]
	@reservation_ID INT,
	@userID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Reservations WHERE ReservationID = @reservation_ID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @busExists = 1
    BEGIN
        UPDATE Reservations
        SET IsCancelled = 1,
		UpdatedDate=GetDate(),
		UpdatedBy=@userID
        WHERE ReservationID = @reservation_ID;

        SET @message = 'updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Id does not exist';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBusRoute]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create
CREATE PROCEDURE [dbo].[sp_CreateBusRoute]
    @DepartureCity VARCHAR(100),
    @ArrivalCity VARCHAR(100),
    @Distance DECIMAL(10, 2),
    @EstimatedDuration INT,
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO BusRoutes (DepartureCity, ArrivalCity, Distance, EstimatedDuration)
        VALUES (@DepartureCity, @ArrivalCity, @Distance, @EstimatedDuration);

        SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'Bus route created successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;

-- Read
-- Similar output parameters for other CRUD operations
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBusSchedule]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateBusSchedule]
    @BusID INT,
    @RouteID INT,
    @DepartureTime DATETIME,
    @ArrivalTime DATETIME,
    @AvailableSeats INT
AS
BEGIN
    INSERT INTO BusSchedules (BusID, RouteID,DepartureDate, DepartureTime, ArrivalTime, AvailableSeats)
    VALUES (@BusID, @RouteID,@DepartureTime, @DepartureTime, @ArrivalTime, @AvailableSeats);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateReservation]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateReservation]
	--@ReservationID INT,
    @UserID INT,
    @ScheduleID INT,
    @BookingDateTime NVARCHAR(255),
    @Bus_Id INT,
    @Charges INT,
    @CreatedBy NVARCHAR(255),
    @No_of_seats NVARCHAR(255),
    @Seat_No NVARCHAR(255),
    @Additional_luggage NVARCHAR(255),
    @Additional_luggage_details NVARCHAR(255)
AS
BEGIN
    INSERT INTO Reservations (
	--ReservationID,
    UserID,
    ScheduleID,
    BookingDateTime,
    Bus_Id,
    Charges,
    IsCancelled,
    CreatedDate,
    CreatedBy,
    Deleted,
    No_of_seats,
    Seat_No,
    Additional_luggage,
    Additional_luggage_details
)
    VALUES (
	@UserID, 
	@ScheduleID,
    @BookingDateTime,
    @Bus_Id,
    @Charges,
    0,
    GETDATE(),
    @CreatedBy,
    0,
    @No_of_seats,
    @Seat_No,
    @Additional_luggage,
    @Additional_luggage_details
	);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBus]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteBus]
     @busID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Buses WHERE BusID = @busID) THEN 1 ELSE 0 END;

    -- If the bus exists, delete it; otherwise, set a message
    IF @busExists = 1
    BEGIN
        DELETE FROM Buses WHERE BusID = @busID;
        SET @message = 'Bus deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Bus does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBusSchedule]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Delete
CREATE PROCEDURE [dbo].[sp_DeleteBusSchedule]
    @ScheduleID INT
AS
BEGIN
    DELETE FROM BusSchedules
    WHERE ScheduleID = @ScheduleID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCity]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCity]
	 @cityID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @cityExists BIT;

    -- Check if the bus exists
    SELECT @cityExists = CASE WHEN EXISTS (SELECT 1 FROM Cities WHERE Id = @cityID) THEN 1 ELSE 0 END;

    -- If the bus exists, delete it; otherwise, set a message
    IF @cityExists = 1
    BEGIN
        DELETE FROM Cities WHERE Id = @cityID;
        SET @message = 'Bus deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Bus does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRole]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteRole]
	@userID INT,
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
  BEGIN TRY
  DECLARE @userExists BIT;
   SELECT @userExists = CASE WHEN EXISTS (SELECT 1 FROM UserRoles WHERE UserID=@userID) THEN 1 ELSE 0 END;
    IF @userExists = 1
    BEGIN
	DELETE UserRoles WHERE UserID=@userID
	    SET @ResultCode = 1;
        SET @ResultMessage = 'Success';
	END
	ELSE
	BEGIN
	 SET @ResultMessage = 'User does not exist. Unable to delete.';
	 END
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRoute]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteRoute]
	@RouteID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @dataExists BIT;

    SELECT @dataExists = CASE WHEN EXISTS (SELECT 1 FROM [dbo].[BusRoutes] WHERE RouteID = @RouteID) THEN 1 ELSE 0 END;

    IF @dataExists = 1
    BEGIN
        DELETE FROM [BusRoutes] WHERE RouteID = @RouteID;
        SET @message = 'Deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Route does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSchedule]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteSchedule]
	@ScheduleID INT
AS
BEGIN
	DELETE BusSchedules WHERE ScheduleID = @ScheduleID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteUser]
    @userID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @userExists BIT;

    -- Check if the bus exists
    SELECT @userExists = CASE WHEN EXISTS (SELECT 1 FROM [dbo].[Users] WHERE UserID = @userID) THEN 1 ELSE 0 END;

    -- If the bus exists, delete it; otherwise, set a message
    IF @userExists = 1
    BEGIN
        DELETE FROM [Users] WHERE UserID = @userID;
        SET @message = 'User deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'User does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateQRCode]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GenerateQRCode]
    @ReservationID INT,
	@QRCodeData NVARCHAR(255),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
       
        DECLARE @QRCode VARCHAR(MAX) = @QRCodeData; 

        INSERT INTO QRCodes (ReservationID, QRCodeData)
        VALUES (@ReservationID, @QRCodeData);

        SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'QR code generated successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBusData]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBusData]
  @busID INT
AS
BEGIN
    IF @busID = 0
    BEGIN
        SELECT * FROM Buses;
    END
    ELSE
    BEGIN
        SELECT * FROM Buses WHERE BusID = @busID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBusRoute]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBusRoute]
	@routeID INT
AS
BEGIN
    IF @routeID = 0
    BEGIN
        SELECT * FROM BusRoutes;
    END
    ELSE
    BEGIN
        SELECT * FROM BusRoutes WHERE RouteID = @routeID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBusSchedules]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Read
CREATE PROCEDURE [dbo].[sp_GetBusSchedules]
AS
BEGIN
    SELECT * FROM BusSchedules;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCities]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCities]
  @cityID INT
AS
BEGIN
    IF @cityID = 0
    BEGIN
        SELECT * FROM Cities;
    END
    ELSE
    BEGIN
        SELECT * FROM Cities WHERE Id = @cityID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetReservations]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetReservations]
    @reservation_ID INT = NULL,
    @userID INT
AS
BEGIN
    IF @reservation_ID IS NOT NULL AND EXISTS (SELECT 1 FROM [dbo].[Reservations] WHERE ReservationID = @reservation_ID)
    BEGIN
        SELECT * FROM [dbo].[Reservations] WHERE ReservationID = @reservation_ID;
    END
    ELSE
    BEGIN
        SELECT * FROM [dbo].[Reservations] WHERE UserID = @userID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserByEmailAndPassword]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserByEmailAndPassword]
    @Email VARCHAR(255),
    @PasswordHash VARCHAR(255),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT * FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash)
        BEGIN
            SET @ResultCode = 1;  -- 1 for success
            SET @ResultMessage = 'Login successful';
        END
        ELSE
        BEGIN
            SET @ResultCode = 0;  -- 0 for failure
            SET @ResultMessage = 'Invalid email or password';
        END
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUsers]
	@userID INT
AS
BEGIN
	IF @userID = 0
    BEGIN
        SELECT * FROM Users
    END
    ELSE
    BEGIN
        SELECT * FROM Users WHERE UserID = @userID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RegisterUser]
    @Email VARCHAR(255),
    @Password VARCHAR(255),
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @PhoneNumber VARCHAR(50),
    @Gender VARCHAR(50),
	@User_name VARCHAR(50),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
	 DECLARE @UserID INT;
        INSERT INTO Users (Email, FirstName, LastName,PhoneNumber,Gender,
	  CreatedBy,
      CreatedDate,
      UpdatedBy,
      UpdatedDate,
      Deleted)
        VALUES (@Email, @FirstName, @LastName, @PhoneNumber,@Gender,
		@User_name,
		GETDATE(),
		'',
		'',
		0
		);

		 SET @UserID = SCOPE_IDENTITY();

		INSERT INTO UserCredentials(UserID, [Password],
		  CreatedBy,
		  CreatedDate,
		  UpdatedBy,
		  UpdatedDate
		)
		VALUES (@UserID, @Password, @User_name,GETDATE(),'','');

        SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'User created successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchBusSchedule]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SearchBusSchedule]
    @departureCity VARCHAR(255),
    @arrivalCity VARCHAR(255),
    @departureTime DATETIME,
	@numberOfPassangers VARCHAR(255)
AS
BEGIN
   SELECT  bs.BusID,
        br.RouteID,
        br.DepartureCity,
        br.ArrivalCity,
		br.EstimatedDuration,
		br.BaseFare,
		bs.DepartureDate,
        bs.DepartureTime,
        bs.ArrivalTime,
		bs.AvailableSeats,
		(SELECT [Bus_Name] FROM Buses Where BusID = bs.BusID) as Bus_Name
		FROM BusSchedules bs 
    INNER JOIN
        BusRoutes br ON bs.RouteID = br.RouteID
    --INNER JOIN
    --    Buses b ON bs.BusID = b.BusID
    WHERE
        br.DepartureCity = @departureCity
        AND br.ArrivalCity = @arrivalCity
        AND bs.DepartureTime >= @departureTime;
END;

SELECT * FROM BusSchedules
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBus]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateBus]
    @busID INT,
    @newBusName VARCHAR(255)= NULL,
    @newBusCapacity VARCHAR(MAX)= NULL,
	@newBusNo VARCHAR(255)= NULL,
	@newBusType VARCHAR(255)= NULL,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Buses WHERE BusID = @busID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @busExists = 1
    BEGIN
        UPDATE Buses
        SET Bus_Name =ISNULL(@newBusName,Bus_Name),
            Capacity = ISNULL(@newBusCapacity,Capacity),
			BusNo = ISNULL(@newBusNo,BusNo),
			BusType = ISNULL(@newBusType,BusType)
        WHERE BusID = @busID;

        SET @message = 'Bus updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Bus does not exist. Unable to update.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBusSchedule]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update
CREATE PROCEDURE [dbo].[sp_UpdateBusSchedule]
    @ScheduleID INT,
    @BusID INT= NULL,
    @RouteID INT= NULL,
    @DepartureTime DATETIME= NULL,
    @ArrivalTime DATETIME= NULL,
    @AvailableSeats INT= NULL
AS
BEGIN
    UPDATE BusSchedules
    SET BusID = ISNULL(@BusID, BusID),
        RouteID = ISNULL(@RouteID,RouteID),
        DepartureTime = ISNULL(@DepartureTime,DepartureTime),
        ArrivalTime = ISNULL(@ArrivalTime,ArrivalTime),
        AvailableSeats = ISNULL(@AvailableSeats,AvailableSeats)
    WHERE ScheduleID = @ScheduleID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCity]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateCity]
	 @cityID INT,
    @cityName VARCHAR(255)= NULL,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Cities WHERE Id = @cityID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @busExists = 1
    BEGIN
        UPDATE Cities
        SET City_Name =ISNULL(@cityName,City_Name)
        WHERE Id = @cityID;

        SET @message = 'City updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'City does not exist. Unable to update.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateReservation]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mumtaz Ali
-- Create date: 14-March-2024
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateReservation] 
    @ScheduleID INT,
    @BusID INT = NULL,
    @RouteID INT = NULL,
    @DepartureDate DATETIME = NULL,
    @DepartureTime DATETIME = NULL,
    @ArrivalTime DATETIME = NULL,
    @AvailableSeats INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM dbo.BusSchedules WHERE ScheduleID = @ScheduleID)
    BEGIN
        PRINT 'ScheduleID not found.';
        RETURN;
    END

    BEGIN TRY
        UPDATE dbo.BusSchedules 
        SET 
            BusID = ISNULL(@BusID, BusID),
            RouteID = ISNULL(@RouteID, RouteID),
            DepartureDate = ISNULL(@DepartureDate, DepartureDate),
            DepartureTime = ISNULL(@DepartureTime, DepartureTime),
            ArrivalTime = ISNULL(@ArrivalTime, ArrivalTime),
            AvailableSeats = ISNULL(@AvailableSeats, AvailableSeats)
        WHERE 
            ScheduleID = @ScheduleID;

        IF @@ROWCOUNT = 0
            THROW 50000, 'No records were updated.', 1;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRoute]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateRoute]
	@RouteID INT,
    @DepartureCity VARCHAR(100)=NULL,
    @ArrivalCity VARCHAR(100)=NULL,
    @Distance DECIMAL(10, 2)=NULL,
    @EstimatedDuration INT=NULL,
	@BaseFare DECIMAL(10, 2)=NULL,
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE BusRoutes 
		  SET 
           DepartureCity = CASE WHEN @DepartureCity IS NOT NULL AND @DepartureCity != '' THEN @DepartureCity ELSE DepartureCity END,
            ArrivalCity = CASE WHEN @ArrivalCity IS NOT NULL AND @ArrivalCity != '' THEN @ArrivalCity ELSE ArrivalCity END,
            Distance = CASE WHEN @Distance IS NOT NULL AND @Distance != 0 THEN @Distance ELSE Distance END,
            EstimatedDuration = CASE WHEN @EstimatedDuration IS NOT NULL AND @EstimatedDuration != 0 THEN @EstimatedDuration ELSE EstimatedDuration END,
            BaseFare = CASE WHEN @BaseFare IS NOT NULL AND @BaseFare != 0 THEN @BaseFare ELSE BaseFare END
       
        WHERE
			RouteID=@RouteID;
        SET @ResultCode = 1;
        SET @ResultMessage = 'Record Updated successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;

-- Read
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateUser]
	  @userID INT,
	  @Email VARCHAR(255)= NULL,
      @FirstName VARCHAR(255)= NULL,
      @LastName VARCHAR(255)= NULL,
      @PhoneNumber VARCHAR(255)= NULL,
      @Gender VARCHAR(255)= NULL,
	  @user_Name VARCHAR(255),
     @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @userExists BIT;

    -- Check if the bus exists
    SELECT @userExists = CASE WHEN EXISTS (SELECT 1 FROM Users WHERE UserID = @userID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @userExists = 1
    BEGIN
        UPDATE Users
        SET Email = ISNULL(@Email,Email),
            FirstName = ISNULL(@FirstName,FirstName),
			LastName = ISNULL(@LastName,LastName),
			PhoneNumber = ISNULL(@PhoneNumber,PhoneNumber),
			Gender = ISNULL(@Gender,Gender),
			UpdatedBy = @user_Name,
			UpdatedDate = GETDATE()
        WHERE UserID = @userID;

        SET @message = 'User updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'User does not exist. Unable to update.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLogin]    Script Date: 4/14/2024 8:11:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UserLogin]
    @UserName VARCHAR(255),
    @Password VARCHAR(255),
    @LoginSuccess BIT OUTPUT,
    @UserID INT OUTPUT,
    @UserRole INT OUTPUT,
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @StoredPassword VARCHAR(255);

    -- Check if the username exists
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @UserName)
    BEGIN
        -- Retrieve the stored password for the given username
        SELECT @StoredPassword = [Password]
        FROM UserCredentials
        WHERE UserID = (SELECT UserID FROM Users WHERE Email = @UserName);

        -- Check if the provided password matches the stored password
        IF @StoredPassword = @Password
        BEGIN
            -- Login successful
            SET @LoginSuccess = 1;
            SET @UserID = (SELECT UserID FROM Users WHERE Email = @UserName);
            SET @UserRole = (SELECT [RoleID] FROM [dbo].[UserRoles] WHERE UserID = @UserID);
            SET @Message = 'Login successful.';
        END
        ELSE
        BEGIN
            -- Incorrect password
            SET @LoginSuccess = 0;
            SET @UserID = NULL;
            SET @Message = 'Incorrect password. Login failed.';
        END
    END
    ELSE
    BEGIN
        -- User does not exist
        SET @LoginSuccess = 0;
        SET @UserID = NULL;
        SET @Message = 'User does not exist. Login failed.';
    END
END;
GO
USE [master]
GO
ALTER DATABASE [BusBookingSystem] SET  READ_WRITE 
GO

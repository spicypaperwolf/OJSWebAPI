GO
USE master
GO
DROP DATABASE IF EXISTS OnlineJewelryShopDB
GO
CREATE DATABASE OnlineJewelryShopDB
GO
USE OnlineJewelryShopDB
GO

/*TABLE 1*/
CREATE TABLE AdminLoginMst(
	username VARCHAR(50) PRIMARY KEY,
	[password] VARCHAR(50) NOT NULL
)
GO

/*TABLE 2*/
CREATE TABLE UserRegMst(
	userId nchar(10) PRIMARY KEY,
	userFname TEXT NOT NULL,
	userLname TEXT NOT NULL,
	[address] VARCHAR(MAX) NOT NULL,
	[city] NVARCHAR(50) NOT NULL,
	[state] NVARCHAR(50) NOT NULL,
	mobNo TEXT NOT NULL,
	emailId TEXT NOT NULL,
	dob NVARCHAR(50) NOT NULL,
	cdate DATETIME NOT NULL
			DEFAULT CURRENT_TIMESTAMP,
	[password] VARCHAR(50) NOT NULL
)
GO

--TABLE 3
CREATE TABLE GuestMst
(
	guestId NCHAR(10) PRIMARY KEY,
	guestFname TEXT NOT NULL,
	guestLname TEXT NOT NULL,
	[address] VARCHAR(MAX) NOT NULL,
	[city] NVARCHAR(50) NOT NULL,
	[state] NVARCHAR(50) NOT NULL,
	mobNo TEXT NOT NULL,
	emailId TEXT NOT NULL,
	dob NVARCHAR(50) NOT NULL,
	cdate DATETIME NOT NULL
			DEFAULT CURRENT_TIMESTAMP
)

/*TABLE 4*/
CREATE TABLE BrandMst(
	brandId NCHAR(10) PRIMARY KEY,
	brandType VARCHAR(50) NOT NULL
)
GO

/*TABLE 5*/
CREATE TABLE CategoryMst(
	catId NCHAR(10) PRIMARY KEY,
	catName VARCHAR(50) NOT NULL
)
GO

/*TABLE 6*/
CREATE TABLE CertificateMst(
	certificateId NCHAR(10) PRIMARY KEY,
	certificateType VARCHAR(50) NOT NULL
)
GO


/*TABLE 7*/
CREATE TABLE ProductMst(
	prodId NCHAR(10) PRIMARY KEY,
	prodType VARCHAR(50) NOT NULL
)
GO

/*TABLE 8*/
CREATE TABLE DimInfoMst(
	dimId NCHAR(10) PRIMARY KEY,
	dimShape VARCHAR(50) NOT NULL,
	dimCrt NUMERIC(10,2) NOT NULL,
	dimSize NUMERIC(10,2) NOT NULL,
	dimColor VARCHAR(50) NOT NULL,
	dimClarity VARCHAR(50) NOT NULL,
	dimCut VARCHAR(50) NOT NULL,
	dimPolish VARCHAR(50) NOT NULL,
	dimSymmetry VARCHAR(50) NOT NULL,
	dimReport VARCHAR(50) NOT NULL,
	dimRate NUMERIC(10,2) NOT NULL,
	dimImg VARCHAR(50) NOT NULL
)
GO

--TABLE 9
CREATE TABLE GoldInfoMst
(
	goldId NCHAR(10) PRIMARY KEY,
	goldCrt NUMERIC(10,2) NOT NULL,
	goldType VARCHAR(50) NOT NULL,
	goldRate NUMERIC(10,2) NOT NULL
)
GO

--TABLE 10
CREATE TABLE StoneInfoMst
(
	stoneId NCHAR(10) PRIMARY KEY,
	stoneShape VARCHAR(50) NOT NULL,
	stoneCrt NUMERIC(10,2) NOT NULL,
	stoneColor VARCHAR(50) NOT NULL,
	stoneRate NUMERIC(10,2) NOT NULL,
	stoneImg VARCHAR(50) NOT NULL
)
GO

/*TABLE 11*/
CREATE TABLE ItemMst(
	itemCode VARCHAR(50) PRIMARY KEY,
	brandId NCHAR(10) FOREIGN KEY REFERENCES dbo.BrandMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	catId NCHAR(10) FOREIGN KEY REFERENCES dbo.CategoryMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	certificateId NCHAR(10) FOREIGN KEY REFERENCES dbo.CertificateMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	prodId NCHAR(10) FOREIGN KEY REFERENCES dbo.ProductMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	dimId NCHAR(10) FOREIGN KEY REFERENCES dbo.DimInfoMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	goldId NCHAR(10) FOREIGN KEY REFERENCES dbo.GoldInfoMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	stoneId NCHAR(10) FOREIGN KEY REFERENCES dbo.StoneInfoMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	itemName NVARCHAR(50) NOT NULL,
	itemImg VARCHAR(50) NOT NULL,
	pairs NUMERIC(3,0) NULL,
	dimQty INT NULL,
	dimTot NUMERIC(10,2) NULL,
	stoneQty INT NULL,
	stoneTot INT NULL,
	goldWt NUMERIC(10,2) NULL,
	goldTot NUMERIC(10,2) NULL,
	wstgPer NUMERIC(10,3) NOT NULL,
	wstg NUMERIC(10,3) NOT NULL,
	goldMaking NUMERIC(10,2) NULL,
	stoneMaking NUMERIC(10,2) NULL,
	otherMaking NUMERIC(10,2) NULL,
	totMaking NUMERIC(10,2) NOT NULL,
	MRP NUMERIC(10,2) NOT NULL
)
GO

/*TABLE 12*/
CREATE TABLE CartList(
	cartId NCHAR(10) PRIMARY KEY,
	userId NCHAR(10) FOREIGN KEY REFERENCES dbo.UserRegMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	guestId NCHAR(10) FOREIGN KEY REFERENCES dbo.GuestMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	itemCode VARCHAR(50) NOT NULL,
	qty INT NOT NULL,
	price NUMERIC(10,2) NOT NULL
)
GO

/*TABLE 13*/
CREATE TABLE InquiryMst(
	inquiryID NCHAR(10) PRIMARY KEY,
	cartId NCHAR(10) FOREIGN KEY REFERENCES dbo.CartList ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	fname TEXT NOT NULL,
	lname TEXT NOT NULL,
	city NVARCHAR(50) NOT NULL,
	mobNo TEXT NOT NULL,
	emailId TEXT NOT NULL,
	cmt VARCHAR(MAX) NOT NULL,
	cdate DATETIME NOT NULL
			DEFAULT CURRENT_TIMESTAMP,
	cardNo INT NOT NULL,
	expdate VARCHAR(15) NOT NULL,
	CVV_No INT NOT NULL
)
GO

--TABLE 14
CREATE TABLE CommentMst
(
	cmtId NCHAR(10) PRIMARY KEY,
	userId NCHAR(10) FOREIGN KEY REFERENCES dbo.UserRegMst ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	itemCode VARCHAR(50) FOREIGN KEY REFERENCES dbo.ItemMst ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	cmtContent NVARCHAR(150) NOT NULL,
	ratingValue NUMERIC(10,1) NOT NULL
)

GO

--TABLE 15
CREATE TABLE TransactionMst
(
	transactionId NCHAR(10) PRIMARY KEY,
	userId NCHAR(10) FOREIGN KEY REFERENCES dbo.UserRegMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	guestId NCHAR(10) FOREIGN KEY REFERENCES dbo.GuestMst ON DELETE CASCADE ON UPDATE CASCADE NULL,
	itemCode VARCHAR(50) FOREIGN KEY REFERENCES dbo.ItemMst ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	qty INT NOT NULL,
	approvalStt	NVARCHAR(10) NULL
)

GO

--TABLE 16
CREATE TABLE ContactMst
(
	contactId NCHAR(10) PRIMARY KEY,
	contactFname TEXT NOT NULL,
	contactLname TEXT NOT NULL,
	contactMob TEXT NOT NULL,
	contactEmail TEXT NOT NULL,
	contactMessage NVARCHAR(150) NOT NULL
)

GO

--Table 17
CREATE TABLE NewsletterMst
(
	newsletterId NCHAR(10) PRIMARY KEY,
	newsletterEmail TEXT NOT NULL
)

GO

--INSERT DATA 2 AdminLoginMst
INSERT INTO	dbo.AdminLoginMst
(
    username,
    password
)
VALUES
(   'admin', -- username - varchar(50)
    '12345'  -- password - varchar(50)
    )

GO

--INSERT DATA 2 ProductMst
INSERT INTO	dbo.ProductMst
(
    prodId,
    prodType
)
VALUES
(   N'T01', -- prodId - nchar(10)
    'Ring'   -- prodType - varchar(50)
    ),
(   N'T02', -- prodId - nchar(10)
    'Earings'   -- prodType - varchar(50)
    ),
(   N'T03', -- prodId - nchar(10)
    'Bracelet'   -- prodType - varchar(50)
    ),
(   N'T04', -- prodId - nchar(10)
    'Necklace'   -- prodType - varchar(50)
    )

GO

--INSERT DATA 2 CategoryMst
INSERT INTO	dbo.CategoryMst
(
    catId,
    catName
)
VALUES
(   N'CA01', -- catId - nchar(10)
    'Spring 2019'   -- catName - varchar(50)
    ),
(   N'CA02', -- catId - nchar(10)
    'Summer 2019'   -- catName - varchar(50)
    ),
(   N'CA03', -- catId - nchar(10)
    'Fall 2019'   -- catName - varchar(50)
    ),
(   N'CA04', -- catId - nchar(10)
    'Winter 2019'   -- catName - varchar(50)
    )

GO

--INSERT DATA 2 BrandMst
INSERT INTO	dbo.BrandMst
(
    brandId,
    brandType
)
VALUES
(   N'B001', -- brandId - nchar(10)
    'YASH'   -- brandType - varchar(50)
    ),
(   N'B002', -- brandId - nchar(10)
    'Tiffany & Co.'   -- brandType - varchar(50)
    ),
(   N'B003', -- brandId - nchar(10)
    'Cartier'   -- brandType - varchar(50)
    ),
(   N'B004', -- brandId - nchar(10)
    'Bvlgari'   -- brandType - varchar(50)
    )

GO

--INSERT DATA 2 CertificateMst
INSERT INTO	dbo.CertificateMst
(
    certificateId,
    certificateType
)
VALUES
(   N'CE001', -- certificateId - nchar(10)
    '921'   -- certificateType - varchar(50)
    ),
(   N'CE002', -- certificateId - nchar(10)
    '922'   -- certificateType - varchar(50)
    ),
(   N'CE003', -- certificateId - nchar(10)
    '923'   -- certificateType - varchar(50)
    ),
(   N'CE004', -- certificateId - nchar(10)
    '924'   -- certificateType - varchar(50)
    )

GO

--INSERT DATA 2 DimInfoMst
INSERT INTO dbo.DimInfoMst
(
    dimId,
    dimShape,
    dimCrt,
    dimSize,
    dimColor,
    dimClarity,
    dimCut,
    dimPolish,
    dimSymmetry,
    dimReport,
    dimRate,
    dimImg
)
VALUES
(   N'DI001',  -- dimId - nchar(10)
    'Round',   -- dimShape - varchar(50)
    0.17, -- dimCrt - numeric(10, 2)
    3.6, -- dimSize - numeric(10, 2)
    'F',   -- dimColor - varchar(50)
    'VS1',   -- dimClarity - varchar(50)
    'Premium',   -- dimCut - varchar(50)
    'Excellent',   -- dimPolish - varchar(50)
    'Excellent',   -- dimSymmetry - varchar(50)
    'GIA',   -- dimReport - varchar(50)
    10000000.00, -- dimRate - numeric(12, 2)
    'dim001'    -- dimImg - varchar(50)
    ),
(   N'DI002',  -- dimId - nchar(10)
    'Round',   -- dimShape - varchar(50)
    0.2, -- dimCrt - numeric(10, 2)
    3.76, -- dimSize - numeric(10, 2)
    'G',   -- dimColor - varchar(50)
    'VS1',   -- dimClarity - varchar(50)
    'Ideal',   -- dimCut - varchar(50)
    'Excellent',   -- dimPolish - varchar(50)
    'Excellent',   -- dimSymmetry - varchar(50)
    'GIA',   -- dimReport - varchar(50)
    11100000.00, -- dimRate - numeric(12, 2)
    'dim002'    -- dimImg - varchar(50)
    ),
(   N'DI003',  -- dimId - nchar(10)
    'Round',   -- dimShape - varchar(50)
    3.35, -- dimCrt - numeric(10, 2)
    9.7, -- dimSize - numeric(10, 2)
    'G',   -- dimColor - varchar(50)
    'VVS1',   -- dimClarity - varchar(50)
    'Very Good',   -- dimCut - varchar(50)
    'Excellent',   -- dimPolish - varchar(50)
    'Excellent',   -- dimSymmetry - varchar(50)
    'GIA',   -- dimReport - varchar(50)
    19142000.00, -- dimRate - numeric(10, 2)
    'dim003'    -- dimImg - varchar(50)
    ),
(   N'DI004',  -- dimId - nchar(10)
    'Round',   -- dimShape - varchar(50)
    0.18, -- dimCrt - numeric(10, 2)
    3.64, -- dimSize - numeric(10, 2)
    'F',   -- dimColor - varchar(50)
    'VS1',   -- dimClarity - varchar(50)
    'Premium',   -- dimCut - varchar(50)
    'Excellent',   -- dimPolish - varchar(50)
    'Excellent',   -- dimSymmetry - varchar(50)
    'GIA',   -- dimReport - varchar(50)
    10800000.00, -- dimRate - numeric(10, 2)
    'dim004'    -- dimImg - varchar(50)
    ),
(   N'DI005',  -- dimId - nchar(10)
    'Round',   -- dimShape - varchar(50)
    0.26, -- dimCrt - numeric(10, 2)
    4.1, -- dimSize - numeric(10, 2)
    'G',   -- dimColor - varchar(50)
    'VVS1',   -- dimClarity - varchar(50)
    'Premium',   -- dimCut - varchar(50)
    'Excellent',   -- dimPolish - varchar(50)
    'Excellent',   -- dimSymmetry - varchar(50)
    'GIA',   -- dimReport - varchar(50)
    18400000.00, -- dimRate - numeric(10, 2)
    'dim005'    -- dimImg - varchar(50)
    )

GO

--INSERT DATA 2 StoneInfoMst
INSERT INTO dbo.StoneInfoMst
(
    stoneId,
    stoneShape,
    stoneCrt,
    stoneColor,
    stoneRate,
    stoneImg
)
VALUES
(   N'ST001',  -- stoneId - nchar(10)
    'Round',   -- stoneShape - varchar(50)
    0.3, -- stoneCrt - numeric(10, 2)
    'Green Yellow',   -- stoneColor - varchar(50)
    13500000.00, -- stoneRate - numeric(10, 2)
    'stone001'    -- stoneImg - varchar(50)
    ),
(   N'ST002',  -- stoneId - nchar(10)
    'Round',   -- stoneShape - varchar(50)
    0.2, -- stoneCrt - numeric(10, 2)
    'White Pearl',   -- stoneColor - varchar(50)
    22000000.00, -- stoneRate - numeric(10, 2)
    'st002'    -- stoneImg - varchar(50)
    ),
(   N'ST003',  -- stoneId - nchar(10)
    'Round',   -- stoneShape - varchar(50)
    0.4, -- stoneCrt - numeric(10, 2)
    'Pink',   -- stoneColor - varchar(50)
    21500000.00, -- stoneRate - numeric(10, 2)
    'st003'    -- stoneImg - varchar(50)
    )

GO

--INSERT DATA 2 GoldInfoMst
INSERT INTO dbo.GoldInfoMst
(
    goldId,
    goldCrt,
    goldType,
    goldRate
)
VALUES
(   N'G001',  -- goldId - nchar(10)
    18, -- goldCrt - numeric(10, 2)
    '18K',   -- goldType - varchar(50)
    5000000.00  -- goldRate - numeric(10, 2)
    ),
(   N'G002',  -- goldId - nchar(10)
    18, -- goldCrt - numeric(10, 2)
    '24K',   -- goldType - varchar(50)
    8000000.00  -- goldRate - numeric(10, 2)
    ),
(   N'G003',  -- goldId - nchar(10)
    12, -- goldCrt - numeric(10, 2)
    '24K',   -- goldType - varchar(50)
    9000000.00  -- goldRate - numeric(10, 2)
    )

GO

--INSERT DATA 2 ItemMst
INSERT INTO dbo.ItemMst
(
    itemCode,
    brandId,
    catId,
    certificateId,
    prodId,
    dimId,
    goldId,
    stoneId,
    itemName,
    itemImg,
    pairs,
    dimQty,
    dimTot,
    stoneQty,
    stoneTot,
    goldWt,
    goldTot,
    wstgPer,
    wstg,
    goldMaking,
    stoneMaking,
    otherMaking,
    totMaking,
    MRP
)
VALUES
(   'JE001',   -- itemCode - varchar(50)
    N'B001',  -- brandId - nchar(10)
    N'CA04',  -- catId - nchar(10)
    N'CE001',  -- certificateId - nchar(10)
    N'T01',  -- prodId - nchar(10)
    N'DI001',  -- dimId - nchar(10)
    N'G001',  -- goldId - nchar(10)
	NULL,  -- stoneId - nchar(10)
    N'Diamond Ring 18K Winter Collection 2019',  -- itemName - nvarchar(50)
    'je001',   -- itemImg - varchar(50)
    NULL, -- pairs - numeric(3, 0)
    6,    -- dimQty - int
    60000000.00, -- dimTot - numeric(10, 2)
    0,    -- stoneQty - int
    0,    -- stoneTot - int
    2, -- goldWt - numeric(10, 2)
    10000000.00, -- goldTot - numeric(10, 2)
    0, -- wstgPer - numeric(10, 3)
    0, -- wstg - numeric(10, 3)
    2000000.00, -- goldMaking - numeric(10, 2)
    0, -- stoneMaking - numeric(10, 2)
    0, -- otherMaking - numeric(10, 2)
    12000000.00, -- totMaking - numeric(10, 2)
    72000000.00  -- MRP - numeric(10, 2)
    ),
(   'JE002',   -- itemCode - varchar(50)
    N'B002',  -- brandId - nchar(10)
    N'CA03',  -- catId - nchar(10)
    N'CE003',  -- certificateId - nchar(10)
    N'T02',  -- prodId - nchar(10)
    N'DI001',  -- dimId - nchar(10)
    N'G001',  -- goldId - nchar(10)
    NULL,  -- stoneId - nchar(10)
    N'Diamond Ring 18K Fall Collection 2019',  -- itemName - nvarchar(50)
    'je002',   -- itemImg - varchar(50)
    NULL, -- pairs - numeric(3, 0)
    6,    -- dimQty - int
    60000000.00, -- dimTot - numeric(10, 2)
    0,    -- stoneQty - int
    0,    -- stoneTot - int
    2, -- goldWt - numeric(10, 2)
    10000000.00, -- goldTot - numeric(10, 2)
    0, -- wstgPer - numeric(10, 3)
    0, -- wstg - numeric(10, 3)
    2000000.00, -- goldMaking - numeric(10, 2)
    0, -- stoneMaking - numeric(10, 2)
    0, -- otherMaking - numeric(10, 2)
    12000000.00, -- totMaking - numeric(10, 2)
    72000000.00  -- MRP - numeric(10, 2)
    ),
(   'JE003',   -- itemCode - varchar(50)
    N'B003',  -- brandId - nchar(10)
    N'CA02',  -- catId - nchar(10)
    N'CE002',  -- certificateId - nchar(10)
    N'T03',  -- prodId - nchar(10)
    N'DI001',  -- dimId - nchar(10)
    N'G001',  -- goldId - nchar(10)
    NULL,  -- stoneId - nchar(10)
    N'Diamond Ring 18K Summer Collection 2019',  -- itemName - nvarchar(50)
    'je003',   -- itemImg - varchar(50)
    NULL, -- pairs - numeric(3, 0)
    6,    -- dimQty - int
    60000000.00, -- dimTot - numeric(10, 2)
    0,    -- stoneQty - int
    0,    -- stoneTot - int
    2, -- goldWt - numeric(10, 2)
    10000000.00, -- goldTot - numeric(10, 2)
    0, -- wstgPer - numeric(10, 3)
    0, -- wstg - numeric(10, 3)
    2000000.00, -- goldMaking - numeric(10, 2)
    0, -- stoneMaking - numeric(10, 2)
    0, -- otherMaking - numeric(10, 2)
    12000000.00, -- totMaking - numeric(10, 2)
    72000000.00  -- MRP - numeric(10, 2)
    ),
(   'JE004',   -- itemCode - varchar(50)
    N'B004',  -- brandId - nchar(10)
    N'CA01',  -- catId - nchar(10)
    N'CE001',  -- certificateId - nchar(10)
    N'T01',  -- prodId - nchar(10)
    N'DI001',  -- dimId - nchar(10)
    N'G001',  -- goldId - nchar(10)
    NULL,  -- stoneId - nchar(10)
    N'Diamond Ring 18K Spring Collection 2019',  -- itemName - nvarchar(50)
    'je004',   -- itemImg - varchar(50)
    NULL, -- pairs - numeric(3, 0)
    6,    -- dimQty - int
    60000000.00, -- dimTot - numeric(10, 2)
    0,    -- stoneQty - int
    0,    -- stoneTot - int
    2, -- goldWt - numeric(10, 2)
    10000000.00, -- goldTot - numeric(10, 2)
    0, -- wstgPer - numeric(10, 3)
    0, -- wstg - numeric(10, 3)
    2000000.00, -- goldMaking - numeric(10, 2)
    0, -- stoneMaking - numeric(10, 2)
    0, -- otherMaking - numeric(10, 2)
    12000000.00, -- totMaking - numeric(10, 2)
    72000000.00  -- MRP - numeric(10, 2)
    )
GO

--INSERT CLONE DATA 4 UserRegMst
INSERT INTO	dbo.UserRegMst
(
    userId,
    userFname,
    userLname,
    address,
    city,
    state,
    mobNo,
    emailId,
    dob,
    password
)
VALUES
(   N'U101', -- userId - nchar(10)
    'Kiel',  -- userFname - text
    'Huynh',  -- userLname - text
    '29, Ngo Thoi Nhiem, Q1',  -- address - varchar(max)
    N'TP. HCM', -- city - nvarchar(50)
    N'TP. HCM', -- state - nvarchar(50)
    '0908292881',  -- mobNo - text
    'kiel@gmail.com',  -- emailId - text
    N'12/09/1993', -- dob - nvarchar(50)
    '12345'   -- password - varchar(50)
    ),
(   N'U102', -- userId - nchar(10)
    'Alex',  -- userFname - text
    'Huynh',  -- userLname - text
    '29, Tran Hung Dao, Q1',  -- address - varchar(max)
    N'TP. HCM', -- city - nvarchar(50)
    N'TP. HCM', -- state - nvarchar(50)
    '0908222881',  -- mobNo - text
    'alex@gmail.com',  -- emailId - text
    N'09/09/1993', -- dob - nvarchar(50)
    '12345'   -- password - varchar(50)
    ),
(   N'U103', -- userId - nchar(10)
    'Popo',  -- userFname - text
    'Nguyen',  -- userLname - text
    '13, Nguyen Trai, Q1',  -- address - varchar(max)
    N'TP. HCM', -- city - nvarchar(50)
    N'TP. HCM', -- state - nvarchar(50)
    '0908292381',  -- mobNo - text
    'popo12@gmail.com',  -- emailId - text
    N'02/12/1993', -- dob - nvarchar(50)
    '12345'   -- password - varchar(50)
    ),
(   N'U104', -- userId - nchar(10)
    'Quorra',  -- userFname - text
    'Vu',  -- userLname - text
    '1, Tran Cao Van, Q1',  -- address - varchar(max)
    N'TP. HCM', -- city - nvarchar(50)
    N'TP. HCM', -- state - nvarchar(50)
    '0938292881',  -- mobNo - text
    'quorra292@gmail.com',  -- emailId - text
    N'05/07/1992', -- dob - nvarchar(50)
    '12345'   -- password - varchar(50)
    ),
(   N'U105', -- userId - nchar(10)
    'Rin',  -- userFname - text
    'Tran',  -- userLname - text
    '19, Nguyen Bieu, Q5',  -- address - varchar(max)
    N'TP. HCM', -- city - nvarchar(50)
    N'TP. HCM', -- state - nvarchar(50)
    '0908982881',  -- mobNo - text
    'rin291@gmail.com',  -- emailId - text
    N'07/02/1992', -- dob - nvarchar(50)
    '12345'   -- password - varchar(50)
    )
GO
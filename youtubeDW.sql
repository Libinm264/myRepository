use[youtube]
go

CREATE TABLE Country_Dim
(CountryCode VARCHAR(50),
StoreId VARCHAR(200),
PRIMARY KEY (CountryCode));
GO

CREATE TABLE Channel_Dim
(ChannelID VARCHAR(200),
ChannelName VARCHAR(300),
StartDate DATE,
PRIMARY KEY (ChannelID));
GO

CREATE TABLE Category_Dim
(CategoryType VARCHAR(100),
Descriptions VARCHAR(2000),
PRIMARY KEY (CategoryType));
GO

CREATE TABLE Grade_Dim
(GradeType VARCHAR(20),
Descriptions VARCHAR(1000),
PRIMARY KEY (GradeType));
GO

CREATE TABLE EliteYouTubeChannels_Fact
(
Uploads INT,
Subscribers INT,
VideoViews INT,
Ranks INT,
CountryCodeKey VARCHAR(50),
ChannelIDKey VARCHAR(200),
CategoryTypeKey VARCHAR(100),
GradeTypeKey VARCHAR(20),
PRIMARY KEY(Ranks,ChannelIDKey),
FOREIGN KEY (CountryCodeKey) REFERENCES Country_Dim(CountryCode),
FOREIGN KEY (ChannelIDKey) REFERENCES Channel_Dim(ChannelID),
FOREIGN KEY (CategoryTypeKey) REFERENCES Category_Dim(CategoryType),
FOREIGN KEY (GradeTypeKey) REFERENCES Grade_Dim(GradeType));
GO

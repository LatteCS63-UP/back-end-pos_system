-- CreateTable
CREATE TABLE `MasProvince` (
    `ProvinceID` INTEGER NOT NULL,
    `ProvinceNameTh` VARCHAR(255) NOT NULL,
    `ProvinceNameEn` VARCHAR(255) NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `MasProvince_ProvinceNameTh_key`(`ProvinceNameTh`),
    UNIQUE INDEX `MasProvince_ProvinceNameEn_key`(`ProvinceNameEn`),
    PRIMARY KEY (`ProvinceID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MasDistrict` (
    `DistrictID` INTEGER NOT NULL,
    `DistrictNameTh` VARCHAR(255) NOT NULL,
    `DistrictNameEn` VARCHAR(255) NULL,
    `ProvinceID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`DistrictID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MasSubDistrict` (
    `SubDistrictID` INTEGER NOT NULL,
    `SubDistrictNameTh` VARCHAR(255) NOT NULL,
    `SubDistrictNameEn` VARCHAR(255) NULL,
    `DistrictID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`SubDistrictID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MasJobTitle` (
    `JobTitleID` INTEGER NOT NULL AUTO_INCREMENT,
    `JobTitleName` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `MasJobTitle_JobTitleName_key`(`JobTitleName`),
    PRIMARY KEY (`JobTitleID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Shop` (
    `ShopID` INTEGER NOT NULL AUTO_INCREMENT,
    `ShopCode` VARCHAR(255) NOT NULL,
    `ShopName` VARCHAR(255) NOT NULL,
    `ShopAddress` VARCHAR(255) NOT NULL,
    `ProvinceID` INTEGER NULL,
    `DistrictID` INTEGER NULL,
    `SubDistrictID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `Shop_ShopCode_key`(`ShopCode`),
    PRIMARY KEY (`ShopID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SysAdmin` (
    `SysAdminID` INTEGER NOT NULL AUTO_INCREMENT,
    `JobTitleID` INTEGER NULL,
    `SysAdminUsername` VARCHAR(255) NOT NULL,
    `SysAdminPassword` VARCHAR(255) NOT NULL,
    `SysAdminFirstname` VARCHAR(255) NOT NULL,
    `SysAdminLastname` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `SysAdmin_SysAdminUsername_key`(`SysAdminUsername`),
    PRIMARY KEY (`SysAdminID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Owner` (
    `OwnerID` INTEGER NOT NULL AUTO_INCREMENT,
    `OwnerUsername` VARCHAR(255) NOT NULL,
    `OwnerPassword` VARCHAR(255) NOT NULL,
    `OwnerFirstname` VARCHAR(100) NOT NULL,
    `OwnerLastname` VARCHAR(100) NOT NULL,
    `JobTitleID` INTEGER NULL,
    `ShopID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `Owner_OwnerUsername_key`(`OwnerUsername`),
    PRIMARY KEY (`OwnerID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Employee` (
    `EmployeeID` INTEGER NOT NULL AUTO_INCREMENT,
    `EmployeeUsername` VARCHAR(255) NOT NULL,
    `EmployeePassword` VARCHAR(255) NOT NULL,
    `EmployeeFirstname` VARCHAR(100) NOT NULL,
    `EmployeeLastname` VARCHAR(100) NULL,
    `JobTitleID` INTEGER NULL,
    `ShopID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `Employee_EmployeeUsername_key`(`EmployeeUsername`),
    PRIMARY KEY (`EmployeeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Customer` (
    `CustomerID` INTEGER NOT NULL AUTO_INCREMENT,
    `CustomerUsername` VARCHAR(255) NOT NULL,
    `CustomerPassword` VARCHAR(255) NOT NULL,
    `CustomerFirstname` VARCHAR(255) NOT NULL,
    `CustomerLastname` VARCHAR(255) NOT NULL,
    `CustomerPhoneNumber` VARCHAR(80) NULL,
    `CustomerPoint` INTEGER NOT NULL,
    `PositionCode` VARCHAR(255) NOT NULL,
    `ShopID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `Customer_CustomerUsername_key`(`CustomerUsername`),
    PRIMARY KEY (`CustomerID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BillProductExchange` (
    `BillProductExchangeID` INTEGER NOT NULL AUTO_INCREMENT,
    `EmployeeID` INTEGER NULL,
    `CustomerID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`BillProductExchangeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ListProductExchange` (
    `ProductExchangeID` INTEGER NOT NULL,
    `BillProductExchangeID` INTEGER NOT NULL,
    `ProductExchangeCount` INTEGER NOT NULL,
    `TotalScore` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`ProductExchangeID`, `BillProductExchangeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ProductExchange` (
    `ProductExchangeID` INTEGER NOT NULL AUTO_INCREMENT,
    `ProductExchangeCode` VARCHAR(255) NOT NULL,
    `ProductExchangeName` VARCHAR(255) NOT NULL,
    `ScorePoint` INTEGER NOT NULL,
    `ProductExchangeImg` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `ProductExchange_ProductExchangeName_key`(`ProductExchangeName`),
    PRIMARY KEY (`ProductExchangeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ListOrderRequest` (
    `OrderRequestID` INTEGER NOT NULL AUTO_INCREMENT,
    `OrderRequestStatus` VARCHAR(10) NOT NULL,
    `CustomerID` INTEGER NULL,
    `EmployeeID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`OrderRequestID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderRequest` (
    `OrderRequestID` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `ProductCount` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`OrderRequestID`, `ProductID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `ProductID` INTEGER NOT NULL AUTO_INCREMENT,
    `ProductCode` VARCHAR(255) NOT NULL,
    `ProductName` VARCHAR(255) NOT NULL,
    `ProductPrice` INTEGER NOT NULL,
    `ProductImg` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `Product_ProductName_key`(`ProductName`),
    PRIMARY KEY (`ProductID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ListOrder` (
    `OrderID` INTEGER NOT NULL AUTO_INCREMENT,
    `EmployeeID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`OrderID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Bill` (
    `BillID` INTEGER NOT NULL AUTO_INCREMENT,
    `PayType` VARCHAR(100) NOT NULL,
    `CustomerID` INTEGER NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`BillID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderExport` (
    `BillID` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `OrderID` INTEGER NULL,
    `ProductCount` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    `CreateUser` VARCHAR(10) NOT NULL,
    `LastDate` DATETIME NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`BillID`, `ProductID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `MasDistrict` ADD CONSTRAINT `MasDistrict_ProvinceID_fkey` FOREIGN KEY (`ProvinceID`) REFERENCES `MasProvince`(`ProvinceID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MasSubDistrict` ADD CONSTRAINT `MasSubDistrict_DistrictID_fkey` FOREIGN KEY (`DistrictID`) REFERENCES `MasDistrict`(`DistrictID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Shop` ADD CONSTRAINT `Shop_ProvinceID_fkey` FOREIGN KEY (`ProvinceID`) REFERENCES `MasProvince`(`ProvinceID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Shop` ADD CONSTRAINT `Shop_DistrictID_fkey` FOREIGN KEY (`DistrictID`) REFERENCES `MasDistrict`(`DistrictID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Shop` ADD CONSTRAINT `Shop_SubDistrictID_fkey` FOREIGN KEY (`SubDistrictID`) REFERENCES `MasSubDistrict`(`SubDistrictID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SysAdmin` ADD CONSTRAINT `SysAdmin_JobTitleID_fkey` FOREIGN KEY (`JobTitleID`) REFERENCES `MasJobTitle`(`JobTitleID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Owner` ADD CONSTRAINT `Owner_JobTitleID_fkey` FOREIGN KEY (`JobTitleID`) REFERENCES `MasJobTitle`(`JobTitleID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Owner` ADD CONSTRAINT `Owner_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_JobTitleID_fkey` FOREIGN KEY (`JobTitleID`) REFERENCES `MasJobTitle`(`JobTitleID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Customer` ADD CONSTRAINT `Customer_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BillProductExchange` ADD CONSTRAINT `BillProductExchange_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BillProductExchange` ADD CONSTRAINT `BillProductExchange_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListProductExchange` ADD CONSTRAINT `ListProductExchange_ProductExchangeID_fkey` FOREIGN KEY (`ProductExchangeID`) REFERENCES `ProductExchange`(`ProductExchangeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListProductExchange` ADD CONSTRAINT `ListProductExchange_BillProductExchangeID_fkey` FOREIGN KEY (`BillProductExchangeID`) REFERENCES `BillProductExchange`(`BillProductExchangeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListOrderRequest` ADD CONSTRAINT `ListOrderRequest_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListOrderRequest` ADD CONSTRAINT `ListOrderRequest_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderRequest` ADD CONSTRAINT `OrderRequest_OrderRequestID_fkey` FOREIGN KEY (`OrderRequestID`) REFERENCES `ListOrderRequest`(`OrderRequestID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderRequest` ADD CONSTRAINT `OrderRequest_ProductID_fkey` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`ProductID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListOrder` ADD CONSTRAINT `ListOrder_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Bill` ADD CONSTRAINT `Bill_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderExport` ADD CONSTRAINT `OrderExport_BillID_fkey` FOREIGN KEY (`BillID`) REFERENCES `Bill`(`BillID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderExport` ADD CONSTRAINT `OrderExport_ProductID_fkey` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`ProductID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderExport` ADD CONSTRAINT `OrderExport_OrderID_fkey` FOREIGN KEY (`OrderID`) REFERENCES `ListOrder`(`OrderID`) ON DELETE SET NULL ON UPDATE CASCADE;

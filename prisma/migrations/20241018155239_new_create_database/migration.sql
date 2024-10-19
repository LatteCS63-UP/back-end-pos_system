-- CreateTable
CREATE TABLE `MasProvince` (
    `ProvinceID` INTEGER NOT NULL,
    `ProvinceNameTh` VARCHAR(255) NOT NULL,
    `ProvinceNameEn` VARCHAR(255) NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
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
    `ProvinceID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`DistrictID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MasSubDistrict` (
    `SubDistrictID` INTEGER NOT NULL,
    `SubDistrictNameTh` VARCHAR(255) NOT NULL,
    `SubDistrictNameEn` VARCHAR(255) NULL,
    `DistrictID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`SubDistrictID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MasJobTitle` (
    `JobTitleID` INTEGER NOT NULL AUTO_INCREMENT,
    `JobTitle_name` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `MasJobTitle_JobTitle_name_key`(`JobTitle_name`),
    PRIMARY KEY (`JobTitleID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Shop` (
    `ShopID` INTEGER NOT NULL AUTO_INCREMENT,
    `Shop_code` VARCHAR(255) NOT NULL,
    `Shop_name` VARCHAR(255) NOT NULL,
    `Shop_address` VARCHAR(255) NOT NULL,
    `ProvinceID` INTEGER NOT NULL,
    `DistrictID` INTEGER NOT NULL,
    `SubDistrictID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `Shop_Shop_code_key`(`Shop_code`),
    PRIMARY KEY (`ShopID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SysAdmin` (
    `SysAdminID` INTEGER NOT NULL AUTO_INCREMENT,
    `JobTitleID` INTEGER NOT NULL,
    `SysAdmin_username` VARCHAR(255) NOT NULL,
    `SysAdmin_password` VARCHAR(255) NOT NULL,
    `SysAdmin_first_name` VARCHAR(255) NOT NULL,
    `SysAdmin_last_name` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `SysAdmin_SysAdmin_username_key`(`SysAdmin_username`),
    PRIMARY KEY (`SysAdminID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Owner` (
    `OwnerID` INTEGER NOT NULL AUTO_INCREMENT,
    `Owner_username` VARCHAR(255) NOT NULL,
    `Owner_password` VARCHAR(255) NOT NULL,
    `JobTitleID` INTEGER NOT NULL,
    `ShopID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,
    `Owner_first_name` VARCHAR(100) NOT NULL,
    `Owner_last_name` VARCHAR(100) NOT NULL,
    `StatusLogin` VARCHAR(1) NOT NULL,

    PRIMARY KEY (`OwnerID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Employee` (
    `EmployeeID` INTEGER NOT NULL AUTO_INCREMENT,
    `Employee_username` VARCHAR(255) NOT NULL,
    `Employee_password` VARCHAR(255) NOT NULL,
    `JobTitleID` INTEGER NOT NULL,
    `ShopID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,
    `EmployeeFirst_name` VARCHAR(100) NOT NULL,
    `EmployeeLast_name` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`EmployeeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Customer` (
    `CustomerID` INTEGER NOT NULL AUTO_INCREMENT,
    `Customer_username` VARCHAR(255) NOT NULL,
    `Customer_password` VARCHAR(255) NOT NULL,
    `Customer_first_name` VARCHAR(255) NOT NULL,
    `Customer_last_name` VARCHAR(255) NOT NULL,
    `Customer_phone_number` VARCHAR(80) NULL,
    `Customer_point` INTEGER NULL,
    `Position_code` VARCHAR(255) NULL,
    `ShopID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`CustomerID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BillProductExchange` (
    `BillProductExchangeID` INTEGER NOT NULL AUTO_INCREMENT,
    `EmployeeID` INTEGER NOT NULL,
    `CustomerID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`BillProductExchangeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ListProductExchange` (
    `ProductExchangeID` INTEGER NOT NULL,
    `BillProductExchangeID` INTEGER NOT NULL,
    `ProductExchange_count` INTEGER NOT NULL,
    `Total_score` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`ProductExchangeID`, `BillProductExchangeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ProductExchange` (
    `ProductExchangeID` INTEGER NOT NULL AUTO_INCREMENT,
    `ProductExchange_code` VARCHAR(255) NOT NULL,
    `ProductExchange_name` VARCHAR(255) NOT NULL,
    `Score_point` INTEGER NOT NULL,
    `ProductExchange_IMG` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `ProductExchange_ProductExchange_name_key`(`ProductExchange_name`),
    PRIMARY KEY (`ProductExchangeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ListOrderRequest` (
    `OrderRequestID` INTEGER NOT NULL AUTO_INCREMENT,
    `OrderRequest_status` VARCHAR(10) NOT NULL,
    `CustomerID` INTEGER NOT NULL,
    `EmployeeID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`OrderRequestID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderRequest` (
    `OrderRequestID` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `Product_count` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`OrderRequestID`, `ProductID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `ProductID` INTEGER NOT NULL AUTO_INCREMENT,
    `Product_code` VARCHAR(255) NOT NULL,
    `Product_name` VARCHAR(255) NOT NULL,
    `Product_price` INTEGER NOT NULL,
    `Product_IMG` VARCHAR(255) NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    UNIQUE INDEX `Product_Product_name_key`(`Product_name`),
    PRIMARY KEY (`ProductID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ListOrder` (
    `OrderID` INTEGER NOT NULL AUTO_INCREMENT,
    `EmployeeID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`OrderID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Bill` (
    `BillID` INTEGER NOT NULL AUTO_INCREMENT,
    `StatementID` INTEGER NOT NULL,
    `Bill_code` VARCHAR(191) NOT NULL,
    `Pay_type` VARCHAR(100) NOT NULL,
    `CustomerID` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`BillID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Statement` (
    `StatementID` INTEGER NOT NULL AUTO_INCREMENT,
    `Statement_number` INTEGER NOT NULL,
    `EmployeeID` INTEGER NOT NULL,
    `State_on` DATETIME(3) NOT NULL,
    `State_off` DATETIME(3) NOT NULL,
    `Change_in_box` INTEGER NOT NULL,
    `Total_price` INTEGER NULL,
    `Receive` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`StatementID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderExport` (
    `BillID` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `OrderID` INTEGER NOT NULL,
    `Product_count` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`BillID`, `ProductID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `MasDistrict` ADD CONSTRAINT `MasDistrict_ProvinceID_fkey` FOREIGN KEY (`ProvinceID`) REFERENCES `MasProvince`(`ProvinceID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MasSubDistrict` ADD CONSTRAINT `MasSubDistrict_DistrictID_fkey` FOREIGN KEY (`DistrictID`) REFERENCES `MasDistrict`(`DistrictID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Shop` ADD CONSTRAINT `Shop_DistrictID_fkey` FOREIGN KEY (`DistrictID`) REFERENCES `MasDistrict`(`DistrictID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Shop` ADD CONSTRAINT `Shop_ProvinceID_fkey` FOREIGN KEY (`ProvinceID`) REFERENCES `MasProvince`(`ProvinceID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Shop` ADD CONSTRAINT `Shop_SubDistrictID_fkey` FOREIGN KEY (`SubDistrictID`) REFERENCES `MasSubDistrict`(`SubDistrictID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SysAdmin` ADD CONSTRAINT `SysAdmin_JobTitleID_fkey` FOREIGN KEY (`JobTitleID`) REFERENCES `MasJobTitle`(`JobTitleID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Owner` ADD CONSTRAINT `Owner_JobTitleID_fkey` FOREIGN KEY (`JobTitleID`) REFERENCES `MasJobTitle`(`JobTitleID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Owner` ADD CONSTRAINT `Owner_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_JobTitleID_fkey` FOREIGN KEY (`JobTitleID`) REFERENCES `MasJobTitle`(`JobTitleID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Customer` ADD CONSTRAINT `Customer_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BillProductExchange` ADD CONSTRAINT `BillProductExchange_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BillProductExchange` ADD CONSTRAINT `BillProductExchange_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListProductExchange` ADD CONSTRAINT `ListProductExchange_BillProductExchangeID_fkey` FOREIGN KEY (`BillProductExchangeID`) REFERENCES `BillProductExchange`(`BillProductExchangeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListProductExchange` ADD CONSTRAINT `ListProductExchange_ProductExchangeID_fkey` FOREIGN KEY (`ProductExchangeID`) REFERENCES `ProductExchange`(`ProductExchangeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListOrderRequest` ADD CONSTRAINT `ListOrderRequest_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListOrderRequest` ADD CONSTRAINT `ListOrderRequest_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderRequest` ADD CONSTRAINT `OrderRequest_OrderRequestID_fkey` FOREIGN KEY (`OrderRequestID`) REFERENCES `ListOrderRequest`(`OrderRequestID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderRequest` ADD CONSTRAINT `OrderRequest_ProductID_fkey` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`ProductID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ListOrder` ADD CONSTRAINT `ListOrder_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Bill` ADD CONSTRAINT `Bill_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Bill` ADD CONSTRAINT `Bill_StatementID_fkey` FOREIGN KEY (`StatementID`) REFERENCES `Statement`(`StatementID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Statement` ADD CONSTRAINT `Statement_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderExport` ADD CONSTRAINT `OrderExport_BillID_fkey` FOREIGN KEY (`BillID`) REFERENCES `Bill`(`BillID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderExport` ADD CONSTRAINT `OrderExport_OrderID_fkey` FOREIGN KEY (`OrderID`) REFERENCES `ListOrder`(`OrderID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderExport` ADD CONSTRAINT `OrderExport_ProductID_fkey` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`ProductID`) ON DELETE RESTRICT ON UPDATE CASCADE;

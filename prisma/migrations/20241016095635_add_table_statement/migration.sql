-- CreateTable
CREATE TABLE `Statement` (
    `StatementID` INTEGER NOT NULL AUTO_INCREMENT,
    `EmployeeID` INTEGER NOT NULL,
    `State_on` DATETIME(3) NOT NULL,
    `State_off` DATETIME(3) NOT NULL,
    `Change` INTEGER NOT NULL,
    `RecordStatus` VARCHAR(1) NULL,
    `CreateDate` DATETIME(0) NULL,
    `CreateUser` VARCHAR(10) NULL,
    `LastDate` DATETIME(0) NULL,
    `LastUser` VARCHAR(10) NULL,

    PRIMARY KEY (`StatementID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Statement` ADD CONSTRAINT `Statement_EmployeeID_fkey` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee`(`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

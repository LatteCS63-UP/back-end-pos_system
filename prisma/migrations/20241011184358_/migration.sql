/*
  Warnings:

  - Made the column `CustomerID` on table `Bill` required. This step will fail if there are existing NULL values in that column.
  - Made the column `OrderID` on table `OrderExport` required. This step will fail if there are existing NULL values in that column.
  - Made the column `JobTitleID` on table `SysAdmin` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `Bill` DROP FOREIGN KEY `Bill_CustomerID_fkey`;

-- DropForeignKey
ALTER TABLE `OrderExport` DROP FOREIGN KEY `OrderExport_OrderID_fkey`;

-- DropForeignKey
ALTER TABLE `SysAdmin` DROP FOREIGN KEY `SysAdmin_JobTitleID_fkey`;

-- AlterTable
ALTER TABLE `Bill` MODIFY `CustomerID` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Customer` MODIFY `PositionCode` VARCHAR(255) NULL;

-- AlterTable
ALTER TABLE `OrderExport` MODIFY `OrderID` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `SysAdmin` MODIFY `JobTitleID` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `SysAdmin` ADD CONSTRAINT `SysAdmin_JobTitleID_fkey` FOREIGN KEY (`JobTitleID`) REFERENCES `MasJobTitle`(`JobTitleID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Bill` ADD CONSTRAINT `Bill_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderExport` ADD CONSTRAINT `OrderExport_OrderID_fkey` FOREIGN KEY (`OrderID`) REFERENCES `ListOrder`(`OrderID`) ON DELETE RESTRICT ON UPDATE CASCADE;

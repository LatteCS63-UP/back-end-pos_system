/*
  Warnings:

  - You are about to alter the column `CreateDate` on the `Bill` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `Bill` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `BillProductExchange` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `BillProductExchange` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `Customer` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `Customer` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `Employee` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `Employee` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `ListOrder` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `ListOrder` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `ListOrderRequest` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `ListOrderRequest` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `ListProductExchange` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `ListProductExchange` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `MasDistrict` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `MasDistrict` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `MasJobTitle` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `MasJobTitle` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `MasProvince` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `MasProvince` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `MasSubDistrict` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `MasSubDistrict` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `OrderExport` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `OrderExport` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `OrderRequest` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `OrderRequest` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `Owner` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `Owner` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `Product` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `ProductExchange` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `ProductExchange` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `Shop` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `Shop` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `CreateDate` on the `SysAdmin` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.
  - You are about to alter the column `LastDate` on the `SysAdmin` table. The data in that column could be lost. The data in that column will be cast from `DateTime(0)` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `Bill` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `BillProductExchange` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `Customer` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `Employee` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `ListOrder` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `ListOrderRequest` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `ListProductExchange` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `MasDistrict` MODIFY `CreateDate` DATETIME NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `MasJobTitle` MODIFY `RecordStatus` VARCHAR(1) NULL,
    MODIFY `CreateDate` DATETIME NULL,
    MODIFY `CreateUser` VARCHAR(10) NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `MasProvince` MODIFY `CreateDate` DATETIME NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `MasSubDistrict` MODIFY `CreateDate` DATETIME NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `OrderExport` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `OrderRequest` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `Owner` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `Product` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `ProductExchange` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `Shop` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

-- AlterTable
ALTER TABLE `SysAdmin` MODIFY `CreateDate` DATETIME NOT NULL,
    MODIFY `LastDate` DATETIME NULL;

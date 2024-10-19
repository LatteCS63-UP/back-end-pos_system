/*
  Warnings:

  - Added the required column `ShopID` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ShopID` to the `ProductExchange` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Product` ADD COLUMN `ShopID` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `ProductExchange` ADD COLUMN `ShopID` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `ProductExchange` ADD CONSTRAINT `ProductExchange_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_ShopID_fkey` FOREIGN KEY (`ShopID`) REFERENCES `Shop`(`ShopID`) ON DELETE RESTRICT ON UPDATE CASCADE;

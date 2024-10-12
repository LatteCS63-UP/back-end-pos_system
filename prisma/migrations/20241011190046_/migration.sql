/*
  Warnings:

  - Made the column `ProvinceID` on table `MasDistrict` required. This step will fail if there are existing NULL values in that column.
  - Made the column `DistrictID` on table `MasSubDistrict` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `MasDistrict` DROP FOREIGN KEY `MasDistrict_ProvinceID_fkey`;

-- DropForeignKey
ALTER TABLE `MasSubDistrict` DROP FOREIGN KEY `MasSubDistrict_DistrictID_fkey`;

-- AlterTable
ALTER TABLE `MasDistrict` MODIFY `ProvinceID` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `MasSubDistrict` MODIFY `DistrictID` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `MasDistrict` ADD CONSTRAINT `MasDistrict_ProvinceID_fkey` FOREIGN KEY (`ProvinceID`) REFERENCES `MasProvince`(`ProvinceID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MasSubDistrict` ADD CONSTRAINT `MasSubDistrict_DistrictID_fkey` FOREIGN KEY (`DistrictID`) REFERENCES `MasDistrict`(`DistrictID`) ON DELETE RESTRICT ON UPDATE CASCADE;

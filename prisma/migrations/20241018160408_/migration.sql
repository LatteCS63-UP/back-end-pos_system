/*
  Warnings:

  - You are about to drop the column `EmployeeFirst_name` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `EmployeeLast_name` on the `Employee` table. All the data in the column will be lost.
  - Added the required column `Employee_first_name` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Employee_last_name` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Employee` DROP COLUMN `EmployeeFirst_name`,
    DROP COLUMN `EmployeeLast_name`,
    ADD COLUMN `Employee_first_name` VARCHAR(100) NOT NULL,
    ADD COLUMN `Employee_last_name` VARCHAR(100) NOT NULL;

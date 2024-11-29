/*
  Warnings:

  - Added the required column `warningLevel` to the `sys_notice` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `sys_notice` ADD COLUMN `warningLevel` VARCHAR(50) NOT NULL;

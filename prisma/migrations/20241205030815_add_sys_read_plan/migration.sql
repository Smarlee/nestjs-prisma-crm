/*
  Warnings:

  - You are about to alter the column `createTime` on the `sys_config` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_config` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_dept` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_dept` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_dict_data` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_dict_data` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_dict_type` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_dict_type` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_job` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_job` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_job_log` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `loginTime` on the `sys_login_infor` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_menu` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_menu` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_notice` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_notice` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `operTime` on the `sys_oper_log` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_post` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_post` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_role` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_role` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_table` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_table` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_user` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `loginDate` on the `sys_user` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_user` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `createTime` on the `sys_web` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `updateTime` on the `sys_web` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to drop the `sys_book_menu` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `menuType` on table `sys_book_list` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `sys_book_list` ADD COLUMN `createBy` VARCHAR(64) NULL,
    ADD COLUMN `price` DECIMAL(10, 2) NULL,
    ADD COLUMN `updateBy` VARCHAR(64) NULL,
    MODIFY `menuType` CHAR(1) NOT NULL;

-- AlterTable
ALTER TABLE `sys_config` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_dept` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_dict_data` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_dict_type` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_job` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_job_log` MODIFY `createTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_login_infor` MODIFY `loginTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_menu` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_notice` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL,
    MODIFY `warningLevel` VARCHAR(255) NULL;

-- AlterTable
ALTER TABLE `sys_oper_log` MODIFY `operTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_post` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_role` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_table` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_user` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `loginDate` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_web` MODIFY `createTime` DATETIME(0) NULL,
    MODIFY `updateTime` DATETIME(0) NULL;

-- DropTable
DROP TABLE `sys_book_menu`;

-- CreateTable
CREATE TABLE `sys_read_plan` (
    `planId` INTEGER NOT NULL AUTO_INCREMENT,
    `planName` VARCHAR(50) NOT NULL,
    `createTime` DATETIME(3) NULL,
    `remark` VARCHAR(500) NULL,
    `updateTime` DATETIME(3) NULL,
    `createBy` VARCHAR(64) NULL,
    `updateBy` VARCHAR(64) NULL,
    `startTime` DATETIME(3) NULL,
    `endTime` DATETIME(3) NULL,
    `userId` INTEGER NULL,

    INDEX `sys_read_plan_userId_fkey`(`userId`),
    PRIMARY KEY (`planId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

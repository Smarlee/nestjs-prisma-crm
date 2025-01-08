/*
  Warnings:

  - A unique constraint covering the columns `[planId,userId]` on the table `plan_progress` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `plan_progress` ADD COLUMN `createBy` VARCHAR(64) NULL,
    ADD COLUMN `createTime` DATETIME(0) NULL,
    ADD COLUMN `updateBy` VARCHAR(64) NULL,
    ADD COLUMN `updateTime` DATETIME(0) NULL;

-- AlterTable
ALTER TABLE `sys_book_list` ADD COLUMN `bookPic` VARCHAR(255) NULL;

-- AlterTable
ALTER TABLE `sys_read_plan` ADD COLUMN `ids` VARCHAR(500) NULL;

-- CreateTable
CREATE TABLE `cart_item` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `bookId` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL DEFAULT 1,
    `paymentStatus` ENUM('PENDING', 'PAID', 'CANCELLED') NOT NULL DEFAULT 'PENDING',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_planprogresstosysbooklist` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_planprogresstosysbooklist_AB_unique`(`A`, `B`),
    INDEX `_planprogresstosysbooklist_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `plan_progress_planId_userId_key` ON `plan_progress`(`planId`, `userId`);

-- AddForeignKey
ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `sys_user`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_bookId_fkey` FOREIGN KEY (`bookId`) REFERENCES `sys_book_list`(`bookId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_planprogresstosysbooklist` ADD CONSTRAINT `_planprogresstosysbooklist_A_fkey` FOREIGN KEY (`A`) REFERENCES `plan_progress`(`progressId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_planprogresstosysbooklist` ADD CONSTRAINT `_planprogresstosysbooklist_B_fkey` FOREIGN KEY (`B`) REFERENCES `sys_book_list`(`bookId`) ON DELETE CASCADE ON UPDATE CASCADE;

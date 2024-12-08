-- CreateTable
CREATE TABLE `_read_plan_to_book_list` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_read_plan_to_book_list_AB_unique`(`A`, `B`),
    INDEX `_read_plan_to_book_list_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_read_plan_to_book_list` ADD CONSTRAINT `_read_plan_to_book_list_A_fkey` FOREIGN KEY (`A`) REFERENCES `sys_book_list`(`bookId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_read_plan_to_book_list` ADD CONSTRAINT `_read_plan_to_book_list_B_fkey` FOREIGN KEY (`B`) REFERENCES `sys_read_plan`(`planId`) ON DELETE CASCADE ON UPDATE CASCADE;

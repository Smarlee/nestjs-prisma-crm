-- CreateTable
CREATE TABLE `_sysreadplantosysuser` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_sysreadplantosysuser_AB_unique`(`A`, `B`),
    INDEX `_sysreadplantosysuser_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_sysreadplantosysuser` ADD CONSTRAINT `_sysreadplantosysuser_A_fkey` FOREIGN KEY (`A`) REFERENCES `sys_read_plan`(`planId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_sysreadplantosysuser` ADD CONSTRAINT `_sysreadplantosysuser_B_fkey` FOREIGN KEY (`B`) REFERENCES `sys_user`(`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

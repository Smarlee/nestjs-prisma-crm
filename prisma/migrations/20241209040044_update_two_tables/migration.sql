-- CreateTable
CREATE TABLE `plan_progress` (
    `progressId` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `planId` INTEGER NOT NULL,
    `progress` DOUBLE NOT NULL,
    `completed` BOOLEAN NOT NULL,

    PRIMARY KEY (`progressId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `plan_progress` ADD CONSTRAINT `plan_progress_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `sys_user`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `plan_progress` ADD CONSTRAINT `plan_progress_planId_fkey` FOREIGN KEY (`planId`) REFERENCES `sys_read_plan`(`planId`) ON DELETE RESTRICT ON UPDATE CASCADE;

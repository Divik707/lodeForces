-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" "Role" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Context" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Context_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Context2Challenges" (
    "id" TEXT NOT NULL,
    "contextId" TEXT NOT NULL,
    "challengeId" TEXT NOT NULL,
    "index" INTEGER NOT NULL,

    CONSTRAINT "Context2Challenges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Challenges" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "notionDoc" TEXT NOT NULL,
    "maxPoints" INTEGER NOT NULL,

    CONSTRAINT "Challenges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Summisons" (
    "id" TEXT NOT NULL,
    "contestId" TEXT NOT NULL,
    "challengeId" TEXT NOT NULL,
    "context2challengeMappingId" TEXT NOT NULL,
    "points" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Summisons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeaderBoard" (
    "id" TEXT NOT NULL,
    "contextId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "rank" INTEGER NOT NULL,

    CONSTRAINT "LeaderBoard_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Context2Challenges_contextId_challengeId_key" ON "Context2Challenges"("contextId", "challengeId");

-- CreateIndex
CREATE UNIQUE INDEX "LeaderBoard_contextId_rank_key" ON "LeaderBoard"("contextId", "rank");

-- AddForeignKey
ALTER TABLE "Context2Challenges" ADD CONSTRAINT "Context2Challenges_contextId_fkey" FOREIGN KEY ("contextId") REFERENCES "Context"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Context2Challenges" ADD CONSTRAINT "Context2Challenges_challengeId_fkey" FOREIGN KEY ("challengeId") REFERENCES "Challenges"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Summisons" ADD CONSTRAINT "Summisons_context2challengeMappingId_fkey" FOREIGN KEY ("context2challengeMappingId") REFERENCES "Context2Challenges"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaderBoard" ADD CONSTRAINT "LeaderBoard_contextId_fkey" FOREIGN KEY ("contextId") REFERENCES "Context"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaderBoard" ADD CONSTRAINT "LeaderBoard_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

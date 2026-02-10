/*
  Warnings:

  - A unique constraint covering the columns `[barcode]` on the table `products` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "products" ADD COLUMN     "barcode" VARCHAR(100),
ADD COLUMN     "prescription_required" BOOLEAN DEFAULT false;

-- AlterTable
ALTER TABLE "staff" ADD COLUMN     "password" VARCHAR(255);

-- CreateIndex
CREATE UNIQUE INDEX "products_barcode_key" ON "products"("barcode");

# 1. El Bucket
resource "aws_s3_bucket" "mi_primer_bucket" {
  bucket = "mi-bucket-vulnerable-test"
}

# 2. Desactivar el bloqueo de seguridad (IMPORTANTE)
resource "aws_s3_bucket_public_access_block" "allow_public" {
  bucket = aws_s3_bucket.mi_primer_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 3. Hacerlo público con una ACL (La forma vieja que los auditores detectan fácil)
resource "aws_s3_bucket_acl" "public_acl" {
  bucket = aws_s3_bucket.mi_primer_bucket.id
  acl    = "public-read"
  depends_on = [aws_s3_bucket_public_access_block.allow_public]
}
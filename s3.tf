resource "aws_s3_bucket" "nginx-statefile01" {
    bucket = "nginx-statefile01"
}

resource "aws_s3_bucket_ownership_controls" "nginx-statefile01" { 
   bucket = aws_s3_bucket.nginx-statefile01.id 
   rule { 
     object_ownership = "BucketOwnerPreferred" 
   } 
 } 
  
resource "aws_s3_bucket_acl" "nginx-statefile001" { 
   depends_on = [aws_s3_bucket_ownership_controls.nginx-statefile01] 
  
   bucket = aws_s3_bucket.nginx-statefile01.id 
   acl    = "private" 
    
 }
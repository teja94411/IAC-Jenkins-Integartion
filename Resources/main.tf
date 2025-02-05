//module "ec2" {
 // source = "./modules/ec2"
//}

//module "s3" {
 // source = "./modules/s3" 
//}

resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"

  tags = {
    Name = "JacksBlogExample"
  }
}





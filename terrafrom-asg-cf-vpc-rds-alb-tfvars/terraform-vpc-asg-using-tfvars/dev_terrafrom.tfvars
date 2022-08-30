region = "us-east-1"
cidr_block = "10.0.0.0/16"
public_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.2.0/24"]
private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.3.0/24"]
rds_private_subnet_cidr_blocks = ["10.0.30.0/24", "10.0.40.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
backup_retention_period = "7"
engine = "postgres"
engine_version = "10.17"
identifier = "mydb1"
instance_class = "db.t2.micro"
multi_az = false
name  =  "mydb1"
password ="password"
publicly_accessible = false
storage_encrypted = false
storage_type = "gp2"
username = "dbtest"
allocated_storage = "20"
port = "5432"

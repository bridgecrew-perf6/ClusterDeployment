/*******************************************************************************************************
**************************************** Jorge's modifications *****************************************
************************************** Commenting out legacy code **************************************
*************************************** Starting new vpc module ****************************************
********************************************************************************************************/
module "vpc" {
/*******************************************************************************************************
***************************************** Router config ************************************************
********************************************************************************************************/
Router configuration
  source  = "terraform-aws-modules/vpc/aws" //downloads the drivers for the virtual router
  version = "3.14.0" //upgraded version of the driver package.
  name    = "team-aqua-vpc" //vpc reference name

cidr_block = var.cidr_block_var
azs = var.availability_zone_source_aws
private_subnets         = [var.private_subnet_1, var.private_subnet_2, var.private_subnet_3] //Ip subnets for private IP nodes
public_subnets          = [var.public_subnet_1, var.public_subnet_2, var.public_subnet_3] //Ip subnets for public IP nodes
database_subnets        = [var.database_subnet_1, var.database_subnet_2, var.database_subnet_3] //Ip subnets for database IP nodes
enable_nat_gateway      = true //enables the option to communicate externally
single_nat_gateway      = true // Dynamically chooses a public subnet to access the internet
enable_dns_support      = true //enable masks for IPs
enable_dns_hostnames    = true // enable masks for user nodes

/*******************************************************************************************************
***************************************** DB config ****************************************************
********************************************************************************************************/
create_database_subnet_group       = true //Creates the database subnet group
create_database_subnet_route_table = true //Creates the table in charge of storing the subnets for each node
create_database_internet_gateway   = true //Creates internet link to the outside

/*******************************************************************************************************
***************************************** k8s config ***************************************************
********************************************************************************************************/
`` tags = {
     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
   }

   public_subnet_tags = {
     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
     "kubernetes.io/role/elb"                      = "1"
   }

   private_subnet_tags = {
     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
     "kubernetes.io/role/internal-elb"             = "1"
   }

   // Added tags for database_subnets
   database_subnets_tags = {
     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
     "kubernetes.io/role/elb"                      = "1"
   }





  # insert the 23 required variables here
}
# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "3.2.0"

#   name                 = "team-aqua-vpc"
#   cidr                 = "10.0.0.0/16"
#   azs                  = data.aws_availability_zones.available.names
#   private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
#   database_subnets     = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
#   enable_nat_gateway   = true
#   single_nat_gateway   = true
#   enable_dns_support   = true //Allows to change IP subnet to human readable code
#   enable_dns_hostnames = true //Gives human readable format to subnet IPs
  
  

#   create_database_subnet_group       = true
#   create_database_subnet_route_table = true

#   tags = {
#     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#   }

#   public_subnet_tags = {
#     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#     "kubernetes.io/role/elb"                      = "1"
#   }

#   private_subnet_tags = {
#     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#     "kubernetes.io/role/internal-elb"             = "1"
#   }

#   /****************************************************************************************************
#    *******************************Jorge modification #1************************************************
#    ****************************************************************************************************
#    ******I think that we were missing the method below, because to run a resource within a network,****
#    *****you need to assign a public subnet ip/mask in order for the resource to be available within****
#    *****the network. In this case, I might be wrong, but I think the database needs reference tags*****
#    *****in order to be referenced by the application. The thing is, to find where the subnets**********
#    *****are referenced within the application**********************************************************
#    ****************************************************************************************************
#   */
#   database_subnets_tags = {
#     "kubernetes.io/cluster/${local.cluster_name}" = "shared"
#     "kubernetes.io/role/elb"                      = "1"
#   }
  
# }

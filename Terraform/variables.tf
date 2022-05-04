# variable "availability_zones" {
#   description = "List of availability zones for the selected region"
#   type        = list(string)
#   default     = ["us-east-1", "us-east-2"]
# }

variable "region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}
###################################################################################################
########################################### Adding subnets ########################################
###################################################################################################

###################################################################################################
########################################### Private Subnets #######################################
###################################################################################################

###########################################
############# private subnet #1 ###########
###########################################
variable "private_subnet_1" {
  description = "private subnet #1 for vpc"
  type        = string
  default = "10.0.1.0/24"
}

###########################################
############# private subnet #2 ###########
###########################################
variable "private_subnet_2" {
  description = "private subnet #2 for vpc"
  type        = string
  default = "10.0.2.0/24"
}

###########################################
############# private subnet #3 ###########
###########################################
variable "private_subnet_3" {
  description = "private subnet #3 for vpc"
  type        = string
  default = "10.0.3.0/24"
}

###################################################################################################
########################################### Public Subnets ########################################
###################################################################################################

###########################################
############# Public subnet #1 ############
###########################################
variable "public_subnet_1" {
  description = "Public subnet #1 for vpc"
  type        = string
  default = "10.0.4.0/24"
}

###########################################
############# Public subnet #2 ############
###########################################
variable "public_subnet_2" {
  description = "Public subnet #2 for vpc"
  type        = string
  default = "10.0.5.0/24"
}

###########################################
############# Public subnet #3 ############
###########################################
variable "public_subnet_3" {
  description = "Public subnet #3 for vpc"
  type        = string
  default = "10.0.6.0/24"
}

###################################################################################################
########################################### Database Subnets ######################################
###################################################################################################

###########################################
############# Database subnet #1 ##########
###########################################
variable "database_subnet_1" {
  description = "Database subnet #1 for vpc"
  type        = string
  default = "10.0.7.0/24"
}

###########################################
############# Database subnet #2 ##########
###########################################
variable "database_subnet_2" {
  description = "Database subnet #2 for vpc"
  type        = string
  default = "10.0.8.0/24"
}

###########################################
############# Database subnet #3 ##########
###########################################
variable "database_subnet_3" {
  description = "Database subnet #3 for vpc"
  type        = string
  default = "10.0.9.0/24"
}

###########################################
###### IP alocation for virtual router ####
###########################################
variable "cidr_block_var" {
  description = "Ip alocation for classless inter domain rounting"
  type        = string
  default = "10.0.0.0/16"
}

###########################################
###### IP alocation for virtual router ####
###########################################
variable "availability_zone_source_aws" {
  description = "driver needed to dynamically use available zones according to customer's location"
  type        = string
  default = data.aws_availability_zones.available.names
}
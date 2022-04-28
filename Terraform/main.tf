terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11.0"
    }
    kubernetes = {
      version = "~> 2.10.0"
    }
    helm = {
      version = "~> 2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
  required_version = ">= 0.14.9"
}

data "aws_availability_zones" "available" {}

provider "aws" {
  region = var.region
}

locals {
  cluster_name    = "team-aqua-${random_string.suffix.result}"
  cluster_version = "1.22"
}

locals {
  name   = "rev-team-aqua-postgresql"
  region = var.region
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}

resource "aws_iam_user" "archie" {
  name = "archieAqua"
  path = "/"

  tags = {
    team = "aqua"
  }
}

resource "aws_iam_access_key" "archieKey" {
  user = aws_iam_user.archie.name
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

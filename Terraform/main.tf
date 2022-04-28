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
  name = "220307-kevin-sre-team-aqua"
  path = "/"

  tags = {
    "Team"         = "Aqua"
    "Created By"   = "Terraform"
    "Created On"   = "4/28/22"
    "Delete After" = "5/16/22"
  }
}

resource "aws_iam_access_key" "archieKey" {
  user = aws_iam_user.archie.name
}

resource "aws_iam_user_policy" "eks" {
  name = "cluster-access"
  user = aws_iam_user.archie.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:AccessKubernetesApi",
          "eks:DescribeCluster"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

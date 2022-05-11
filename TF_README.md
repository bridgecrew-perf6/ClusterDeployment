# Terraform Bubble Build

## Getting Started

Team Aqua's Bubble application provisions an EKS (Elastic Kubernetes Cluster), an RDS (Relational Database Service), and a VPC (virtual private cloud) from Amazon Web Services. In this documentation you will find a breakdown of the necessary steps needed in order to get the Bubble application hosted.

## Configuring IAM Credentials

Step 1: Configure Credentials
 * In AWS you will need to configure IAM credentials to have full access. 
  * Step a: To configure a new user go AWS > Services > IAM > Users > Add users
   *  Step b: Set user details: [give a username]
   *  Step c: Select accesss type: Access key - Programmatic access
   *  Step d: Set permissions > Attach existing policies directly
       *  add the following:
         * AmazonEC2FullAccess
         * IAMFullAccess
         * AWSCloudFormationFullAccess
         * AmazonRDSFullAccess
         * EKSFullAccess 
       	   * This is a custom permision. 
       	   * Go IAM > Policies > Create policy
       	     * Service: EKS  
       	     * Actions: All EKS actions
       	     * Resoucres: All resources
       	     * No Conditions
       	     * name: EKSFullAccess
       	     * Add tags as wanted
       	   * Go IAM > Users > Attach existing policy
       	   * Add EKSFullAccess
       	   
   * Step e: Add tags as wanted
   * step f: Create user
 
## Configuring Secrets
* secrets will need to be configured in order to get credentials for the RDS and for email verification.
  
  
Step 2: Run scripts
  * In the terminal run the following commands in the same folder as the terraform scripts:
    > Terraform init
    
    > Terraform plan
    
    > Terraform apply
    
    
Step 3: Provide database username and password
  * provide database username and database password when prompted.
  
  
Step 4: Get Access keys and database endpoint
  * Run the command below to get your IAM credentials for the kubernetes cluster.
  * AWS configure on any machine that needs to access the cluster.
    > terraform output user_access_keys
   
  * Run the next command to get the URL for your database
    > terraform output database_endpoint
  

Step 5: Next a Secret.yml file will need to be configured

  * Add the following code to your secret.yml file

    > apiVersion: v1

    > kind: Secret

    > metadata:

      > name: bubble-secret
  
    > type: Opaque

    > stringData:

      > db-url: jdbc:postgresql://[DATABASE URL]:5432/bubbledb
  
      > db-username: [DATABASE USERNAME]
  
      > db-password: [DATABASE PASSWORD]
  
      > email-address: [EMAIL ADDRESS]@gmail.com
  
      > email-password: [EMAIL PASSWORD]
 
 
* Run following command to apply to terrafrom script (make sure you are in the right namspace)
 
   > kubectl apply --secret.yml
  





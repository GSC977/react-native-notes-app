Prerequisites (Before starting, make sure you have the following:)

a. An AWS account
b. Terraform (or another IaC tool like CloudFormation or Ansible)
c. Node.js and npm installed locally (for testing before deployment)
d.  GitHub account
e. SSH access to your AWS EC2 instance

You will also need to create the following GitHub Secrets:
1. EC2_PUBLIC_IP: Public IP address of your EC2 instance.
2.  EC2_SSH_PRIVATE_KEY: Your SSH private key to connect to the EC2 instance.

Fork the Repository
1. Fork the React Native Notes App repository to your GitHub account.
2. Clone the forked repository to your local machine:
   - git clone https://github.com/your-username/react-native-notes-app.git

Provision AWS EC2 Instance
You can provision your EC2 instance using Terraform.
1. Install Terraform if not already installed. Follow Terraform installation guide.
2. Navigate to the terraform directory and initialize Terraform:
   - terraform init
3. Apply the Terraform configuration to provision the EC2 instance:
   - terraform apply
4. Once the Terraform configuration is applied successfully, your EC2 instance will be up and running. The public IP address will be displayed in the output.
5. SSH into your EC2 instance:
   - ssh -i /path/to/your/private-key.pem ec2-user@<EC2_PUBLIC_IP>
6. Install required dependencies on EC2 (like Node.js, npm, and Git):
   - sudo yum update -y
   - sudo yum install -y nodejs npm git

************************************************************************************************

Setting Up the CI/CD Pipeline
This project uses GitHub Actions to automate the CI/CD pipeline. The pipeline does the following:

1. Triggers on every push to the main branch.
2. Installs dependencies and runs tests.
3. Deploys the app to the EC2 instance via SSH.

Steps to Set Up GitHub Actions
1. Inside your forked repository, we have a folder called pipeline and inside that pipeline.yml file.
2. Set GitHub Secrets:
  - Go to your repository settings on GitHub.
  - Under Secrets, add the following secrets:
    - EC2_PUBLIC_IP: The public IP of your EC2 instance.
    - EC2_SSH_PRIVATE_KEY: Your SSH private key (use the key that matches your EC2 instance).

How the CI/CD Workflow Works
1. When a change is pushed to the main branch, the workflow triggers automatically.
2. The pipeline installs the necessary dependencies, runs tests, and then SSHs into the EC2 instance to deploy the latest code.

************************************************************************************************

Testing the Deployment
Once the pipeline runs successfully, follow these steps to verify the deployment:

1. After the pipeline completes, the React Native Notes App should be live on your EC2 instance.
2. Open a web browser and enter the public IP address of the EC2 instance (e.g., http://<EC2_PUBLIC_IP>).
3. You should see the React Native Notes App running. If using Nginx or a similar proxy, ensure that the application is properly configured to handle requests.

This README.md provides clear instructions for setting up the CI/CD pipeline, provisioning the AWS EC2 instance, and verifying the deployment. Make sure to adapt specific details such as repository URLs, file paths, and configurations based on your project's actual setup.
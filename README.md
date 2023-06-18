# DevOps Infrastructure Deployment Project
This project focuses on automating the deployment and management of a scalable infrastructure environment using Terraform and Jenkins on AWS. The infrastructure consists of various AWS resources and services, including EC2 instances, Jenkins server, load balancer, CloudWatch alarms, GitHub repository, DynamoDB table, S3 bucket, and IAM user.

## Project Structure
The project is organized into several Terraform modules, each responsible for provisioning and configuring a specific set of resources. The modules include:

&#8226; EC2 Instance with Jenkins Server: Provisions an EC2 instance with Jenkins server installed, acting as the central hub for managing the deployment pipeline.

&#8226; Creation of EC2 Instances: Creates additional EC2 instances to support various components within the infrastructure.

&#8226; Load Balancer: Sets up an Application Load Balancer to distribute incoming traffic across the EC2 instances, enhancing scalability and availability.

&#8226; CloudWatch Alarms: Configures CloudWatch alarms to monitor metrics and trigger notifications or actions based on predefined thresholds.

&#8226; GitHub Repository: Creates a GitHub repository to store and manage the project's source code, facilitating version control and collaboration.

&#8226; DynamoDB Table: Provisions a DynamoDB table, offering a highly scalable NoSQL database for structured data storage and retrieval.

&#8226; S3 Bucket: Sets up an S3 bucket, a scalable object storage service for managing data, artifacts, and backups.

&#8226; IAM User: Creates an IAM user with appropriate access and permissions for managing the infrastructure resources.

Additionally, there is a separate monitoring module that deploys a local Prometheus and Grafana environment using Docker Compose. This module enables monitoring and visualization of CPU usage across the agent instances.

## Deployment and Lifecycle
The infrastructure deployment and lifecycle management are orchestrated using Jenkins pipeline jobs. The Jenkins pipeline includes the following stages:

1. Deployment: Triggers the Terraform scripts for each module, ensuring consistent and automated infrastructure provisioning.
2. Monitoring: Deploys the monitoring module with Prometheus and Grafana to monitor agent instances' CPU usage.
3. Destruction: Executes a separate pipeline job to tear down the infrastructure by running the Terraform destroy command for each module.

## AWS Setup
Before deploying the infrastructure, make sure you have set up the following:

1. Create an AWS account and generate access credentials with appropriate permissions.
2. Install and configure the AWS CLI on your local machine.
3. Set up your AWS credentials locally by running aws configure and providing your access key and secret key.

## Repository Structure
The project repository is structured as follows:

&#8226; modules/: Contains Terraform modules for each resource.

&#8226; monitoring/: Includes YAML files for setting up Prometheus and Grafana monitoring.

&#8226; Jenkinsfile: Defines the Jenkins pipeline, specifying the deployment and destruction stages.

&#8226; README.md: Project documentation providing an overview, instructions, and guidelines.

&#8226; Additional project-specific files and directories as required.

## Instructions
To successfully deploy and manage the infrastructure, follow these steps:

1. Clone the project repository to your local machine.
2. Set up Jenkins with the required plugins and configurations.
3. Review and update the Terraform variables in each module's variables.tf file based on your specific requirements.
4. Customize the monitoring configuration in the monitoring/ directory if necessary.
5. Adapt the Jenkins pipeline job(s) to match your Jenkins setup and environment.
6. Execute the Jenkins pipeline job(s) to deploy and manage the infrastructure.
7. Utilize the Prometheus and Grafana monitoring setup to monitor CPU usage across the infrastructure.
8. When no longer needed, execute the destruction pipeline job to tear down the infrastructure.
Refer to the module documentation and Jenkins pipeline job(s) for detailed instructions and usage guidelines.

## Contributing
Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch: git checkout -b new-feature.
3. Make your changes and commit them: git commit -m 'Add some feature'.
4. Push your changes to the branch: git push origin new-feature.
5. Submit a pull request detailing your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
If you have any questions, suggestions, or feedback, please feel free to contact __Sivan Marom__ at __sivmarom@gmail.com__.

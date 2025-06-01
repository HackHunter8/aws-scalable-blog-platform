# aws-scalable-blog-platform
# AWS Scalable Blog Platform (Flask + Docker + Gunicorn)

This project is a scalable blog infrastructure built with Flask, containerized using Docker and ready for cloud deployment with GitOps, monitoring, and security scanning in mind. The goal is to demonstrate how to build, containerize, and prepare a basic blog application for production in a scalable, secure and observable way.

## Project Goal
- Build a simple Flask web app (company blog)
- Containerize it using Docker
- Serve it with Gunicorn
- Deploy on EC2 behind an Application Load Balancer (ALB)
  - GitOps (Argo CD)
  - Image vulnerability scanning (Trivy)
  - Monitoring (Prometheus + Grafana)
  - Helm packaging 

## Architecture Overview
The infrastructure includes:

* **Amazon EC2**: Hosts the blog application.
* **Application Load Balancer (ALB)**: Distributes incoming HTTP requests to EC2 instances.
* **Amazon RDS (MySQL)**: Stores blog content and user data.
* **Amazon S3**: Serves static content like images or backups.
* **Amazon CloudFront**: Distributes S3 content with low latency.
* **Multi-AZ deployment**: Ensures high availability.
* **IAM Roles**: Secure access to resources.

## Kubernetes Component
* **EKS or local cluster (Minikube)**: Not used here—this is EC2-based but reflects production-style infra.
* **Trivy Operator**: Installed to scan workloads, although in this iteration it failed to generate reports.
* **Helm**: Used for installing Trivy.

## DevOps Tools and Features
* **Infrastructure as Code**: Setup is managed via the AWS Console and CLI, though future plans include Terraform.
* **Security Scanning**: Trivy Operator was deployed to enable vulnerability scanning.
* **Monitoring**: Prometheus and Grafana will be integrated later.
* **CI/CD**: Manual deployments for now, with plans to automate via GitHub Actions.

## Setup Instructions
### Prerequisites
* AWS CLI configured
* Access to AWS account with permission to provision EC2, ALB, RDS, S3, and CloudFront

### EC2 + ALB Setup
1. Launch EC2 instances using Amazon Linux 2
2. Install and run Nginx or your blog application
3. Create an ALB and register the EC2 instances as targets

### RDS Setup
1. Create a MySQL database in a Multi-AZ setup
2. Connect blog application to RDS using environment variables or config

### S3 and CloudFront
1. Create S3 bucket for static files
2. Upload blog assets (e.g., images)
3. Set up CloudFront distribution to serve the S3 content

### Security
* EC2 instances use IAM roles with minimum permissions
* Security groups restrict access to only required ports
* Trivy Operator deployed in a separate namespace (`trivy-system`) to scan workloads

### Known Issues
* Trivy Operator pods run but fail to generate vulnerability reports due to sync/cache issues
* Trivy scan jobs are failing—pending further debugging or image patching

## Next Steps
* Resolve Trivy Operator issues
* Migrate infrastructure management to Terraform
* Add Prometheus and Grafana for observability
* Enable GitOps via Argo CD

## Repository Structure (Planned)
company-blog-infra/
├── ec2-setup/
├── rds-setup/
├── s3-cloudfront/
├── monitoring/         # Prometheus & Grafana 
├── security/           # Trivy configs, IAM docs
├── ci-cd/              # GitHub Actions pipelines 
└── README.md
```

## Author

* David — DevOps Engineer | Cloud Architect

## License

MIT



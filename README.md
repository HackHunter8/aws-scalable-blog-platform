# aws-scalable-blog-platform
# AWS Scalable Blog Platform (Flask + Docker + Gunicorn)

This project is a **scalable blog infrastructure** built with **Flask**, containerized using **Docker**, and ready for cloud deployment with **GitOps, monitoring, and security scanning** in mind. The goal is to demonstrate how to build, containerize, and prepare a basic blog application for production in a scalable, secure, and observable way.

---

## 📌 Project Goals

- Build a simple **Flask web app** (company blog)
- Containerize it using **Docker**
- Serve it with **Gunicorn**
- Deploy on **EC2** behind an **Application Load Balancer (ALB)**
- Prepare for:
  - GitOps (Argo CD)
  - Image vulnerability scanning (Trivy)
  - Monitoring (Prometheus + Grafana)
  - Helm packaging (coming soon)

---

## 🧱 Stack

| Component     | Description                                      |
|---------------|--------------------------------------------------|
| Flask         | Python web framework for building the blog app   |
| Gunicorn      | Production WSGI server for running Flask         |
| Docker        | Containerization tool                            |
| EC2           | AWS virtual server used for hosting              |
| GitHub        | Source control and deployment trigger point      |

---

## 📁 Project Structure


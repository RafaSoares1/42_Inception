# Inception Project

## Overview

This project, named "Inception," leverages Docker and Docker Compose to streamline the deployment of a WordPress website with MariaDB as the database backend, all served through NGINX. Below, we'll explore the fundamental concepts involved in the project.

### Docker and Docker Compose

**How Docker and docker-compose work:**
- **Docker:** A containerization platform that allows applications and their dependencies to run in isolated environments called containers. Docker ensures consistency across different development and deployment environments.
- **Docker Compose:** A tool for defining and running multi-container Docker applications. It simplifies the process of managing multiple Docker containers and their interdependencies.

**Difference between a Docker image used with Docker Compose and without Docker Compose:**
- **Without Docker Compose:** Images are run individually using `docker run` commands, and managing dependencies and networks between containers becomes more complex.
- **With Docker Compose:** The `docker-compose.yml` file defines the entire application stack, including services, networks, and volumes. Running the application becomes a single command, simplifying orchestration.

**Benefits of Docker compared to VMs:**
- **Resource Efficiency:** Containers share the host OS kernel, reducing resource overhead compared to virtual machines.
- **Portability:** Docker containers encapsulate the application and its dependencies, ensuring consistency across different environments.
- **Isolation:** Containers provide a level of isolation similar to virtual machines, but with less overhead.

### NGINX, Port 443, SSL/TLS Certificate

**NGINX:**
- A high-performance web server and reverse proxy server.
- Used to efficiently serve static content, balance load, and act as a reverse proxy for other web servers.

**Port 443:**
- The default port for HTTPS traffic. HTTPS ensures secure communication over the internet using encryption.

**SSL/TLS Certificate:**
- SSL/TLS certificates are cryptographic protocols that provide secure communication over a computer network.
- They are used to secure the data exchanged between a user's browser and the web server.

### Dockerfiles

- Dockerfiles are configuration files that contain instructions for building Docker images.
- They specify the base image, application code, dependencies, and configurations required to create a reproducible Docker image.

### Docker Network

- Docker Network facilitates communication between Docker containers. It allows containers to discover and communicate with each other using container names.

### WordPress and MariaDB

**WordPress:**
- An open-source content management system (CMS) used to create websites and blogs.

**MariaDB:**
- A community-developed fork of MySQL, a relational database management system. MariaDB serves as the backend database for WordPress.

### Docker Compose File

- The `docker-compose.yml` file defines the services (MariaDB, WordPress, NGINX), networks, and volumes required for the project.
- It specifies how the containers interact with each other.

![image](https://github.com/RafaSoares1/42_Inception/assets/103336451/393f1a97-d9d0-463e-957d-12da6cb9fb53)

## Final grade
![image](https://github.com/RafaSoares1/42_Inception/assets/103336451/a568ab1e-908e-4dd8-bb4d-314928a1eb05)



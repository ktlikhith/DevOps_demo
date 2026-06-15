# DevOps Demo — Nginx + Docker

A simple static web app served by Nginx inside Docker.

## Files

```
app/
├── index.html   # The web page
├── Dockerfile   # Docker build instructions
└── README.md    # This file
```

## Build the Docker Image

```bash
docker build -t devops-demo .
```

## Run the Container

```bash
docker run -d -p 8080:80 --name devops-demo devops-demo
```

Then open your browser at: **http://localhost:8080**

## Useful Commands

```bash
# View running containers
docker ps

# View logs
docker logs devops-demo

# Stop the container
docker stop devops-demo

# Remove the container
docker rm devops-demo

# Remove the image
docker rmi devops-demo
```

# Use official lightweight Nginx image
FROM nginx:alpine

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy our app files into the Nginx web root
COPY index.html /usr/share/nginx/html/index.html
# Fix permissions for index.html
RUN chmod 644 /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx in foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]

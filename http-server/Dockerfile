# Base image
FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add custom index.html
COPY index.html /var/www/html/index.html

# Create a non-root user
RUN useradd -m devops

# Set ownership of web files
RUN chown -R devops:devops /var/www/html

# Switch to non-root user
USER devops

# port
EXPOSE 80

# Start nginx 
CMD ["nginx", "-g", "daemon off;"]

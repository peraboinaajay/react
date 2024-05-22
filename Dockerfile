# Use the official Jenkins image as the base
FROM jenkins/jenkins:lts

# Switch to root user to install additional packages
USER root

# Update package list and install prerequisites
RUN apt-get update && apt-get install -y curl

# Add NodeSource repository and install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to the Jenkins user
USER jenkins

# Expose default Jenkins port
EXPOSE 8088

# Define default command
CMD ["jenkins.sh"]

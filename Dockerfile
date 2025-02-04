# Use the official Node.js image as the base image
FROM node:20.4

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install --no-audit --fund false

# Copy the rest of the files to the container
COPY . .

# Create and setup entrypoint script
RUN echo '#!/bin/sh\nchmod 666 /app/config.js\nexec "$@"' > /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

# Change ownership of files in lib/bin and set permissions
RUN chown -R node:node lib/bin/* && \
    chmod u+x lib/bin/* && \
    chmod -R 777 /app

# Run as the "node" user for better security practices
USER node

RUN ls -la

# Set the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]

# Start the application
CMD ["node", "clewd.js"]
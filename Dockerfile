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

# Start the application
CMD ["node", "clewd.js"]

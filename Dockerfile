# Use an official Node.js runtime as a parent image
FROM node:latest AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --f

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Export the static site
# RUN npm run export

# Expose port 4600
EXPOSE 4600

# Start nginx
CMD ["npm", "run", "dev"]

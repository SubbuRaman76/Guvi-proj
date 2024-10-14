# Use Node.js 16 Alpine image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json to the working directory
COPY package.json .

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port 80 to the outside world
EXPOSE 80

# Start the application
CMD ["npm", "start"]


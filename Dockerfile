# Use the official Node.js image.
FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Expose port 80
EXPOSE 80

# Start the application
CMD ["npm", "start"]


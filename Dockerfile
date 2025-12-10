# Use an official Node.js LTS image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package files first (better layer caching)
COPY package*.json ./

# Install dependencies (only production deps by default)
RUN npm ci --only=production

# Copy the rest of the app source code
COPY . .

# Expose the port the app runs on (crud-app uses 3000)
EXPOSE 3000

# Set NODE_ENV
ENV NODE_ENV=production

# Start the app
CMD ["npm", "start"]

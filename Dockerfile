# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application with Vite
RUN npm run build

# Expose the port that your Vite development server runs on (default is 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]
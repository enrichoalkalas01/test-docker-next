# Base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
# RUN npm ci --production
RUN npm install -g npm@latest

# Copy the rest of the application code
COPY . .

RUN npm install

# Build the Next.js application
RUN npm run build

# Expose the port on which the Next.js application will run (default is 3000)
EXPOSE 3000

# Set the command to start the Next.js application
CMD ["npm", "start"]

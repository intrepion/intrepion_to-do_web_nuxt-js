# /docker/Dockerfile

# Use Node.js 22-alpine as the base image
FROM node:22-alpine AS development

# Set working directory
WORKDIR /app

# Install PM2 globally
RUN npm install -g pm2

# Copy package.json and package-lock.json (if available)
COPY intrepion-to-do-nuxt-js/package*.json ./

# Install dependencies
RUN npm install

# Copy the application code
COPY intrepion-to-do-nuxt-js/ ./

# Create entrypoint script
RUN echo '#!/bin/sh\n\
# Start Nuxt.js development server with PM2 and watch for changes\n\
pm2-runtime start npm --name "nuxtjs-dev" -- run dev\n\
' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

# Expose port 3000
EXPOSE 3000

# Start the application using the entrypoint script
CMD ["sh", "/app/entrypoint.sh"]

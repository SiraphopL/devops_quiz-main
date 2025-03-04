FROM alpine:3.21

# Install necessary packages
RUN apk update && apk add --no-cache nodejs npm

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 3002

# Command to run the application
CMD ["node", "app.js"]
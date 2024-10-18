# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy the build output from Flutter into the container's Nginx HTML directory
COPY build/web /usr/share/nginx/html

# Expose port 80 for serving the app
EXPOSE 80

# Run Nginx in the foreground (daemon off)
CMD ["nginx", "-g", "daemon off;"]

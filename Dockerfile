# Use the official phpMyAdmin image
FROM phpmyadmin:latest

# Set environment variables for PHPMyAdmin
ENV PMA_HOST=db
ENV PMA_PORT=3306

# Expose port 80 to access PHPMyAdmin
EXPOSE 80

# Start PHPMyAdmin
CMD ["phpmyadmin"]

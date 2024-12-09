# Base Rasa image
FROM rasa/rasa:latest

# Copy project files
COPY . /app

# Set the working directory
WORKDIR /app

# Expose the Rasa server port
EXPOSE 5005

# Command to start the Rasa server
CMD ["run", "--enable-api", "--cors", "*", "--debug"]

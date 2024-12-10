# Base Rasa image
FROM rasa/rasa:latest

# Copy project files (NLU, stories, domain, etc.)
COPY . /app

# Set the working directory
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Train the Rasa model (optional, depending on workflow)
RUN rasa train

# Expose the Rasa server port
EXPOSE 5005

# Command to start the Rasa server
CMD ["run", "--enable-api", "--cors", "*", "--debug"]

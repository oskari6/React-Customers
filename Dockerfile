# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory inside the container
WORKDIR /backend

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements.txt from the local backend directory into the container
COPY backend/requirements.txt /backend/

# Install dependencies
RUN pip install --no-cache-dir -r /backend/requirements.txt

# Copy the rest of the Django project (local backend directory) into the container
COPY ./backend /backend/

# Expose port 8000 for the Django development server
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
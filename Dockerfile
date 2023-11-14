# Use an official Python runtime as a parent image
FROM python:3.13-rc-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory to /app
WORKDIR /app

# Copy the requirements.txt file into the container at /app/
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Apply database migrations when the container starts
CMD ["sh", "-c", "python src/PetsFinder/manage.py migrate && python src/PetsFinder/manage.py runserver 0.0.0.0:8000"]

FROM python:3.9-slim-bullseye

# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Copy project files
WORKDIR /app
COPY . .

# Install python requirements
RUN pip install --no-cache-dir -r requirements.txt

# Start script
CMD ["bash", "start.sh"]

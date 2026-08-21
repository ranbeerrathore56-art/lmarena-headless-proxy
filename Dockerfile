FROM python:3.10-slim

WORKDIR /app

# Install system dependencies required for Playwright/Camoufox
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    wget \
    gnupg \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install headless browser binaries
RUN python -m playwright install --with-deps chromium
RUN camoufox fetch

COPY . .

# Pass port from environment
CMD ["python", "src/main.py"]

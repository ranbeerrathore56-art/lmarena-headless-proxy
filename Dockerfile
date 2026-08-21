# Use the official Microsoft Playwright image which has ALL required GUI/Browser dependencies
FROM mcr.microsoft.com/playwright/python:v1.40.0-jammy

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Camoufox needs this specifically
RUN camoufox fetch

COPY . .

# Ensure port is respected
CMD ["python", "src/main.py"]

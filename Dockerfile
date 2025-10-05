# Use a small Python image
FROM python:3.11-slim

# Work inside /app (this will contain your source code)
WORKDIR /app

# Install Python deps first (better layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only the app code into the container's /app
COPY app/ /app

# Render expects your service to listen on 8000
EXPOSE 8000

# Start FastAPI (note: we run from /app so module is just "main:app")
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


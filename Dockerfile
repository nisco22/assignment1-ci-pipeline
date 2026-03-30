# -----------------------------
# STAGE 1: BUILD STAGE
# -----------------------------
FROM python:3.11-alpine AS builder

# Set working directory
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install dependencies into a local folder
RUN pip install --user -r requirements.txt

# Copy application code
COPY . .


# -----------------------------
# STAGE 2: PRODUCTION STAGE
# -----------------------------
FROM python:3.11-alpine

# Create a non-root user
RUN adduser -D appuser

# Set working directory
WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /root/.local /home/appuser/.local
COPY app.py .

# Set environment PATH
ENV PATH=/home/appuser/.local/bin:$PATH

# Switch to non-root user
USER appuser

# Run application
CMD ["python", "app.py"]
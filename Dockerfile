# 1. Use an official Python base image
FROM python:3.11-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy your requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install jupyter

# 4. Copy your notebook into the container
COPY . .

# 5. Expose the port Jupyter runs on
EXPOSE 8888

# 6. Command to run Jupyter Lab or Notebook on startup
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
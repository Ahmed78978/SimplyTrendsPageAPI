


# Start with a more lightweight base image if possible
FROM python:3.9-slim



# Install only the essential tools and packages needed, and clean up in one layer to keep the image size small
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    && wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the PATH environment variable
ENV PATH /root/.local/bin:$PATH

# Copy the requirements file and install Python dependencies in one layer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application


# Copy the rest of your application


# Make sure any binaries or scripts from Chrome are executable, if necessary
# Depending on how you plan to run Chrome, you might need to set permissions
# RUN chmod +x /opt/chrome/chrome  # Adjust this line as necessary

# Set environment variables to run Chrome in a headless environment

# If using chromedriver or similar tools, ensure they know where to find Chrome









ENV PATH /root/.local/bin:$PATH

# Copy the requirements file and install Python dependencies in one layer


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application
COPY . .


# Further instructions to set up your application




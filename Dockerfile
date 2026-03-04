FROM teddysun/xray:latest

# Create config directory
RUN mkdir -p /etc/xray

# Copy config file
COPY config.json /etc/xray/config.json

# Expose port
EXPOSE 4443

# Run xray
CMD ["xray", "-config", "/etc/xray/config.json"]

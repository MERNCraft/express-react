server {
    listen 80;
    server_name example.com;

    # Reverse Proxy all calls to Express backend (localhost:1333)
    # Express will serve the frontend from `static/`
    
    location / {
        # Proxy to Express backend
        proxy_pass http://localhost:1333;

        # Preserve the original host
        proxy_set_header Host $host;

        # Upgrade connection (for WebSockets)
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_cache_bypass $http_upgrade;

        # Pass the real client IP
        proxy_set_header X-Real-IP $remote_addr;
        # Forward client IP chain
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        # Pass the protocol (http or https)
        proxy_set_header X-Forwarded-Proto $scheme;
        # Pass the original port
        proxy_set_header X-Forwarded-Port $server_port;
    }
}
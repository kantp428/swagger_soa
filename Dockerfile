FROM nginx:alpine

# Copy Swagger UI files to nginx html directory
COPY index.html /usr/share/nginx/html/index.html
COPY new.openapi.json /usr/share/nginx/html/new.openapi.json

# Optional: custom nginx config to allow CORS
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

# Dockerfile
FROM nginx

# Copia el archivo de HTML a la ruta de nginx
COPY webStreaming /usr/share/nginx/html

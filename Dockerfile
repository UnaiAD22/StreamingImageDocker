# Imagen base con soporte RTMP
FROM alfg/nginx-rtmp

# Crear el directorio HLS
#RUN mkdir -p /var/html/hls && chmod -R 755 /var/html/hls
RUN mkdir -p /usr/local/nginx/html/hls && chmod -R 755 /usr/local/nginx/html/hls

# Copiar los archivos de configuración y contenido
COPY nginx.conf /etc/nginx/nginx.conf
COPY webStreaming /usr/share/nginx/html
# COPY manifest.conf /usr/local/nginx/conf/manifest.conf

# Exponer puertos necesarios
EXPOSE 80 1935

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]

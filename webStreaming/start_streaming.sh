#!/bin/bash

# Procesar el stream RTMP y generar HLS
sudo ffmpeg -i rtmp://localhost/live/stream -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k \
-vf "scale=-2:720" -g 50 -hls_time 4 -hls_playlist_type event \
-hls_segment_filename /usr/local/nginx/html/hls/stream%03d.ts /usr/local/nginx/html/hls/stream.m3u8#!/bin/bash
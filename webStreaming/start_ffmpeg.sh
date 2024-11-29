#!/bin/bash

# Procesar archivos locales en múltiples resoluciones
ffmpeg -i bideoak/bideoa2.mp4 \
-vf scale=w=2560:h=1440 -c:v libx264 -b:v 6000k -maxrate 6500k -bufsize 9750k -g 48 -sc_threshold 0 -c:a aac -b:a 256k -ar 44100 -f hls -hls_time 4 -hls_playlist_type vod -hls_segment_filename bideoak/1440p_%03d.ts bideoak/1440p.m3u8 \
-vf scale=w=1920:h=1080 -c:v libx264 -b:v 4500k -maxrate 5000k -bufsize 7500k -g 48 -sc_threshold 0 -c:a aac -b:a 192k -ar 44100 -f hls -hls_time 4 -hls_playlist_type vod -hls_segment_filename bideoak/1080p_%03d.ts bideoak/1080p.m3u8 \
-vf scale=w=1280:h=720 -c:v libx264 -b:v 2500k -maxrate 3000k -bufsize 5000k -g 48 -sc_threshold 0 -c:a aac -b:a 128k -ar 44100 -f hls -hls_time 4 -hls_playlist_type vod -hls_segment_filename bideoak/720p_%03d.ts bideoak/720p.m3u8 \
-vf scale=w=854:h=480 -c:v libx264 -b:v 1000k -maxrate 1500k -bufsize 3000k -g 48 -sc_threshold 0 -c:a aac -b:a 96k -ar 44100 -f hls -hls_time 4 -hls_playlist_type vod -hls_segment_filename bideoak/480p_%03d.ts bideoak/480p.m3u8 \
-vf scale=w=640:h=360 -c:v libx264 -b:v 500k -maxrate 750k -bufsize 1500k -g 48 -sc_threshold 0 -c:a aac -b:a 64k -ar 44100 -f hls -hls_time 4 -hls_playlist_type vod -hls_segment_filename bideoak/360p_%03d.ts bideoak/360p.m3u8 \
-vf scale=w=426:h=240 -c:v libx264 -b:v 300k -maxrate 450k -bufsize 900k -g 48 -sc_threshold 0 -c:a aac -b:a 48k -ar 44100 -f hls -hls_time 4 -hls_playlist_type vod -hls_segment_filename bideoak/240p_%03d.ts bideoak/240p.m3u8 \
-vf scale=w=256:h=144 -c:v libx264 -b:v 150k -maxrate 225k -bufsize 450k -g 48 -sc_threshold 0 -c:a aac -b:a 32k -ar 44100 -f hls -hls_time 4 -hls_playlist_type vod -hls_segment_filename bideoak/144p_%03d.ts bideoak/144p.m3u8


# Procesar el stream RTMP y generar HLS
sudo ffmpeg -i rtmp://localhost/live/stream -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k \
-vf "scale=-2:720" -g 50 -hls_time 4 -hls_playlist_type event \
-hls_segment_filename /usr/local/nginx/html/hls/stream%03d.ts /usr/local/nginx/html/hls/stream.m3u8

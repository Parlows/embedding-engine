docker stop embedding-server
docker rm embedding-server
docker build -t embedding-engine .
docker run -it --name embedding-server -p 1809:1809 embedding-engine
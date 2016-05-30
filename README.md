## Required Docker Images
- apt-cacher-ng
- base-image

## Build
```
  docker build -t webpy:latest .
```

## Run
```
  docker run -d -p 8080:8080 -h webpy --name webpy webpy:latest
```

# Web.py image of Debian Jessie [![Build Status](https://travis-ci.org/3d-pro/webpy.svg?branch=master)](https://travis-ci.org/3d-pro/webpy)

## Required Docker Images
- apt-cacher-ng
- openssh

## Build
```
  docker build -t webpy:latest .
```

## Run
```
  docker run -d -p 8080:8080 -h webpy --name webpy webpy:latest
```

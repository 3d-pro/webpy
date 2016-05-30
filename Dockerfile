FROM 3dpro/openssh
MAINTAINER Kittipun Khantitrirat <boot191@gmail.com>

ADD build-files /build-files
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/11proxy && \
    apt-get update && \
    apt-get install -y python-pip && \
    pip install web.py && \
    mv /build-files/authorized_keys /root/.ssh/authorized_keys && \
    mv /build-files/start.sh /start.sh && \
    mv /build-files/webpy-logrotate /etc/logrotate.d/webpy && \
    useradd -s /bin/bash -d /home/web -m web && \
    mv /build-files/application.py /home/web/ && \
    sudo -u web -H mkdir -p /home/web/static && \
    touch /var/log/webpy.log && \
    chown web:web /var/log/webpy.log && \
    chown web:web -R /home/web/ && \
    chown root:root /root/.ssh && \
    chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/authorized_keys && \
    chown root:root /start.sh && \
    chmod 755 /start.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /build-files /etc/apt/apt.conf.d/11proxy

VOLUME ["/home/web/","/var/log/"]

CMD ["/start.sh"]

# Expose port
EXPOSE 8080

FROM seafileltd/seafile:v6.2.2

CMD ["/sbin/my_init", "--", "/scripts/start.py"]

# shared/ are ignored in .dockerignore
ADD . /app #asdf

RUN cp -rp /app/scripts /scripts && \
    cp -rp /app/bootstrap /bootstrap && \
    cp /app/bootstrap/generated/seafile.nginx.conf /etc/nginx/sites-enabled/seafile.nginx.conf
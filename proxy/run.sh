docker build -t my-haproxy .
docker run -p 80:80 -p 443:443 -v haproxy2.cfg:/usr/local/etc/haproxy/haproxy.cfg -it --rm --name haproxy-syntax-check my-haproxy haproxy  -v -f /usr/local/etc/haproxy/haproxy.cfg

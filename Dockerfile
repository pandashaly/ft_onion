FROM nginx:latest

RUN apt-get update && apt-get install -y \
	nginx \
	tor \
	openssh-server \
	curl \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
RUN mkdir -p /var/lib/tor/hidden_service

EXPOSE 80 4242
#not ssh port 22 bc its often a target for attacker
# 80 is standard for http traffic - via .onion

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css
COPY image.png /usr/share/nginx/html/image.png
COPY torrc /etc/tor/torrc
COPY sshd_config /etc/ssh/sshd_config
COPY start_services.sh /usr/local/bin/start_services.sh

RUN chmod +x /usr/local/bin/start_services.sh

CMD service nginx start && \
	service ssh start && \
	tor

RUN echo "sud0_please_let_me_in" | chpasswd

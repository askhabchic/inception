FROM debian:buster

WORKDIR /usr/lib/my_dir

RUN apt update && apt install ufw vsftpd nano && systemctl status vsftpd 
	# cp /etc/vsftpd.conf /etc/vsftpd.conf.bak && \
	# nano /etc/vsftpd.conf
COPY ./tools/vsftpd.conf ./

CMD /bin/bash start_wp.sh
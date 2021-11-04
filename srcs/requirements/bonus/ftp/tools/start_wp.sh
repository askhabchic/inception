echo "/usr/sbin/nologin" >> /etc/shell
service vsftpd start

sedv -i -e '10ivsftpd: 127.0.0.1 : allow'


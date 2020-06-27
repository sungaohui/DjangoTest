#!/bin/bash
python3 manage.py collectstatic
uwsgi --ini ./uwsgi.ini
nginx -c /etc/nginx/myblog.conf -g 'daemon off;'
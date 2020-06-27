#!/bin/bash
uwsgi --ini ./uwsgi.ini
nginx -c /opt/myblog/myblog.conf -g 'daemon off;'
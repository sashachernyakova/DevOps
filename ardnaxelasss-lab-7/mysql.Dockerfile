FROM mysql:8.4

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD mysqladmin ping -h localhost -u $MYSQL_USER --password=$MYSQL_PASSWORD || exit 1



FROM strapdata/elassandra:6.8.4.0

WORKDIR /app/ela
ADD . /app/ela

COPY cassandra.yaml /etc/cassandra/cassandra.yaml
COPY .cassandra/cqlshrc /root/.cassandra/cqlshrc

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9142 : encrypted CQL
# 9160: thrift service
# 9200: elassandra HTTP
# 9300: elasticsearch transport
# 443: HTTPS 9200 (NGINX Proxy)
# 80: HTTP->HTTPS REDIRECT
EXPOSE 7000 7001 7199 9042 9142 9160 9200 9300 443 80
CMD ["cassandra", "-f"]



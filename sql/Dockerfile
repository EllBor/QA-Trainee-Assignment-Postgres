FROM postgres:latest
WORKDIR /docker-entrypoint-initdb.d/
COPY src/init/*.sql /docker-entrypoint-initdb.d/
RUN mkdir -p /manual-sql
COPY src/manual/*.sql /manual-sql/

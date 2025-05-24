# Dockerfile for creating the db that will store kestra metadata
# DB will be unexposed, since kestra will communicate in network 
FROM postgres:14.3

# Set environment variables for the database
ENV POSTGRES_DB=kestra
ENV POSTGRES_USER=kestra
ENV POSTGRES_PASSWORD=kestra

HEALTHCHECK --interval=30s --timeout=10s --retries=10 CMD ["CMD-SHELL", "pg_isready -d $${POSTGRES_DB} -U $${POSTGRES_USER}"]







# postgres: # This is the postgres db for kestra meta data
#     image: postgres # It is unexposed, ie has no port because only kestra will communicate with it IN THE NETWORK 
#     volumes:
#       - postgres-data:/var/lib/postgresql/data
#     environment:
#       POSTGRES_DB: kestra
#       POSTGRES_USER: kestra
#       POSTGRES_PASSWORD: kestra
#     healthcheck:
#       test: ["CMD-SHELL", "pg_isready -d $${POSTGRES_DB} -U $${POSTGRES_USER}"]
#       interval: 30s
#       timeout: 10s
#       retries: 10
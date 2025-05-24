# Dockerfile for creating the db that will store crime data
FROM postgres:14.3

# Set environment variables for the database
ENV POSTGRES_DB=phillycrime
ENV POSTGRES_USER=kestra
ENV POSTGRES_PASSWORD=kestra

EXPOSE 5432

#  image: postgres
#     environment:
#       POSTGRES_USER: kestra
#       POSTGRES_PASSWORD: kestra
#       POSTGRES_DB: ny_taxi
#     ports: # it is exposed with these ports so that we can access it through port mapping
#       - "5432:5432"
#     volumes:
#       - ./ny_taxi_postgres_data:/var/lib/postgresql/data
#     depends_on:
#       kestra:
#         condition: service_started
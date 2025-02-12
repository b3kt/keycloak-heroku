FROM quay.io/keycloak/keycloak-x

#COPY my-providers/ /opt/jboss/keycloak/providers/

WORKDIR /opt/jboss/keycloak

RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

RUN ./bin/kc.sh config --db=postgres --db-url=jdbc:postgresql://$DB_HOST/keycloak --db-username=keycloak --db-password=password

FROM quay.io/keycloak/keycloak:24.0.1

ENV KC_DB=mysql
ENV KC_DB_URL=jdbc:mysql://${KC_DB_HOST}:${KC_DB_PORT}/${KC_DB_NAME}
ENV KC_DB_USERNAME=${KC_DB_USERNAME}
ENV KC_DB_PASSWORD=${KC_DB_PASSWORD}
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

WORKDIR /opt/keycloak-custom
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]

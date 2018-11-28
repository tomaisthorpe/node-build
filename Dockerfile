FROM node:8.9.3 as build

ENV PROJECT_PATH=/usr/src/app/

WORKDIR ${PROJECT_PATH}

# Install dependencies
COPY package.json yarn.lock ${PROJECT_PATH}
RUN yarn

# Build project
COPY . ${PROJECT_PATH}

# Compile project and clean up vendors
RUN make compile && \
    tar czf node_modules.tar.gz node_modules && \
    rm -rf node_modules

FROM node:8.9.3

ARG PROJECT_BUILD
ARG PROJECT_NAME

ENV PROJECT_BUILD=${PROJECT_BUILD}
ENV PROJECT_NAME=${PROJECT_NAME}
ENV PROJECT_PATH=/usr/src/app/

WORKDIR ${PROJECT_PATH}

COPY --from=build ${PROJECT_PATH} ${PROJECT_PATH}

# SecretsManagement stuffs
RUN curl -O https://s3-eu-west-1.amazonaws.com/filtered-sec-public/secretsmanagement/v0.1/ssm-entrypoint.sh && \
    chmod +x ./ssm-entrypoint.sh

CMD ["./ssm-entrypoint.sh", "make", "serve", "NODE_ENV='production'"]


CMD ["make", "serve", "NODE_ENV='production'"]
#CMD make serve NODE_ENV='production'

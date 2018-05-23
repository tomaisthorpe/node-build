FROM node:8.9.3

ARG PROJECT_BUILD
ARG PROJECT_NAME

ENV PROJECT_BUILD=${PROJECT_BUILD}
ENV PROJECT_NAME=${PROJECT_NAME}
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

CMD make serve NODE_ENV='production'

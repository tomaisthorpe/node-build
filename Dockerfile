FROM node:8.9.3-alpine

ARG PROJECT_BUILD
ARG PROJECT_NAME

ENV PROJECT_BUILD=${PROJECT_BUILD}
ENV PROJECT_NAME=${PROJECT_NAME}
ENV PROJECT_PATH=/usr/src/app

# Load dependencies
COPY package.json package-lock.json yarn.lock ${PROJECT_PATH}
RUN yarn

# Build project
COPY . ${PROJECT_PATH}

WORKDIR ${PROJECT_PATH}

# Create credentials file and sync
RUN make compile

CMD ["/bin/sh", "-c", "npm run start"]

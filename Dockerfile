FROM node:8.9.3

ARG PROJECT_BUILD
ARG PROJECT_NAME

ENV PROJECT_BUILD=${PROJECT_BUILD}
ENV PROJECT_NAME=${PROJECT_NAME}
ENV PROJECT_PATH=/usr/src/app/

WORKDIR ${PROJECT_PATH}

# Install dependencies
COPY package.json package-lock.json yarn.lock ${PROJECT_PATH}
RUN yarn

# Build project
COPY . ${PROJECT_PATH}

# Create credentials file and sync
RUN make compile

CMD ["/bin/sh", "-c", "npm run start"]

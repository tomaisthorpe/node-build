# node-build
nodejs docker build file

## Setup
1. copy Dockerfile into your project: `curl -O https://raw.githubusercontent.com/excelWithBusiness/node-build/0.0.1/Dockerfile`
2. Set your build arguments and build image:
```
docker build \
--build-arg PROJECT_BUILD=${BUILD_NUMBER} \
--build-arg PROJECT_NAME=${PROJECT_NAME} \
-t ${TAG}:latest .
```

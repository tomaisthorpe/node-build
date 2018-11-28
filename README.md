# node-build
nodejs docker build file

## Versioning system
Previous versions are 0.0.1 through 0.0.4

New releases are `<nodeversion>-<iteration>`, example, 8.9.3-1, 9.1.1-1, 8.9.3-2, etc



## Setup
1. copy Dockerfile into your project: `curl -O https://raw.githubusercontent.com/excelWithBusiness/node-build/<version>/Dockerfile`
2. Set your build arguments and build image:
```
docker build \
--build-arg PROJECT_BUILD=${BUILD_NUMBER} \
--build-arg PROJECT_NAME=${PROJECT_NAME} \
-t ${TAG}:latest .
```

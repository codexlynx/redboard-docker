FROM node:4-alpine

LABEL maintainer="@codexlynx"

RUN apk add --update-cache git && \
    git clone https://github.com/Dviros/redboard.git && \
    rm -rf .git

WORKDIR redboard

RUN npm install && npm install bluebird && \
    sed -i 's/127.0.0.1/0.0.0.0/g' server.js

ADD create_user.js create_user.js
ADD service.sh service.sh

CMD ["/redboard/service.sh"]
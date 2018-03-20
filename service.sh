#!/usr/bin/env sh

sed -i s/@localhost:27017/$MONGODB_USER:$MONGODB_PASS@mongodb:27017/g ./config/database.js

while true; do
    node create_user.js
    if [[ $? -eq 0 ]]; then
        break;
    fi
    sleep 1;
done;

npm start

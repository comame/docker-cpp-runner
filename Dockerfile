FROM alpine

RUN adduser -D user
RUN apk add g++

RUN printf "%s\n" \
    "#!/usr/bin/env sh" \
    "g++ \$1 -o /tmp/executable && /tmp/executable" \
    > /entrypoint.sh && \
    chmod +x /entrypoint.sh

COPY sample.cpp /home/user/sample.cpp
USER user
WORKDIR /home/user/

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "sample.cpp" ]
VOLUME /home/user

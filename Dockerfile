FROM nickblah/lua:5.4-luarocks-alpine AS lua
RUN apk add --no-cache git gcc musl-dev make
COPY ./iprog_test-1.0-1.rockspec /app/iprog_test-1.0-1.rockspec
WORKDIR /app
RUN luarocks install --deps-only iprog_test-1.0-1.rockspec

FROM lua AS lua-java
RUN apk add --no-cache openjdk17

FROM lua-java
WORKDIR /app/lua
ENTRYPOINT ["lua", "/app/lua/init.lua"]

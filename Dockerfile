FROM node:latest as builder
WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

FROM node:latest as app
WORKDIR /home/node/app
COPY --from=builder /app/node_modules ./node_modules/
COPY package.json .
COPY package-lock.json .
COPY src/ src/
# COPY test/ test/
COPY index.html .
COPY webpack.config.js .
COPY webpack.dev.config.js .
COPY webpack.prod.config.js .

ENV __STREAM_URL__ /dash/source/index.mpd
ARG BUILD_COMMAND=build
RUN npm run $BUILD_COMMAND

# RUN npm run test

ENTRYPOINT npm run start
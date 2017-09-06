FROM node:8

WORKDIR /work
COPY . /work

RUN cd app && \
    npm install --silent && \
    npm run build

RUN cd server && \
    npm install --silent

WORKDIR /work/server

EXPOSE 3000

CMD ["npm", "start"]

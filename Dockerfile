FROM node:24

# specify any directory you want for WORKDIR
WORKDIR /app
COPY package.json package.json
COPY index.js index.js

RUN npm install

EXPOSE 1050

CMD [ "index.js" ]
ENTRYPOINT [ "node" ]


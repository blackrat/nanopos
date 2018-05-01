FROM node:carbon
WORKDIR /opt/nanopos
COPY package*.json ./
RUN npm install
RUN npm install -g nanopos
COPY . .
RUN npm run dist
RUN npm prune --production
EXPOSE 9116
CMD [ "./dist/cli.js", "--host 0.0.0.0 --port 9116" ]

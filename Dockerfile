FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

ARG PORT=8000
ENV PORT_NUMBER=${PORT}
EXPOSE ${PORT}

CMD [ "npm", "start" ]
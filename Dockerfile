FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

ARG PORT=8000
ENV PORT_NUMBER=${PORT}
EXPOSE ${PORT}

ENV VITE_BYPASS_LOGIN=0
ENV VITE_BYPASS_TUTORIAL=0

ARG API_BASE_URL=http://localhost:8000/api
ENV VITE_API_BASE_URL=${API_BASE_URL}

CMD [ "npm", "start" ]
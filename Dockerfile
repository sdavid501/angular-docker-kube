FROM node:14 as builder

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm ci

COPY . .

EXPOSE 4000

RUN npm run build:ssr
CMD [ "npm", "run", "serve:ssr" ]
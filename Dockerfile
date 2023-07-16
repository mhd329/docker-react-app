FROM node:alpine as builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY ./ ./
CMD [ "npm", "run", "build" ]

FROM nginx:lts
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
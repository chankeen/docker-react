FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm","run","build"] 

FROM nginx 
WORKDIR '/usr/share/nginx/html'
COPY --from=builder /app/build .

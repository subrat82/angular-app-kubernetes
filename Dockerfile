# stage 1
FROM johnpapa/angular-cli as angular-built
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json package.json
#RUN npm install --silent
RUN npm install
COPY . .
RUN npm run build --prod
#RUN ng build --prod

FROM nginx:alpine
LABEL author="Preston Lamb"
COPY --from=angular-built /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]

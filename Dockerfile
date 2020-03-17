# FROM node
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
# COPY . .
# RUN npm install
# RUN npm run build --prod

# # stage 2
# FROM nginx:alpine
# COPY --from=node /usr/src/app/dist/angular-app /usr/share/nginx/html
#
#COPY /Users/subrat/docker-desktop-software/kubernetes-project-yaml-files/dfly-deployment.yml /usr/share/nginx/html


# stage 1
FROM johnpapa/angular-cli as angular-built
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json package.json
#RUN npm install --silent
RUN npm install
# COPY . /usr/src/app
COPY . .
# RUN npm run build --prod
RUN npm run ng build -- --prod
#RUN ng build

FROM nginx:alpine
LABEL author="Preston Lamb"
COPY --from=angular-built /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]

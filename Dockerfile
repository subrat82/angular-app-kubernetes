FROM node
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /usr/src/app/dist/angular-app /usr/share/nginx/html
#COPY /Users/subrat/docker-desktop-software/kubernetes-project-yaml-files/dfly-deployment.yml /usr/share/nginx/html


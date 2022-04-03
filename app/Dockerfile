# Imagen necesaria para compilar el proyecto de Angular
FROM node:14-alpine AS build-step

RUN mkdir -p /app

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build --prod

# Imagen necesaria para el servidor web en este caso apache2
FROM httpd:2.4

COPY --from=build-step /app/dist/app /usr/local/apache2/htdocs/

EXPOSE 80

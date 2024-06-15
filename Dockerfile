# Etapa de compilación
FROM node:14 AS build

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . /app

RUN npm run build -- --output-path=./dist/out --configuration=production

# Etapa de producción
FROM nginx:alpine

COPY --from=build /app/dist/out /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

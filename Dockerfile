# Etapa de compilación
FROM node:14 AS build

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios
COPY package*.json /app/

# Instalar dependencias
RUN npm install

# Copiar el código fuente de la aplicación
COPY . /app

# Compilar la aplicación
RUN npm run build --prod

# Etapa de producción
FROM nginx:alpine

# Copiar los archivos de compilación de la etapa de compilación al directorio de trabajo de Nginx
COPY --from=build /app/dist/* /usr/share/nginx/html/

# Exponer el puerto 80 para que Nginx pueda servir la aplicación
EXPOSE 80

# El comando por defecto para iniciar Nginx cuando el contenedor se ejecute
CMD ["nginx", "-g", "daemon off;"]

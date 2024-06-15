# Usa una imagen base de Node.js
FROM node:14

# Crea el directorio de la aplicación
RUN mkdir -p /app

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos package.json y package-lock.json
COPY package*.json /app/

# Instala las dependencias
RUN npm install

# Copia el resto del código de la aplicación
COPY . /app

# Exponer el puerto en el que corre la aplicación
EXPOSE 8080

# Comando por defecto para ejecutar la aplicación
CMD ["npm", "start"]

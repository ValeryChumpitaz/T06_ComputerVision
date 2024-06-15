# Usa una imagen base de Node.js
FROM node:14

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de configuración
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto del código de la aplicación
COPY . .

# Construye la aplicación en modo producción
RUN npm run build --prod

# Expone el puerto en el que corre la aplicación
EXPOSE 80

# Comando por defecto para ejecutar la aplicación
CMD ["npm", "start"]

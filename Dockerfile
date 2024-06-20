FROM node:20

RUN mkdir -p /app

WORKDIR /app

COPY package*.json /app/

RUN npm install
RUN npm install -g @angular/cli 17.
COPY . /app

EXPOSE 8080

CMD ["npm", "start"] 

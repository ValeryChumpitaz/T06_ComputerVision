# Proyecto # T06_ComputerVision 🖥️

Este repositorio contiene el código fuente y la configuración necesaria para implementar un pipeline automatizado utilizando GitHub Actions para un proyecto Angular, integrando análisis estático con SonarCloud y despliegue en DockerHub.

## Características del Proyecto

- **Framework**: Angular 🅰️
- **Integración Continua**: GitHub Actions 🤖
- **Análisis Estático**: SonarCloud 🔍
- **Despliegue**: DockerHub 🐳

## Estructura del Repositorio

El repositorio está organizado de la siguiente manera:

- **`src/`**: Contiene el código fuente del proyecto Angular.
- **`.github/workflows/`**: Directorio donde se encuentran los archivos de configuración de GitHub Actions.

## Pipeline de Integración Continua con GitHub Actions

### Flujo de Trabajo

El flujo de trabajo definido en GitHub Actions automatiza las siguientes etapas:

1. **Checkout**: Se clona el repositorio en la máquina virtual de GitHub Actions.
2. **Build y Pruebas**: Se compila el proyecto Angular y se ejecutan las pruebas unitarias.
3. **Análisis Estático con SonarCloud**: Los resultados del análisis estático se envían a SonarCloud para evaluar la calidad del código.
4. **Despliegue en DockerHub**: Se construye la imagen Docker del proyecto y se sube al registro de DockerHub para su distribución.

### Archivo de Configuración de GitHub Actions

Dentro del directorio `.github/workflows/`, el archivo `ci-cd.yml` contiene la configuración del pipeline de integración continua:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v2

    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '14'

    - name: Install Dependencies
      run: npm install

    - name: Build and Test
      run: npm run build --prod && npm test

    - name: Analyze with SonarCloud
      uses: sonarsource/sonarcloud-github-action@v2
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}

    - name: Build Docker Image
      run: docker build -t your-dockerhub-username/project-name .

    - name: Push to DockerHub
      run: docker push your-dockerhub-username/project-name
      env:
        DOCKERHUB_USERNAME: ${{ secrets.DOCKERHUB_USERNAME }}
        DOCKERHUB_TOKEN: ${{ secrets.DOCKERHUB_TOKEN }}
```

## Configuración Adicional

Asegúrate de configurar las variables de entorno y secretos necesarios en la configuración de tu repositorio en GitHub para SonarCloud y DockerHub.

### Variables de Entorno Necesarias:

- `SONAR_TOKEN`: Token de acceso para SonarCloud.
- `DOCKERHUB_USERNAME`: Nombre de usuario de DockerHub.
- `DOCKERHUB_TOKEN`: Token de acceso para DockerHub.

## Contribuciones

Las contribuciones al proyecto son bienvenidas. Si tienes sugerencias, por favor crea un pull request con tus cambios propuestos.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Para más detalles, consulta el archivo LICENSE en este repositorio.


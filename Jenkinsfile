pipeline {
    agent any
    tools{
        nodejs  "nodejs"
    }
    stages {
        stage('Clonar Repositorio') {
            steps {
                // Clonar el repositorio desde tu URL
               git credentialsId: 'giocc', branch: 'main' ,url: 'https://github.com/GiovannyChoqueCenteno/react-test.git'
                   }
        }

        stage('Instalar Dependencias') {
            steps {
                // Instalar las dependencias de Node.js
                sh 'npm install'
            }
        }

        stage('Compilar el Proyecto') {
            steps {
                // Compilar la aplicación React
                sh 'npm run build'
            }
        }

        stage('Ejecutar Pruebas Unitarias') {
            steps {
                // Ejecutar pruebas unitarias si existen
                    sh 'npm test'
                    echo "Ejecución de Pruebas Completada"
            }
        }

        stage('Construir y Publicar Contenedor Docker') {
            steps {
                // Construir y publicar el contenedor Docker en Docker Hub
                sh 'docker build -t reacttest:tag .'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push giocc/reacttest:tag'
                }
            }
        }

        stage('Desplegar Proyecto') {
            steps {
                // Agregar pasos para el despliegue de la aplicación React
                // Esto puede variar según tu entorno de despliegue (ejemplo: copiar archivos a un servidor web)
                echo "Ejecutando despliegue simulado..."
            }
        }
    }
}
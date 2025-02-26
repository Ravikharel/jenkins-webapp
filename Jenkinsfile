pipeline{ 
    agent any 
    environment{ 
        IMAGE_NAME = "my-web-app"
        CONTAINER_NAME = "web-container"
    }
    stages{ 
        stage('Build Docker image'){ 
            steps{ 
                script{ 
                    sh 'docker build -t ${IMAGE_NAME}:v1 .'
                }

            }
        }
        stage('Run docker container'){ 
            steps{
                script{
                    sh 'docker container run -d -p 5001:5000 --name ${CONTAINER_NAME} ${IMAGE_NAME}'
                }
            }
        }
        stage('Push Image'){
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                    sh '''
                    docker push ${IMAGE_NAME}:v1
                    '''
                }
            }
        }
        post { 
            success{ 
                echo " Pipeline excuted succesfully!!!"
            }
            failure{ 
                echo "There was an error!!!"
            }
        }
    }
}


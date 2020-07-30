pipeline{
 agent any
 environment{
  DOCKER_TAG=getDockerTag()
 }
 stages{
  stage('Build Docker Image'){
   steps{
    sh "docker build . -t jangbsingh/nodeapp:${DOCKER_TAG}"
   }
  }
  stage('Docker hub push'){
   steps{
    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerHubPwd')]) {
	 sh " docker login -u jangbsingh -p ${dockerHubPwd}"
	 sh " docker push jangbsingh/nodeapp:${DOCKER_TAG}"
	}
   }
  }
  stage('Deploy to k8s'){
   steps{
    sh " chmod +x changeTag.sh"
	sh " ./changeTag.sh ${DOCKER_TAG}"
	script{
	 try{
	  sh " kubectl apply -f . "
	 }catch(error){
	  sh " kubectl create -f . "
	 }
	}
   }
  }
 }
}
def getDockerTag(){
 def tag = sh script: 'git rev-parse HEAD', returnStdout: true
  return tag
} 

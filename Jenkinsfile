pipeline{
 agent any
 environment{
  DOCKER_TAG=getDockerTag()
 }
 stages{
  stage('Deploy to k8s'){
   steps{
    sh " chmod +x changeTag.sh"
    sh " ./changeTag.sh ${DOCKER_TAG}"
    sh " rm  -rf pods.yml"
    sshagent(['node-ub']) {
	    sh "ssh root@192.168.0.115 ls /tmp/"
	script{
         try{
          sh " ssh root@192.168.0.115 kubectl apply -f . "
         }catch(error){
          sh " ssh root@192.168.0.115 kubectl create -f . "
         }
        }
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

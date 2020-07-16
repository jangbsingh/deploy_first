pipeline {
        agent any
        tools {
                maven 'maven3'
        }
        stages {
                stage('Build_JB') {
                        steps{
                                sh script: 'mvn clean package'
                                echo 'Hi this is jb first declarative pipeline'
                        }
		}
		stage('Deploy')	{
			steps{
				sh script: "su - ansible scp  /var/lib/jenkins/workspace/s_jb/target/jbs.war  ansible@192.168.0.113:/usr/local/tomcat9/webapps/"
			}
                }
        }
}


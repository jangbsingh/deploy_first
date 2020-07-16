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
                stage('Deploy') {
                        steps{
                                sshagent(['M_ROOT']) {
                                        sh """
						pwd
                                                ssh ansible@192.168.0.113 /usr/local/tomcat9/bin/shutdown.sh
                                                scp -o StrictHostKeyChecking=no  target/jbs.war  ansible@192.168.0.113:/usr/local/tomcat9/webapps/
                                        	ssh ansible@192.168.0.113 /usr/local/tomcat9/bin/startup.sh
                                        """
                                }
                        }
                }
        }
}


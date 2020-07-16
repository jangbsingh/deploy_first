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
                                sshagent(['935ca8a0-7830-4fee-8a78-adc949dadb4f']) {
                                        sh """
						pwd
                                                ssh root@192.168.0.113:/usr/local/tomcat9/bin/shutdown.sh
                                                scp -o StrictHostKeyChecking=no  target/jbs.war  root@192.168.0.113:/usr/local/tomcat9/webapps/
                                        ssh root@192.168.0.113:/usr/local/tomcat9/bin/startup.sh
                                        """
                                }
                        }
                }
        }
}


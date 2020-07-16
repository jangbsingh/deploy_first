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
                                sshagent(['72bc7e6f-d5cb-4c6d-8efc-5b408354329a']) {
                                        sh """
                                                ssh root@192.168.0.113:/usr/local/tomcat9/bin/shutdown.sh
                                                scp -o StrictHostKeyChecking=no  target/jbs.war  root@192.168.0.113:/usr/local/tomcat9/webapps/
                                        ssh root@192.168.0.113:/usr/local/tomcat9/bin/startup.sh
                                        """
                                }
                        }
                }
        }
}


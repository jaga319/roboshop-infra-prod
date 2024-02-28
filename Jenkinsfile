pipeline {
  agent {
    node {
        label 'AGENT-1'
    }
  } 
  options{
        timeout(time: 1,unit:'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')


    }
    // Build //
    stages {
        stage('VPC') {
            steps {
                sh """
                    cd 01-vpc
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('SG') {
            steps {
                sh """
                    cd 02-SG
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('VPN') {
            steps {
                sh """
                    cd 03-vpn
                    terraform init -reconfigure
                    terraform apply -auto-approve
                """
            }
        }
        stage('DB ALB') {
            parallel {
                stage('DB') {
                    steps {
                    sh """
                        cd 04-database
                        terraform init -reconfigure
                        terraform apply -auto-approve
                        """
                    }
                }
                stage('ALB') {
                    steps {
                    sh """
                        cd 05-APP-ALB
                        terraform init -reconfigure
                        terraform apply -auto-approve
                        """
                    }
                }
            }
        }
    }  
        
      
    // post build 
     post { 
        always { 

            echo 'I will always run'
        }
        failure{
            echo 'job is failed , creating an alarm'
        }
        success{
            echo 'job completed successfully'
        }
    }
}

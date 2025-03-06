pipeline {
    agent any
    environment {
        PATH = "${env.PATH};C:\\Terraform"  // Modify this based on your environment
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/teja94411/terra.git']])
            }
        }

        stage('Terraform Init') {
            steps {
                // Wrap AWS credentials using withCredentials
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '9db367d7-826c-4d61-b2ff-34bd19fbb8b1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    dir('Resources') {
                        script {
                            if (isUnix()) {
                                // Use sh to run the Terraform init command
                                sh 'terraform init -upgrade'
                            } else {
                                // Use bat to run the Terraform init command
                                bat 'terraform init -upgrade'
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '9db367d7-826c-4d61-b2ff-34bd19fbb8b1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    dir('Resources') {
                        script {
                            if (isUnix()) {
                                // Run the Terraform validate command to ensure the configuration is correct
                                sh 'terraform validate'
                            } else {
                                // Run the Terraform validate command for Windows
                                bat 'terraform validate'
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '9db367d7-826c-4d61-b2ff-34bd19fbb8b1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    dir('Resources') {
                        script {
                            if (isUnix()) {
                                // Run the Terraform plan command to preview the changes
                                sh 'terraform plan -target=main.tf'
                            } else {
                                // Run the Terraform plan command for Windows
                                bat 'terraform plan -target=main.tf'
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '9db367d7-826c-4d61-b2ff-34bd19fbb8b1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    dir('Resources') {
                        script {
                            if (isUnix()) {
                                // Run the Terraform apply command with auto-approve
                                sh 'terraform apply --auto-approve'
                            } else {
                                // Run the Terraform apply command with auto-approve for Windows
                                bat 'terraform apply --auto-approve'
                            }
                        }
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '9db367d7-826c-4d61-b2ff-34bd19fbb8b1', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    dir('Resources') {
                        script {
                            if (isUnix()) {
                                // Run the Terraform destroy command to delete resources
                                sh 'terraform destroy --auto-approve'
                            } else {
                                // Run the Terraform destroy command for Windows to delete resources
                                bat 'terraform destroy --auto-approve'
                            }
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            // Actions to perform after a successful build
            echo 'Terraform infrastructure applied successfully!'
        }

        failure {
            // Actions to perform after a failed build
            echo 'Build failed! Please check the logs.'
        }

        always {
            // Actions to perform regardless of the build status
            echo 'Cleaning up and finishing build.'
        }
    }
}

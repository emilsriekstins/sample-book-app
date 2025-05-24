pipeline {
    agent any
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    }
    stages {
         stage('build') {
            steps {
                echo "Building of a node application is starting.."
            }
        }
         stage('deploy-to-dev') {
            steps {
                echo "Deployment of node application on DEV environment.."
            }
        }
         stage('test-dev') {
            steps {
                echo "API test execution against node application on DEV environment.."
            }
        }
        stage('deploy-to-stg') {
            steps {
                echo "Deployment of node application on STG environment.."
            }
        }
         stage('test-stg') {
            steps {
                echo "API test execution against node application on STG environment.."
            }
        }
        stage('deploy-to-prd') {
            steps {
                echo "Deployment of node application on PRD environment.."
            }
        }
         stage('test-prd') {
            steps {
                echo "API test execution against node application on PRD environment.."
            }
        }
    }
}

// Build of application;
// deployment in “DEV” env;
// Test execution against DEV env;
// deployment in “STG” env;
// Test execution against STG env;
// deployment in “PRD” env;
// Test execution against PRD env.
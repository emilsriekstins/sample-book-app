pipeline {
    agent any
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    }
    stages {
         stage('build') {
            steps {
               buildApp()
            }
        }
         stage('deploy-to-dev') {
            steps {
                deploy("DEV")
            }
        }
         stage('test-dev') {
            steps {
                test("DEV")
            }
        }
        stage('deploy-to-stg') {
            steps {
                deploy("STG")
            }
        }
         stage('test-stg') {
            steps {
                test("STG")
            }
        }
        stage('deploy-to-prd') {
            steps {
                deploy("PRD")
            }
        }
         stage('test-prd') {
            steps {
                test("PRD")
            }
        }
    }
}

def buildApp(){
    echo "Building of node application is starting.."
    sh "docker build -t emilsriekstins/sample-book-app ."

    echo "Pushing image to docker registry.."
    sh "docker push emilsriekstins/sample-book-app"
}

def deploy(String environment) {
    echo "API test execution against node application on ${environment} environment.."
}

def test(String environment) {
    echo "API test execution against node application on ${environment} environment.."
}
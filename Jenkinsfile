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

def buildApp() {
    steps {
        echo "Building of a node application is starting.."
    }
}

def deploy(String environment) {
    steps {
        echo "API test execution against node application on ${environment} environment.."
    }
}

def test(String environment) {
    steps {
        echo "API test execution against node application on ${environment} environment.."
    }
}
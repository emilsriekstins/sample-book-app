pipeline {
    agent any
    triggers {
        pollSCM('*/1 * * * *')
    }
    // Leftover from "Hello world"
    // parameters {
    //     string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    // }
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
    sh "docker pull emilsriekstins/sample-book-app" // just to be safe, pull it
    String lowerCaseEnv = environment.toLowerCase()
    sh "docker compose stop sample-book-app-${lowerCaseEnv}" // To apply new changes, need to stop container if it is running
    sh "docker compose rm sample-book-app-${lowerCaseEnv}"
    sh "docker compose up -d sample-book-app-${lowerCaseEnv}"
}

def test(String environment){
    echo "API test executuon against node application on ${environment} environment.."
    sh "docker pull emilsriekstins/api-tests"
    def directory = pwd()
    sh "echo '${directory}'"
    sh "docker run --rm --network=sample-book-app-network-compose -v '${directory}':/api-tests/mochawesome-report/ emilsriekstins/api-tests run BOOKS BOOKS_${environment}"
    // sh "ls"
    archiveArtifacts allowEmptyArchive: true, artifacts: 'mochawesome.json', followSymlinks: false // only stores latests one if the name is the same, for prd in this instane
}

// docker run --rm --network=sample-book-app-network -v $PWD:/api-tests/mochawesome-report api-tests run BOOKS BOOKS_LOCAL
// docker run --rm --network=host api-tests run BOOKS BOOKS_LOCAL
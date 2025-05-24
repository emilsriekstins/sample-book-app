pipeline {
    agent any
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
    }
    stages {
        stage('Hello') {
            steps {
                echo "Hello ${params.PERSON}"
            }
        }
    }
}
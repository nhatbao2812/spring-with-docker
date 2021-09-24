node {
    agent {
        dockerfile {
            dir "subdir"
        }
    }
    stage('Clone sources') {
        git url: 'https://github.com/nhatbao2812/spring-with-docker'
    }

    stage('Gradle build') {
         sh "./gradlew clean build" 
    }

}
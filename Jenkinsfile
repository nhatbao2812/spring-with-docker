node {
    stage('Clone sources') {
        git url: 'https://github.com/nhatbao2812/spring-with-docker'
    }

    stage('Gradle build') {
         sh "./gradlew clean build" 
    }

    stage("build") {
        common.infoMsg("Building docker image ${IMAGE_NAME}")
        dockerApp = dockerLib.buildDockerImage(IMAGE_NAME, "", "${workspace}/docker}", imageTagsList[0], buildArgs)
        if (!dockerApp) {
            throw new Exception("Docker build image failed")
        }
    }
}
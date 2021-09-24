node {
     // Get Artifactory server instance, defined in the Artifactory Plugin administration page.
    def server = Artifactory.server "SERVER_ID"
    // Create an Artifactory Gradle instance.
    def rtGradle = Artifactory.newGradleBuild()
    def buildInfo

    stage('Clone sources') {
        git url: 'https://github.com/nhatbao2812/spring-with-docker'
    }

   stage('Artifactory configuration') {
        // Tool name from Jenkins configuration
        rtGradle.tool = "Gradle-2.4"
        // Set Artifactory repositories for dependencies resolution and artifacts deployment.
        rtGradle.deployer repo:'ext-release-local', server: server
        rtGradle.resolver repo:'remote-repos', server: server
    }
    
    stage('Gradle build') {
         sh "./gradlew clean build" 
    }

}
pipeline {
	agent any 

	environment {
		HUB_PASS = credentials('DOCKER_HUB_PASSWORD')
		HUB_USER = 'nohierhassan'
	}
	stages {

		stage('build') {
			steps {
			sh '''
			./jenkins/build/build_jar.sh mvn -B -DskipTests clean package
			./jenkins/build/build_container.sh
			
			'''
		}
		post {
                success {
                   archiveArtifacts artifacts: 'maven-project/target/*.jar', fingerprint: true
                }
            }
	}

		stage ('test') {
			steps{ 
			sh './jenkins/test/test.sh mvn test'
		}
		post {
                always {
                    junit 'maven-project/target/surefire-reports/*.xml'
                }
            }
	}
		stage('push') {
			steps {
			sh './jenkins/push/push_image.sh $HUB_USER $HUB_PASS'
		}
	}
		stage('deploy') {
			steps {
			sh './jenkins/deploy/deploy.sh'

		}
		publishers {
        mailer('nohierassan2@gmail.com', false, true)
    }
}
	}

}
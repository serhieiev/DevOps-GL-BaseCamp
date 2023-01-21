FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow maven-plugin git matrix-auth pam-auth \
                                  pipeline-github-lib pipeline-stage-view ssh-slaves timestamper \
                                  configuration-as-code authorize-project"
COPY casc.yaml /var/jenkins_home/casc.yaml
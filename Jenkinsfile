pipeline {
    agent any 

    environment {
        ANSIBLE_REPO = '/var/lib/jenkins/workspace/ansible_master'
        WEBHOOK = credentials('JENKINS_DISCORD')
    }

    //triggering periodically so the code is always present
    // run every friday at 3AM
    triggers { cron('0 3 * * 5') }

    stages {
        // linux hosts
        stage('deploy dotfiles to linux servers') {
            steps {
                echo 'run ansible playbook for configuring linux hosts'
                sh 'ansible-playbook ${ANSIBLE_REPO}/deploy/dotfiles/deploy_dotfiles_core.yml'
            }
        }

        // pihole
        stage('pihole') {
            steps {
                echo 'run the playbooks relating to pihole:'
                sh 'ansible-playbook ${ANSIBLE_REPO}/deploy/dotfiles/deploy_dotfiles_pihole.yml'
                // sh 'ansible-playbook ${ANSIBLE_REPO}/setup/NFS/singularity_nfs.yml'
            }
        }
    }
    
    post {
        always {
            discordSend \
                description: "repo >> ${GIT_BRANCH} (${BUILD_NUMBER}) - ${JOB_NAME}", \
                // footer: "Footer Text", \
                // link: env.BUILD_URL, \
                result: currentBuild.currentResult, \
                // title: JOB_NAME, \
                webhookURL: "${WEBHOOK}"
        }
    }

}


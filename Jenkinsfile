pipeline {
    agent any 

    environment {
        ANSIBLE_REPO = '/var/lib/jenkins/workspace/ansible_master'
        ANSIBLE_DIR = '/var/lib/jenkins/ansible'
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
                sh 'ansible-playbook --become-user root ${ANSIBLE_REPO}/deploy/dotfiles/deploy_dotfiles_core.yml -i ${ANSIBLE_REPO}/hosts.ini'
            }
        }

        // pihole
        stage('pihole') {
            steps {
                echo 'run the playbooks relating to pihole:'
                sh 'ansible-playbook --become-user root ${ANSIBLE_REPO}/deploy/dotfiles/deploy_dotfiles_pihole.yml -i ${ANSIBLE_REPO}/hosts.ini'
                // sh 'ansible-playbook ${ANSIBLE_REPO}/setup/NFS/singularity_nfs.yml'
            }
        }
    }
    
    post {
        always {
            discordSend \
                description: "${JOB_NAME} - build #${BUILD_NUMBER}", \
                result: currentBuild.currentResult, \
                webhookURL: "${WEBHOOK}"
        }
    }

}


pipeline {
    agent any 

    environment {
        ANSIBLE_REPO = '/var/lib/jenkins/workspace/Ansible_pipeline_master'
    }

    stages {
        // linux hosts
        stage('deploy dotfiles to linux servers') {
            steps {
                echo 'run ansible playbook for configuring linux hosts'
                sh 'ansible-playbook ${ANSIBLE_REPO}/deploy_dotfiles_core.yaml'
            }
        }
        // TrueNAS
        stage('deploy dotfiles to TrueNAS servers') {
            steps {
                // include rura-penthe.vm
                echo 'run ansible playbook for configuring TrueNAS hosts'
            }
        }
        // template
        stage('template') {
            steps {
                echo 'put useful message here'
            }
        }
    }
}


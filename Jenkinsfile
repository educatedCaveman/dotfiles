pipeline {
    agent any 

    environment {
        ANSIBLE_REPO = '/var/lib/jenkins/workspace/ansible_master'
    }

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

        // Docker
        stage('docker') {
            steps {
                echo 'deployments related to docker:'
                sh 'ansible-playbook ${ANSIBLE_REPO}/deploy/docker/dev_swarm_API_LB.yml'
                sh 'ansible-playbook ${ANSIBLE_REPO}/deploy/docker/prd_swarm_API_LB.yml'
            }
        }
    }
}


pipeline {
    agent any 

    environment {
        ANSIBLE_REPO = '/var/lib/jenkins/workspace/Ansible_pipeline_master'
    }

    stages {
        // pihole deploy
        stage('deploy pi-hole configs') {
            steps {
                echo 'run ansible playbook for configuring pihole hosts'
            }
        }
        // centOS hosts 
        stage('deploy dotfiles to CentOS hosts') {
            steps {
                echo 'run ansible playbook for configuring CentOS hosts'
            }
        }
        // ubuntu hosts
        // can this be the same as centOS?
        stage('deploy dotfiles to Debian/Ubunutu hosts') {
            steps {
                echo 'run ansible playbook for configuring Debian-based hosts'
            }
        }
        // TrueNAS
        stage('deploy dotfiles to TrueNAS servers') {
            steps {
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


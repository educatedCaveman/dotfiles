pipeline {
    agent any 

    environment {
        ANSIBLE_REPO = '/var/lib/jenkins/workspace/Ansible_pipeline_master'
    }

    stages {
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


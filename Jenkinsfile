node{
  def Namespace = "default"
  def ImageName = "subratit/projects-mar-15"
  def ImageTag = "latest"
  def Creds	= "076eed1a-ddda-4fcc-b8bd-5fbf6fa738fd"


  //try{
  stage('Checkout'){
      
    git branch: 'master',
    credentialsId: 'cd86d294-d343-4a1b-8e19-388f2ac2f93b',
    url: 'https://github.com/subrat82/angular-app-kubernetes.git'
      
      
      //git 'https://github.com/sasmita016/dfly-app.git'
      sh "git rev-parse --short HEAD > .git/commit-id"
      //imageTag= readFile('.git/commit-id').trim()



  }
  
  stage('Maven Build'){ 
    //  sh '/Applications/apache-maven-3.6.3/bin/mvn clean install -f "/Users/subrat/.jenkins/workspace/pipeline_dfly-app/dfly/pom.xml"'
     sh 'ng build'
  }

  stage('Docker Build, Push'){
      sh "/usr/local/bin/docker --version"
      sh "echo docker login localhost:8080"
      //withDockerRegistry([credentialsId: "${Creds}", url: 'https://index.docker.io/v1/']) {
    
    //withDockerServer([uri: "tcp://127.0.0.1:2375"]) {
    //withDockerRegistry([credentialsId: "${Creds}", url: "https://index.docker.io/v1/"]) {

     //withDockerRegistry(credentialsId: "076eed1a-ddda-4fcc-b8bd-5fbf6fa738fd", url: '') {
      //sh 'docker login -u "subratit" -p "Sasmita123*" docker.io'
      //sh 'docker login --username=subratit --email=subratit@gmail.com docker.io'
     // sh 'docker login -u subratit docker.io'
     // sh 'docker login -u "subratit" -p "Sasmita123*" docker.io'
     // sh "/usr/local/bin/docker build -t ${ImageName}:${ImageTag} ."
      sh "echo build successfully"
     // sh "/usr/local/bin/docker push ${ImageName}"
      //  }
    //}

    }
    stage('Deploy on K8s'){
       // sh "/usr/local/bin/ansible localhost -m ping"
       // sh "echo ansible ran successfully"
       // sh "/usr/local/bin/kubectl get ns"
        // sh "/usr/local/bin/kubectl apply -f kubernetes-deployment.yaml --validate=false"
        //sh "/usr/local/bin/ansible-playbook -v /Users/subrat/.jenkins/workspace/pipeline_dfly-app/deploy2.yml  --extra-vars ansible_ssh_user=root --extra-vars ImageName=${ImageName} --extra-vars imageTag=${ImageTag} --extra-vars ansible_sudo_pass=Sasmita123* "
        //sh "/usr/local/bin/ansible-playbook -vvv /Users/subrat/.jenkins/workspace/pipeline_dfly-app/deploy1.yml --extra-vars ImageName=${ImageName} --extra-vars imageTag=${ImageTag}"

    }
  //} 
  //catch (err) {
  //    currentBuild.result = 'FAILURE'
  //  }
//}
}

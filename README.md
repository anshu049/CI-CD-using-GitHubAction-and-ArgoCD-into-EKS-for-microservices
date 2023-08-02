<br>ARCHITECTURE<br>
====================
<img width="764" alt="voting-app-latest" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/c1a8030c-5129-4e19-913c-5a2686677686">

- The app consists of five components: Voting-App, Redis, Worker, Postgres and Result-App.
- Voting-App: A web interface for users to cast their votes.
- Redis: A Redis database to store the vote counts.
- Worker: A background worker to process votes from Redis and store results in Postgres.
- Postgres: A Postgres database to store the vote results.
- Result-App: A web interface to display real-time vote count results.

<br>**I have used two LoadBalancer and if the services increase further we can use Ingress Controller for limiting LoadBalancer as it is costly.**<br> 





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
<br>TOOLS USED AND WHY<br>
==========================
- Tools used are Jenkins(for CI part) and ArgoCD(for CD part).
- Jenkins can be also used for CD but I have used ArgoCD as it provides
  - Built in RBAC.
  - TLS encryption.
  - Git based authentication.
  - Vulnerability scanner.





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
<br>CONTINUOUS-INTEGRATION<br>
==============================
<br>**The aim of this part is to build the latest image as the per the change made in application code and push it DockerHub.**<br>

<img width="1019" alt="CI-Part" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/f061aa58-7f74-46ee-9d3e-17500c924425">


<br>Pipeline Setup:<br>
-----------------------
<br> 1)All the installation and configuration part is included in user-data file for jenkins instance inside this repo itself [click here](https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/tree/master/Terraform-code-to-setup-Jenkins).<br>

<br> 2)Install plugin Docker and Docker-Pipeline.<br>

<br> 3)Access Jenkins UI using initial paasword and add docker hub credentials.<br>

<img width="1440" alt="docker hub credentials" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/01d0b339-ba5f-40a7-986e-9b07b19fc534">


<br> 4)Create a new job and select Multibranch Pipeline.<br>

<img width="1439" alt="name of project" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/73fe2eaa-9e72-4262-8b32-8f699262157c">


<br> 5)Add github url and save.<br>

<img width="1440" alt="git url" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/e6c7f9cb-7d1f-4e1a-874e-d815b086bb29">


<br> 6)If everything goes right and build is successful then we can see the output of different stages of Jenkinsfile.<br>

<img width="1138" alt="stages" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/27e4c958-7194-49b0-9979-82ad90b6cf53">





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
<br>CONTINUOUS-DELIVERY<br>
===========================
<br>**The aim of this part is to pull the latest change made in manifests and sync cluster with updated manifests.**<br>

<img width="1315" alt="CD-PART" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/a84c7362-bff1-4d4a-8910-ec4f8bdfc051">


<br>Prerequisites:<br>
----------------------
- Install and configure the AWS Command Line Interface (CLI) to interact with EKS cluster.
- Install kubectl to manage Kubernetes resources.
- Install argocd CLI to interact with ArgoCD.
- Setup EKS cluster and install ArgoCD (I have setup EKS cluster manually with the help of CloudFormation but will be adding terraform code to automate this).

<br>Setup:<br>
--------------
- Expose the ArgoCD UI using a Kubernetes LoadBalancer service and retrieve the ArgoCD UI URL and login using the initial password and create application using [this](https://github.com/anshuhtwt/Voting-App-Manifests/blob/master/application.yaml) yaml file.

<img width="1440" alt="argoui" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/199637e5-8346-4d7c-b6b9-5924921ca27d">

- For git repository containing the YAML manifests for the app, including the Kubernetes Deployment, Service and other resources [click here](https://github.com/anshuhtwt/Voting-App-Manifests).

- Access voting and result app using LoadBalancer attached to it.

<img width="1440" alt="votingapp" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/b771bd9a-0415-4470-ba62-e52681b8023a">
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
<img width="1440" alt="resultapp" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/4a8dda99-766c-44c6-95e0-cf92d978eda3">

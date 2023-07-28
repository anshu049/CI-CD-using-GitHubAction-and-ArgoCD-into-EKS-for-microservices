<br>ARCHITECTURE<br>
====================
<img width="764" alt="voting-app-latest" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/c1a8030c-5129-4e19-913c-5a2686677686">

- The app consists of five components: Voting-App, Redis, Worker, Postgres and Result-App.
- Voting-App: A web interface for users to cast their votes.
- Redis: A Redis database to store the vote counts.
- Worker: A background worker to process votes from Redis and store results in Postgres.
- Postgres: A Postgres database to store the vote results.
- Result-App: A web interface to display real-time vote count results.

<br>I have used two LoadBalancer and if the services increase further we can use Ingress Controller for limiting LoadBalancer as it is costly.<br> 





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
<br>CONTINUOUS-INTEGRATION<br>
==============================
<img width="1019" alt="CI-Part" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/f061aa58-7f74-46ee-9d3e-17500c924425">


<br>Pipeline Setup:<br>
-----------------------
<br> 1) All the installation and configuration part is included in user-data file for jenkins instance inside this repo itself [click here](https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/blob/master/Terraform-code-for-Jenkins-Setup/user-data-instance1.tpl).<br>

<br> 2) Access Jenkins UI using initial paasword and add docker hub credentials.<br>

<img width="1440" alt="docker hub credentials" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/d4fece18-95ed-4db7-80e7-d210f05cc872">

<br> 3) Create a new job and select Multibranch Pipeline.<br>

<img width="1439" alt="name of project" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/8bc09b6b-521b-4aed-8187-8474b937f8f1">

<br> 4) Add github url and save.<br>

<img width="1440" alt="git url" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/fb2667ed-918b-43d5-999a-e82fc5ae0d57">

<br> 5) If everything goes right and build is successful then we can see the output of different stages of Jenkinsfile.<br>

<img width="971" alt="stages" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/da6a3cc3-e204-4a89-a846-b7905e283229">





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
<br>CONTINUOUS-DELIVERY<br>
===========================
<img width="1315" alt="CD-PART" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/a84c7362-bff1-4d4a-8910-ec4f8bdfc051">


<br>Prerequisites:<br>
----------------------
- Install and configure the AWS Command Line Interface (CLI) to interact with EKS cluster.
- Install kubectl to manage Kubernetes resources.
- Install argocd CLI to interact with ArgoCD.
- Setup EKS cluster and install ArgoCD.

<br>Steps To Setup:<br>
----------------------
- Expose the ArgoCD UI using a Kubernetes LoadBalancer service and retrieve the ArgoCD UI URL and login using the initial password.
- For git repository containing the YAML manifests for the app, including the Kubernetes Deployment, Service and other resources [click here](https://github.com/anshuhtwt/Voting-App-Manifests).

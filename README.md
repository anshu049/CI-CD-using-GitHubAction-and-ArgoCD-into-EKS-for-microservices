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

<br>Installation:<br>
----------------------
- Launch an ec2 instance for running Jenkins and add port 8080 in security group of the instance to access Jenkins.
- Connect to instance and install Jenkins, Git and Docker.
- Install these plugins:
- Docker
- Docker Pipeline 

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
<br>CONTINUOUS-DELIVERY<br>
===========================
<img width="1315" alt="CD-PART" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/a84c7362-bff1-4d4a-8910-ec4f8bdfc051">


<br>Prerequisites:<br>
----------------------
- Install and configure the AWS Command Line Interface (CLI) to interact with EKS cluster.
- Install kubectl to manage Kubernetes resources.
- Install argocd CLI to interact with ArgoCD.

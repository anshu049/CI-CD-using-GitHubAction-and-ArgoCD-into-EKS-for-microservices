<br>TOOLS USED AND WHY<br>
==========================
- Terraform for creating infrastructure on AWS.
- GitHub Action for CI part.
- ArgoCD for CD part.
- GitHub Action can be also used for CD but I have used ArgoCD as it provides:
   - GitOps Workflow.
   - Specialized for Kubernetes Environments.
   - Resource Health Checks.
   - Multi-Cluster and Multi-Tenancy Support.
   - Continuous Sync and Rollbacks.





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
<br>INFRASTRUCTURE USING TERRAFORM<br>
======================================
![Infra-ss](https://github.com/anshu049/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/2a3852d1-8854-488a-82e3-ac3c627ed240)

- AWS Infrastructure Automation to automate a variety of tasks, such as creating and managing Amazon Elastic Kubernetes Service (Amazon EKS) clusters, node groups, and virtual private clouds (VPCs).
- The project includes the following modules:
  - aws_eks_cluster: This module creates and manages Amazon EKS clusters.
  - aws_eks_node_group: This module creates and manages Amazon EKS node groups.
  - vpc: This module creates and manages VPCs.
  - backend: This module configures the Terraform backend.
  - provider: This module configures the Terraform provider.





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
<br>ARCHITECTURE OF APPLICATION<br>
===================================
<img width="764" alt="voting-app-latest" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/c1a8030c-5129-4e19-913c-5a2686677686">

- The app consists of five components: Voting-App, Redis, Worker, Postgres and Result-App.
   - Voting-App: A web interface for users to cast their votes.
   - Redis: A Redis database to store the vote counts.
   - Worker: A background worker to process votes from Redis and store results in Postgres.
   - Postgres: A Postgres database to store the vote results.
   - Result-App: A web interface to display real-time vote count results.

<br>**(I have used two LoadBalancer and if the services increase further we can use Ingress Controller for limiting LoadBalancer as it is costly).**<br> 





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
<br>CONTINUOUS-INTEGRATION<br>
==============================
<br>**The aim of this part is to build the latest image as the per the change made in application code and push it DockerHub.**<br>

![CI PART 2](https://github.com/anshu049/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/dec4b8bc-aa36-473e-b274-bd3d831ab84e)





* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
<br>CONTINUOUS-DELIVERY<br>
===========================
<br>**The aim of this part is to pull the latest change made in manifests and sync cluster with updated manifests.**<br>


<br>For git repository containing all the Manifests for the app, including the Kubernetes Deployment, Service and other resources [click here](https://github.com/anshuhtwt/Voting-App-Manifests).<br>


<img width="1315" alt="CD-PART" src="https://github.com/anshuhtwt/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/a84c7362-bff1-4d4a-8910-ec4f8bdfc051">


<br>Setup:<br>
--------------
- Installed and configured the AWS Command Line Interface (CLI) to interact with EKS cluster.**<br>
- Installed kubectl to manage Kubernetes resources.
- Installed argocd CLI to interact with ArgoCD.
- Installed ArgoCD inside existing Kubernetes cluster.
- Expose the ArgoCD UI using a Kubernetes LoadBalancer service and retrieve the ArgoCD UI URL and login using the initial password and create application using [this](https://github.com/anshuhtwt/Voting-App-Manifests/blob/master/application.yaml) yaml file.

![Argo UI](https://github.com/anshu049/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/511bb9fc-1b78-407a-934d-076329868e5d)


- Access voting and result app using LoadBalancer attached to it.

![Vote UI](https://github.com/anshu049/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/10ca6727-e26d-4b5c-b52b-4801eaacc4c7)

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  

![Result UI](https://github.com/anshu049/CI-CD-using-Jenkins-and-ArgoCD-into-EKS-for-microservices/assets/95365748/98630dd4-5b2f-4b67-b406-b7413ac0c61c)


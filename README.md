# ClusterDeployment

Repo for any/all files related to deploying Bubble3 to the cloud cluster, including terraform scripts, k8s manifests, and pipeline scripts

## Who are we?

Team Aqua is a diverse group of training SREs who joined together to take on the challenge of deploying Bubble 3 using Terraform. They engaged in a friendly race to get their application hosted and monitored before Team Magma launched a disruption attack on their API. Together, with the help of monitoring technologies like Prometheus and Loki, Team Aqua diagnosed the health of their API and brought it back to a production ready deployment.

## How do I work on this project?

Our focus is on deployment and monitoring rather than development. Ergo, we should avoid touching the source code (i.e. the FrontEnd and BackEnd repos) as much as possible. Anything related to the deployment of the application that is not coupled to those two repos should be kept here in ClusterDeployment. Things like kubernetes manifests and configuration for monitoring tools like Prometheus and Loki should be here.

The **main** branch is protected and requires 3 approvals to pull. The **dev** branch on the other hand has no protections, but try not to push directly onto dev. Instead create a feature branch and merge into dev when it's completed and unit tested. We will then pull dev into main as deemed appropriate.

That said, some resources will have to live in the respective FrontEnd/BackEnd repo due to the nature of how they work, e.g., Dockerfiles and Jenkinsfiles. Sometimes we might even have to modify the cource code to improve metrics or better defend against an attack. In these cases, it's okay to add to those repos.

In those repos, the **main** branch is protected in the same way ClusterDeployment's **main** is, but the development branch is instead called **sre-dev** to make it stand out from the inherited branches. Abide by the same merge protocol as with ClusterDeployment, but please prefix all feature branches with **sre-** to help organize which branches are ours and which are the old batch's.

Please adhere strictly to these branch guidelines to prevent as many future headaches as possible :P
Thanks!

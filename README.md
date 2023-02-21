# GCP-Project
### This repo contains the infrastructure as a code of the needed environment to deploy a python application on GKE alongside some other files like deployment and dockerfile and the application itself.. 

## Requirement 
  - Terraform 
  - GCP account and existing project there 
  - Docker 
### running the project step by step 
- Initializing the terraform territory/working directory by just running the command 
  "     terraform init "
- prepare the infrastructure as code to be applied by plan command "    terraform plan "
- now we can apply by " terraform apply" 
![Screenshot from 2023-02-21 22-51-36](https://user-images.githubusercontent.com/75359779/220456737-46406bcb-0e9a-4f7d-b867-ceeb0600ed89.png)


#### downbelow an example of the built resources 
- the docker image that has been built and pushed to the GCR  
![Screenshot from 2023-02-21 23-02-02](https://user-images.githubusercontent.com/75359779/220457744-bb7536c3-8f45-4082-9e77-0382d6eb15ad.png)
-----
- The private cluster where we will deploy the app 
![Screenshot from 2023-02-21 23-04-53](https://user-images.githubusercontent.com/75359779/220458241-f0341e7e-ecb2-4951-88ba-83865d8aaba0.png)
-----------
- the vpc with all the resources
 
![Screenshot from 2023-02-21 23-09-00](https://user-images.githubusercontent.com/75359779/220459406-ced8ea0c-6311-4729-9585-13c32945a483.png)
-------
-both management and restricted subnet 
![Screenshot from 2023-02-21 23-13-31](https://user-images.githubusercontent.com/75359779/220459993-25d0136f-5fd3-4b19-a941-a23ba72ce6e6.png)
- 2 VMs one from the cluster - created automatically - and the other has been created strictly inside the terraform files 
- ![Screenshot from 2023-02-21 23-18-20](https://user-images.githubusercontent.com/75359779/220460999-61156849-ae7a-43ee-940e-48e268368f7e.png)

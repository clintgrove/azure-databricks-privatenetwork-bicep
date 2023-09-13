# azure-databricks-privatenetwork-bicep
 how to deploy a databricks inside a private virutal network and a VM to connect to it

This is a Devops Pipeline to deply databricks in private virtual network
Clint Grove. September 2023. 

I have deployed this pipeline to my own personal Azure subscription and it works.

You will use the Library in Devops to save a password for the Virtual Machine, never put the password in the code. 
You will use the Service Connection which connects Devops to Azure to deploy these resources to a new Resource Group

The virtual machine is a windows 10. It sits on the same vnet as the databricks. 



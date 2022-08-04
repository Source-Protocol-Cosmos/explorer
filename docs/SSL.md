# Running with self signed certificates
There are two scripts created on tha package.json file that allow to run with self-signed certificates on localhost. The first one creates the certificates, and the second one starts the application (You might need to run these with sudo, depending on your docker installation ):
1. To init the self-signed mode, use ```yarn init:self-signed```. 
1. To start the self-signed mode, use ```yarn start:self-signed```. 


# Running with let's encrypt certificates

Let's encrypt allows to get free certificates to run the web app on https. The best approach to perform this, is by using the certbot, which will handle all the process, and also will allow the renew of the certificates when those are about to expire. 

The proposed approach is to use the scripts provided on the package.json file to run in letsencrypt mode (You might need to run these with sudo, depending on your docker installation):

1. To init the letsencrypt mode, use ```yarn init:letsencrypt```. 
1. To start the letsencrypt mode, use ```yarn start:letsencrypt```. 

Take into account that you might want to set the corresponding env variables (Or create the .env file, based on the example. The init script should be able to read those variables, and request the certificates accordingly)
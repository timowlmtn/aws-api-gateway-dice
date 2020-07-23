# Perform all the actions from the root directory.

## Source for this code
This code comes from the https://aws.amazon.com/blogs/developer/handling-arbitrary-http-requests-in-amazon-api-gateway/

## Build Instructions

To run the build, source the desired environment

    source setenv.sh
    make deploy
    
Take the IDs for the API Gateway and the Lambda functions and update the setenv_dev_green.sh

Build out the Lambda functions associate the new gateway with the usage key.

    make -f build/Makefile deploy-api-key
    make -f build/Makefile update-lambda-layer
    
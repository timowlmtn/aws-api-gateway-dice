# Returns all the APIs mapped to the domain name.  Use this to see what services are provided
# by your public url.
get-api-mappings:
	aws --profile ${AWS_PROFILE} apigatewayv2  get-api-mappings --domain-name "${DOMAIN_NAME}"

# Deploys the Lambda functions and API Gateway
deploy:
	aws cloudformation --profile ${AWS_PROFILE} package \
		--template-file src/lambda/template.yml \
	    --s3-bucket ${S3_DEPLOYMENT_BUCKET} \
	    --output-template-file src/lambda/packaged-template.yaml
	aws cloudformation --profile ${AWS_PROFILE} deploy \
		--template-file src/lambda/packaged-template.yaml \
	    --stack-name ${API_NAME}-${COLOR} \
	    --parameter-overrides StageName=${COLOR} RestApiName=${API_NAME}-Rest-${COLOR} Environment=${ENVIRONMENT} \
    		VPC="${VPC_ID}" SecurityGroupIds="${LAMBDA_SECURITY_GROUP}" VpcSubnetIds="${SUBNET_IDS}" \
	    --capabilities CAPABILITY_NAMED_IAM

# Run this once after deploying creating the initial deployment to assign the API Key to the Lambda Functions
# on the API gateway.
deploy-api-key: add-usage-plan update-usage-plan

add-usage-plan:
	aws apigateway --profile ${AWS_PROFILE} update-usage-plan --usage-plan-id ${USAGE_PLAN_ID} \
	    --patch-operations '[{"op":"add","path":"/apiStages","value":"${API_ID}:Prod"}]'

update-usage-plan:
	aws apigateway --profile ${AWS_PROFILE} update-usage-plan --usage-plan-id ${USAGE_PLAN_ID} --patch-operations \
        op="replace",path="/apiStages/${API_ID}:Prod/throttle/*/*/rateLimit",value="500"
	aws apigateway --profile ${AWS_PROFILE} update-usage-plan --usage-plan-id ${USAGE_PLAN_ID} --patch-operations \
	    op="replace",path="/apiStages/${API_ID}:Prod/throttle/*/*/burstLimit",value="500"


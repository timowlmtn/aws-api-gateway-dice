test-all: test-rest test-rest-proxy test-rest-invalid

test-rest:
	curl -H "X-API-KEY: ${X_API_KEY}" -X POST https://${API_ID}.execute-api.us-east-1.amazonaws.com/${COLOR}/roll

test-rest-proxy:
	curl -H "X-API-KEY: ${X_API_KEY}" -X POST https://${API_ID}.execute-api.us-east-1.amazonaws.com/${COLOR}/roll/1d4
	curl -H "X-API-KEY: ${X_API_KEY}" -X POST https://${API_ID}.execute-api.us-east-1.amazonaws.com/${COLOR}/roll/2d4+2
	curl -H "X-API-KEY: ${X_API_KEY}" -X POST https://${API_ID}.execute-api.us-east-1.amazonaws.com/${COLOR}/roll/3d6+10
	curl -H "X-API-KEY: ${X_API_KEY}" -X POST https://${API_ID}.execute-api.us-east-1.amazonaws.com/${COLOR}/roll/1d20-3

test-rest-invalid:
	curl -H "X-API-KEY: ${X_API_KEY}" -X POST https://${API_ID}.execute-api.us-east-1.amazonaws.com/${COLOR}/roll/1dd20-3






.DEFAULT_GOAL := help


#help: @ List available tasks on this project
help: 
	@grep -E '[a-zA-Z\.\-]+:.*?@ .*$$' $(MAKEFILE_LIST)| tr -d '#' | awk 'BEGIN {FS = ":.*?@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


#ver: @ List version to be built/deployed
.PHONY: ver
ver:
	echo "hello version"


.PHONY: set-deploy-version
set-deploy-version:
	ver="$$(cat ../lambda-api/package.json | jq -r '.version')"; \
	sed -i 's/lambda_deployment_key=.*$\/lambda_deployment_key="blue-wren\/api\/v'$$ver'.zip"/' terraform.tfvars


Using the example:

1. Publish a lambda zipfile to s3.
```
cd src
zip v0.0.1.zip index.js
aws s3 cp v0.0.1.zip s3://{lambda_s3_bucket}/{lambda_deployment_path}/v.0.1.zip
```

2. Create infrastructure using terraform
```
terraform init
terraform apply
```

3. Invoke lambda and look at response
```
export LAMBDA_NAME=$(terraform output lambda_name)
aws lambda invoke --function-name ${LAMBDA_NAME} --payload '{}' response-1.json
cat response-1.json
```


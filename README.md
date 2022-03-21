# push-docker-to-ecr
A simple bash script to help you push containers to AWS ECR!

## run the example locally
```bash
docker build -t nginx-test .
docker run -d -p 80:80 nginx-test
```

## build & push to ecr
```bash
export accountId="ACCOUNT-ID-HERE"
export region="eu-west-1"
export repoName="REPO-NAME-HERE"

aws ecr create-repository --repository-name ${repoName} --profile default --region ${region}
aws ecr get-login-password --region ${region} --profile default | docker login --username AWS --password-stdin ${accountId}.dkr.ecr.${region}.amazonaws.com
docker buildx build --platform linux/amd64,linux/arm64 -t ${accountId}.dkr.ecr.${region}.amazonaws.com/${repoName}:latest --push .
```
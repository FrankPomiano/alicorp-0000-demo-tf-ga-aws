cd C:\Users\Administrator\Desktop\alicorp-0000-demo-tf-ga-aws\DemoBelcorp2
Set-DefaultAWSRegion -Region us-east-2
(Get-ECRLoginCommand).Password | docker login --username AWS --password-stdin 917972781642.dkr.ecr.us-east-2.amazonaws.com
docker build -f .\DemoBelcorp2\Dockerfile -t alicorp-0000-demo-dev-images-repository .
docker tag alicorp-0000-demo-dev-images-repository:latest 917972781642.dkr.ecr.us-east-2.amazonaws.com/alicorp-0000-demo-dev-images-repository:latest
docker push 917972781642.dkr.ecr.us-east-2.amazonaws.com/alicorp-0000-demo-dev-images-repository:latest
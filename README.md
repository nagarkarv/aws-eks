(Note: Work in progress)
# aws-eks
- Creates a K8s access server with SSH access
- AKS Service
- Two worker nodes

usage:
```
cd main
terraform init
teraform plan
terraform apply
```

Execute the following script on K8s-Server
```
scripts/setup.sh
```

To enable worker nodes joining,  do the following on the K8s Server
```
curl -o aws-auth-cm.yaml https://amazon-eks.s3-us-west-2.amazonaws.com/cloudformation/2019-02-11/aws-auth-cm.yaml
```
Update "rolearn" in aws-auth-cm.yaml file
e.g. 
```
arn:aws:iam::111111111111:role/worker-nodes-role
```
Apply the config and watch nodes
```
kubectl apply -f aws-auth-cm.yaml
kubectl get nodes --watch
```

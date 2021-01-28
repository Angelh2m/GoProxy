Build for Amazon Linux

``` GOOS=linux GOARCH=amd64 go build  proxy.go  ```

### List Instances by public IP

```
aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].{Instance:InstanceId, Subnet:SubnetId PublicIpAddress:PublicIpAddress}"  --region us-east-2 --output table
```

## Terminate Instace

```
  aws ec2 terminate-instances --instance-ids i-1234567890abcdef0 --output table --region us-east-2
```


## Create new EC2 instance


- https://docs.aws.amazon.com/code-samples/latest/catalog/go-ec2-create_instance.go.html

- https://medium.com/tarkalabs/ssh-recipes-in-go-part-one-5f5a44417282


## Try

echo hello world | ssh user@host tee ~/myproc.stdout


## Debug

```
  ssh -i "<KEM>" ubuntu@<IP>
```

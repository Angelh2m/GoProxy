Build for Amazon Linux

``` GOOS=linux GOARCH=amd64 go build  proxy.go  ```

### List Instances by public IP
```
aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].PublicIpAddress"
```
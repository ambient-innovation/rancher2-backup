# rancher2-backup
Rancher v2.x Backup solution on RancherOS which runs periodically using crontab and crond

```
docker run -itd \
-e RANCHER_CONTAINER_NAME=rancher2-ai \
-e RANCHER_CONTAINER_TAG=v2.1.3 \
-e RANCHER_VERSION=v2.1.3 \
-e BACKUP_DIR=/rancher2-backup \
-e ARCHIVE_PASSWORD=my-secret-password \
-e AWS_ACCESS_KEY_ID=my-aws-access-key \
-e AWS_SECRET_ACCESS_KEY=my-aws-secret-key \
-e AWS_DEFAULT_REGION=-my-aws-region \
-e S3_BUCKET_URL=s3://s3-bucket/myrancher2backups/ \
-v /var/run/docker.sock:/var/run/docker.sock rancher2-backup "30 23 * * *  /usr/bin/rancher-backup"
```

To decrypt the backup run `openssl enc -aes-256-cbc -d -in name.tar.gz.enc | tar xz`.

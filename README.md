# [goofys cookbook](https://github.com/shimma/goofys)

Installs [goofys](https://github.com/kahing/goofys) and mounts s3 bucket.

## Information

__This cookbook has not been fully maintained now. Any contributions are welcome!__

## Requirements

### Plafform

- Ubuntu
- CentOS

### Chef

- Chef 10.0+

## Attributes

```
default['goofys']['s3_bucket_name'] = 'my-sample-bucket'
default['goofys']['s3_mount_path'] = "/srv/#{default['goofys']['s3_bucket_name']}"
default['goofys']['binary_version'] = "v0.0.17"
```

## Usage

Please grant S3 bucket access to your instance before run this cookbook.

## License

Apache 2.0

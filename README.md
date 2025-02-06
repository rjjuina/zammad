# Development Environment

## Ensure you have postgresql and redis installed on your system

### create database

```sh
cd zammad
bin/rails db:create
```

## run

```sh
export EXECJS_RUNTIME=Node && rails server 
```
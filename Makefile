zip:
	GOOS=linux GOARCH=amd64 go build -tags lambda.norpc -o bootstrap main.go
	zip aws-lambda-placeholder.zip bootstrap
	rm bootstrap

image:
	docker build -t aws-lambda-placeholder --platform linux/amd64 .

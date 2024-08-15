zip:
	GOOS=linux GOARCH=amd64 go build -tags lambda.norpc -o bootstrap main.go
	zip lambda-placeholder.zip bootstrap
	rm bootstrap

image:
	docker build -t lambda-placeholder --platform linux/amd64 .

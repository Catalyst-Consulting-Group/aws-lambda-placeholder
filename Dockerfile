FROM --platform=$BUILDPLATFORM golang:1.22 as build

WORKDIR /helloworld

COPY go.mod go.sum ./

COPY main.go .
RUN GOOS=linux GOARCH=amd64 go build -tags lambda.norpc -o main main.go

FROM public.ecr.aws/lambda/provided:al2023
COPY --from=build /helloworld/main ./main

ENTRYPOINT ["./main"]

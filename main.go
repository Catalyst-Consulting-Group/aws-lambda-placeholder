package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type GreetingRequest struct {
	Name string `json:"name"`
}

type GreetingResponse struct {
	Message string `json:"message"`
}

func HandleRequest(ctx context.Context, event *GreetingRequest) (*GreetingResponse, error) {
	name := "World!"

	if event != nil {
		name = event.Name
	}

	message := fmt.Sprintf("Hello %s!", name)
	return &GreetingResponse{Message: message}, nil
}

func main() {
	lambda.Start(HandleRequest)
}

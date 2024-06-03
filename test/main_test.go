package test

import (
	"context"
	"log"
	"sync"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/retry"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformModule(t *testing.T) {
	// Set a timeout for the test
	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Minute)
	defer cancel()

	options := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "../",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			//"resource_group_name": "auto-test-group",
			//"server_name":         "auto-test-server",
			// Add other variables as needed
		},

		// Disable colors in Terraform commands so it's easier to parse stdout/stderr
		NoColor: true,
	}

	var wg sync.WaitGroup
	wg.Add(1)

	go func() {
		defer wg.Done()
		defer func() {
			log.Println("Waiting for 30 seconds before destroying resources")
			time.Sleep(30 * time.Second) // Add a delay before destroying
			log.Println("Running terraform destroy")
			terraform.Destroy(t, options)
			log.Println("Completed terraform destroy")
		}()

		// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
		retry.DoWithRetry(t, "Running Terraform InitAndApply", 3, 10*time.Second, func() (string, error) {
			terraform.InitAndApply(t, options)
			return "", nil
		})
	}()

	// Wait for the goroutine to finish or the context to timeout
	done := make(chan struct{})
	go func() {
		wg.Wait()
		close(done)
	}()

	select {
	case <-done:
		// Test completed successfully
	case <-ctx.Done():
		// Test timed out
		t.Fatal("Test timed out after 30 minutes")
	}
}

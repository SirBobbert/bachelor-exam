package test

import (
	"context"
	"testing"
	"time"

	"sync"

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
			// Other variable definitions (if any)
		},

		// Disable colors in Terraform commands so it's easier to parse stdout/stderr
		NoColor: true,
	}

	var wg sync.WaitGroup
	wg.Add(1)

	go func() {
		defer wg.Done()
		defer terraform.Destroy(t, options) // Clean up resources with "terraform destroy" at the end of the test

		// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
		terraform.InitAndApply(t, options)
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

// IF TESTING
//  go test -timeout 35m -v ./test

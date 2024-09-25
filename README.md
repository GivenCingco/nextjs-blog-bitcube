

I separated the Terraform code from the application code for several reasons:
	•	Maintainability: Infrastructure and application code can be managed and updated independently.
	•	Security: Sensitive information, like AWS credentials, is stored as GitHub secrets, reducing exposure risks.
	•	Clarity: This separation clarifies the project’s architecture, distinguishing infrastructure from application logic.
	•	Collaboration: Teams can work concurrently on infrastructure and application code, improving workflow efficiency.



#GitHub Actions Workflow
I set up a workflow using GitHub Actions. The following GitHub Actions workflow triggers AWS CodePipeline whenever there are code changes:

```yaml
name: Trigger AWS CodePipeline

on:
  push:
    branches: [main]

jobs:
  build:
    name: Trigger-pipeline
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      - name: Trigger AWS CodePipeline
        run: |
          aws codepipeline start-pipeline-execution --name bitcube-pipeline
```

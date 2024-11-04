resource "aws_codebuild_project" "project-codebuild" {
  name          = var.codebuild-name
  build_timeout = "10"
  description   = "Building project"
  service_role  = var.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  source {
    type            = "BITBUCKET"
    location        = lookup(var.codebuild_params, "BITBUCKET_REPO")
    git_clone_depth = 1
    buildspec       = terraform.workspace == "production" ? "../buildspec.yml" : "../staging-buildspec.yaml"


    git_submodules_config {
      fetch_submodules = true
    }
  }


  environment {
    image                       = lookup(var.codebuild_params, "IMAGE")
    type                        = lookup(var.codebuild_params, "TYPE")
    compute_type                = lookup(var.codebuild_params, "COMPUTE_TYPE")
    image_pull_credentials_type = lookup(var.codebuild_params, "CRED_TYPE")
    privileged_mode             = true

    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status = "DISABLED"
    }
  }
}
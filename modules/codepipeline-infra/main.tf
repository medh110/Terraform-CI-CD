resource "aws_codepipeline" "codepipeline" {
  name     = var.codepipeline-name
  role_arn = var.role-arn

  artifact_store {
    location = var.s3-name
    type     = "S3"
  }
  stage {
    name = "Source"
    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]
      configuration = {
        ConnectionArn    = var.codestar-connection
        FullRepositoryId = "[repo id]"
        BranchName       = "main"
      }
    }
  }

  stage {
    name = "Build"
    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output"]
      version = "1"

      configuration = {
        ProjectName = var.codebuild-project-name
      }
    }
  }
}


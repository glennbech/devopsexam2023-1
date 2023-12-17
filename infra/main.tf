variable "kandidatnummer" {
  default = "2037"
}

terraform {
  backend "s3" {
    bucket         = "bucket2037"
    key            = "eksamen_2023/infra/terraforms.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}


resource "aws_apprunner_service" "service" {
  service_name = "apprunner-${var.kandidatnummer}"

  instance_configuration {
    instance_role_arn = aws_iam_role.role_for_apprunner_service.arn
    cpu    = "256" # Ønsket CPU-verdi Oppgave 3A
    memory = "1024" # Ønsket minneverdi Oppgave 3A
  }

  source_configuration {
    authentication_configuration {
      access_role_arn = "arn:aws:iam::244530008913:role/service-role/AppRunnerECRAccessRole"
    }
    image_repository {
      image_configuration {
        port = "8080"
      }
      image_identifier      = "244530008913.dkr.ecr.eu-west-1.amazonaws.com/ecr_2037:latest"
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true
  }
}

resource "aws_iam_role" "role_for_apprunner_service" {
  name               = "kandidat2037-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["tasks.apprunner.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["rekognition:*"]
    resources = ["*"]
  }
  
  statement  {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }

  statement  {
    effect    = "Allow"
    actions   = ["cloudwatch:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy" {
  name        = "kandidat2037-apr-policy"
  description = "Policy for apprunner instance I think"
  policy      = data.aws_iam_policy_document.policy.json
}


resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role_for_apprunner_service.name
  policy_arn = aws_iam_policy.policy.arn
}
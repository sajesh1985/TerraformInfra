output "api_url" {
  value = aws_apigatewayv2_api.http.api_endpoint
}

output "ecr_repo" {
  value = aws_ecr_repository.app.repository_url
}

resource "aws_apigatewayv2_api" "http" {
  name          = "${var.app_name}-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "alb" {
  api_id           = aws_apigatewayv2_api.http.id
  integration_type = "HTTP_PROXY"
  integration_uri  = aws_lb_listener.http.arn
  integration_method = "ANY"
}

resource "aws_apigatewayv2_route" "chat" {
  api_id    = aws_apigatewayv2_api.http.id
  route_key = "POST /chat"
  target    = "integrations/${aws_apigatewayv2_integration.alb.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.http.id
  name        = "$default"
  auto_deploy = true
}

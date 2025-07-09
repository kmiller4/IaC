provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "kyle-miller.net"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    connection_attempts = 3
    connection_timeout = 10
    origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    domain_name = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    origin_access_control_id = "E3POMPTJZ0UNUI"
  }
  aliases = ["kyle-miller.net", "www.kyle-miller.net"]
  default_root_object = "index.html"
  http_version = "http2and3"
  is_ipv6_enabled = true
  enabled = true
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  tags = {
    "Name" = "kyle-miller.net"
  }
  tags_all = {
    "Name" = "kyle-miller.net"
  }
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = true
    response_headers_policy_id = "5cc3b908-e619-4b99-88e5-2cf7f45965bd"
    viewer_protocol_policy = "allow-all"
  }
  ordered_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = false
    response_headers_policy_id = "5cc3b908-e619-4b99-88e5-2cf7f45965bd"
    viewer_protocol_policy = "allow-all"
    default_ttl = 0
    max_ttl = 0
    min_ttl = 0
    path_pattern = "/*.js"
    smooth_streaming = false
    trusted_key_groups = []
    trusted_signers = []
    grpc_config {
      enabled = false
    }
  }
    ordered_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = false
    response_headers_policy_id = "5cc3b908-e619-4b99-88e5-2cf7f45965bd"
    viewer_protocol_policy = "allow-all"
    default_ttl = 0
    max_ttl = 0
    min_ttl = 0
    path_pattern = "/*.jpg"
    smooth_streaming = false
    trusted_key_groups = []
    trusted_signers = []
    grpc_config {
      enabled = false
    }
  }
    ordered_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = false
    response_headers_policy_id = "5cc3b908-e619-4b99-88e5-2cf7f45965bd"
    viewer_protocol_policy = "allow-all"
    default_ttl = 0
    max_ttl = 0
    min_ttl = 0
    path_pattern = "/*.jpeg"
    smooth_streaming = false
    trusted_key_groups = []
    trusted_signers = []
    grpc_config {
      enabled = false
    }
  }
    ordered_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = false
    response_headers_policy_id = "5cc3b908-e619-4b99-88e5-2cf7f45965bd"
    viewer_protocol_policy = "allow-all"
    default_ttl = 0
    max_ttl = 0
    min_ttl = 0
    path_pattern = "/*.gif"
    smooth_streaming = false
    trusted_key_groups = []
    trusted_signers = []
    grpc_config {
      enabled = false
    }
  }
    ordered_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = false
    response_headers_policy_id = "5cc3b908-e619-4b99-88e5-2cf7f45965bd"
    viewer_protocol_policy = "allow-all"
    default_ttl = 0
    max_ttl = 0
    min_ttl = 0
    path_pattern = "/*.css"
    smooth_streaming = false
    trusted_key_groups = []
    trusted_signers = []
    grpc_config {
      enabled = false
    }
  }
    ordered_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "kyle-miller.net.s3.us-east-1.amazonaws.com"
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = false
    response_headers_policy_id = "5cc3b908-e619-4b99-88e5-2cf7f45965bd"
    viewer_protocol_policy = "allow-all"
    default_ttl = 0
    max_ttl = 0
    min_ttl = 0
    path_pattern = "/*.png"
    smooth_streaming = false
    trusted_key_groups = []
    trusted_signers = []
    grpc_config {
      enabled = false
    }
  }
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:996738344877:certificate/2d7bd1de-e58c-42ec-b680-b07aaf273123"
    cloudfront_default_certificate = false
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method = "sni-only"
  }
}

resource "aws_route53_zone" "main" {
  name = "kyle-miller.net"
}

resource "aws_dynamodb_table" "table" {
  name= "visitor-counter"
  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_lambda_function" "my_lambda_function" {
  function_name = "visitor-counter-function"
  role = "arn:aws:iam::996738344877:role/service-role/visitor-counter-function-role"
  filename = "visitor-counter-function.zip"
  handler = "lambda_function.lambda_handler"
  runtime = "python3.13"
}

resource "aws_apigatewayv2_api" "gateway" {
  name = "visitor-counter-api"
  protocol_type = "HTTP"
  cors_configuration {
    allow_credentials = false
    allow_headers = [
      "authorization",
      "content-type",
      "x-custom-header",
    ]
    allow_methods = [
      "GET",
      "OPTIONS",
      "PUT",
    ]
    allow_origins = [
      "*",
      "http://localhost:3000",
      "https://kyle-miller.net",
      "https://www.kyle-miller.net",
    ]
    expose_headers = []
    max_age = 0
  }
}
output "certificate_arn" {
  description = "ARN of the issued ACM cert for tm.<domain>"
  value       = aws_acm_certificate_validation.this.certificate_arn
}

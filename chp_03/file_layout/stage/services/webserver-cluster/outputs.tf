output "alb_dna_name" {
  value       = aws_lb.example.dns_name
  description = "The domain name of the load balancer"
}

variable "server_port" {
    description = "The port the server will use for HTTP requests"
    type = number
    default = 8080
}

output "alb_dns_name" {
    description = "aws_lb.example.dns.name"
    value = aws_lb.example.dns_name
}
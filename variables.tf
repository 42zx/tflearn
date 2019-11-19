variable "server_port" {
    description = "The port the server will use for HTTP requests"
    type = number
    default = 8080
}

/*output "public_ip" {
    description = "public ip of EC2 instance example"
    value = aws_instance.example.public_ip
}*/
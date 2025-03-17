output "security_group_id" {
  description = "The ID of the sg"
  value       = aws_security_group.sg_project.id
}

output "sg_id" {
  value = aws_security_group.sg_project.name
}
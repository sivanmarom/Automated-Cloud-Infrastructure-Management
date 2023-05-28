resource "aws_iam_user" "new-user" {
  name = var.iam_user
  path = "/users/"
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.new-user.name
}


resource "aws_iam_group_membership" "admin_group" {
  name  = "admin-group"
  group = var.iam_user_group
  users = [aws_iam_user.new-user.name]

}

output "access_key_id" {
  value = aws_iam_access_key.access_key.id
}

output "secret_access_key" {
  value = aws_iam_access_key.access_key.secret
}

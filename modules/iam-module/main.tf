resource "aws_iam_user" "new-user" {
  name = var.iam_user
  path = "/users/"
}

resource "aws_iam_group_membership" "admin_group" {
  name  = "admin-group"
  group = var.iam_user_group
  users = [aws_iam_user.new-user.name]
}

resource "aws_iam_user_policy" "admin_policy" {
  name = "admin-policy"
  user = aws_iam_user.new-user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.new-user.name
}

resource "null_resource" "local_exec" {
  depends_on = [aws_iam_access_key.access_key]

  provisioner "local-exec" {
    command = <<EOT
      echo "Secret Access Key: ${aws_iam_access_key.access_key.secret}" >> secret_access_key.txt
    EOT
  }
}

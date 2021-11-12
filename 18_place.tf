resource "aws_placement_group" "hjkim_place" {
  name = "hjkim-place"
  strategy = "cluster"
}
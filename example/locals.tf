locals {
  common_tags = "${map(
      "Project", "${var.project_name}",
      "Infrastructure-Management", "terraform",
      "Repository", "${var.repository}",
      "Owner", "${var.owner}"
    )}"
}

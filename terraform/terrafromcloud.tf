terraform {
  backend "remote" {
    organization = "Course"

    workspaces {
      name = "Lesson9"
    }
  }
}
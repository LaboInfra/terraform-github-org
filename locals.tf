locals {
  members = {
    "clementdlg" = {
      role = "admin"
    }
    "Rider128" = {
      role = "member"
    }
    "hag19" = {
      role = "member"
    }
    "C1sper" = {
      role = "member"
      repositories = {
        "dat" = {
          permission = "push"
        }
      }
    }
  }
  repositories = {
    "dat" = {
      description = "Document d'architecture technique pour le service de service de VM à la demande"
      visibility  = "private"
    }
  }
}
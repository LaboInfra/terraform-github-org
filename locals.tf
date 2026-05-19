locals {
  members = {
    "clementdlg" = {
      role = "admin"
      repositories = {} # is admin so no need to specify permissions
    }
    "Rider128" = {
      role = "member"
      repositories = {
        "dat" = {
          permission = "push"
        }
      }
    }
    "hag19" = {
      role = "member"
      repositories = {
        "dat" = {
          permission = "push"
        }
      }
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
    "kanban" = {
      visibility  = "private"
    }
  }
}


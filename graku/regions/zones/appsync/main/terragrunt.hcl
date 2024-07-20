include {
    path = find_in_parent_folders()
}

include "common" {
    path = find_in_parent_folders("common/resolvers.hcl")
}

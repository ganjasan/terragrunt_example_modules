variable "db_name" {
  description = "The name of the DB"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class of the DB (e.g. db.t2.micro)"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of space, in GB, to allocate for the DB"
  type        = number
}

variable "storage_type" {
  description = "The type of storage to use for the DB. Must be one of: standard, gp2, or io1."
  type        = string
}

variable "master_username" {
  description = "The username for the master user of the DB"
  type        = string
}

variable "master_password" {
  description = "The password for the master user of the DB"
  type        = string
}
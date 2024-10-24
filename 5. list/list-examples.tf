# # List of strings
# variable "instance_type" {
#   type = list(string)
#   default = [ "t2.micro", "t2.medium", "t2.large" ]
# }

# # List of numbers
# variable "numbers" {
#   type = list(number)
#   default = [ 0, 1, 2, 3, 4, 5 ]
# }

# # List of Maps
# variable "employee_info" {
#   type = list(object({
#     name = string
#     age = number
#     country = string
#   }))
#   default = [ 
#     {
#       name = "jatin"
#       age = 30
#       country = "india"
#     },
#     {
#       name = "anita"
#       age = 59
#       country = "india"
#     }
#   ]
# }

# # List of mixed types
# variable "mixed_type" {
#   type = list(any)
#   default = [ "apple", 9, true ]   # All these values internally converted into string
# }

# variable "is_prod" {
#   type = bool
#   default = true
# }

# output "instance_type" {
#   value = var.instance_type[2]   # "t2.large"
# }

# output "first_number" {
#   value = var.numbers[0]    # 0
# }

# output "employee_age" {
#   value = var.employee_info[1]["age"]  # 59
#   # value = var.employee_info[1].age  # 59
# }

# output "mixed_type" {
#   value = var.mixed_type[2]  # "true"
# }

# output "is_prod" {
#   value = var.is_prod # true
# }
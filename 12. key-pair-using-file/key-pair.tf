resource "aws_key_pair" "key-pair" {
  key_name   = "deployer-key"
  public_key = file("./test-key.pub") # supply a public key. ssh-keygen -f ${PWD}/test-key
}


# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = file("ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCeFbDpqoFgjCf+OyY8OPYW35Dog7Oeo3Qux3ByOeXQYIhDKthF0COdCM9rfjSd+2X/kvmNz0bjB80JI0S7jTCywGV0dHVAOGuF/SwoOwORJgNmOhHL4o70bu9blJHQMZd5qlSB+h8u+g/5+RqgxKDm4E8Bos2GDr/PAlqld4QDUrNDGgrw0IuSp0bWyVaz3lF4+t16mmC1zt8SSSQjd5vP8jSvl9lBzXbnHL2Re54vliKbQnjy2dPsedP+7daQEPCaRnUOZDKCjUmTM4b9iWb0PVvYk3U7KI/AIRe6ysX1O1F/3pHsHaWD920+dThZQlFGLoD+dMzx8uEIfIgF8Lk327YHdIjyXYMW6lmyGrW7AyUBM77skzc+rruSfXExjHc9Bab2k5uTEZwveOJmKAXRWHX+0NO+nx3UBCLIQ8PgBAc8zlbzSbp3/utjHxGTS8+jQojGvyEosbhDk9+F3EE0vBO9frRCAxkpASiflhbF7fUqZMQR24PGv7UUbwtl2as= legion@LAPTOP-LRMS9O5D") # supply a public key. ssh-keygen -f ${PWD}/test-key
# }

resource "aws_instance" "tf_instance" {
  ami           = var.my_ami   # ap-south-1
  instance_type = var.type_instance
 

  network_interface {
    network_interface_id = aws_network_interface.tf_nic.id
    device_index         = 0
 }

   credit_specification {
    cpu_credits = var.credits_cpu
   
    }
}
 
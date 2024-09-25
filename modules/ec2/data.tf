#Get my public ip
data "http" "myip" {
  url = "https://api.ipify.org"
}
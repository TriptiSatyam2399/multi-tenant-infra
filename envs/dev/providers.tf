provider "kubernetes" {
  host = "https://192.168.49.2:8443"

  client_certificate     = file("/home/triptisatyam2399/.minikube/profiles/minikube/client.crt")
  client_key             = file("/home/triptisatyam2399/.minikube/profiles/minikube/client.key")
  cluster_ca_certificate = file("/home/triptisatyam2399/.minikube/ca.crt")

  config_path = ""
}




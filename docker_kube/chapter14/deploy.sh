docker build -t thomdock/docker_kube_client:latest -t thomdock/docker_kube_client:$SHA -f ./docker_kube/chapter14/client/Dockerfile ./docker_kube/chapter14/client
docker build -t thomdock/docker_kube_server:latest -t thomdock/docker_kube_server:$SHA -f ./docker_kube/chapter14/server/Dockerfile ./docker_kube/chapter14/server
docker build -t thomdock/docker_kube_worker:latest -t thomdock/docker_kube_worker:$SHA -f ./docker_kube/chapter14/worker/Dockerfile ./docker_kube/chapter14/worker

docker push thomdock/docker_kube_client:latest
docker push thomdock/docker_kube_server:latest
docker push thomdock/docker_kube_worker:latest

docker push thomdock/docker_kube_client:$SHA
docker push thomdock/docker_kube_server:$SHA
docker push thomdock/docker_kube_worker:$SHA

kubectl apply -f ./docker_kube/chapter14/k8s
kubectl set image deployments/client-deployment client=thomdock/docker_kube_client:$SHA
kubectl set image deployments/server-deployment server=thomdock/docker_kube_server:$SHA
kubectl set image deployments/worker-deployment worker=thomdock/docker_kube_worker:$SHA

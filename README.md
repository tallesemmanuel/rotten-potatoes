## Deployment projeto Rotten Potatoes em kubernetes

Para realizar todo procedimento de build, veja no outro projeto.

```bash
git clone https://github.com/tallesemmanuel/conversao-temperatura.git
```

## Requisitos - Ter instalado os seguintes serviços.

- Kubectl - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- K3d - https://k3d.io/v5.4.1/
- Docker - https://docs.docker.com/engine/install/ubuntu/

## Como iniciar com esse projeto

Download do projeto.

```bash
git clone https://github.com/tallesemmanuel/rotten-potatoes
```

- Iniciar um cluster.

No meu caso, estou subindo um cluster com 3 agents e 3 servers, analise se para você da certo o total de nós.
Também neste comando, estou especificando a porta da aplicação "8080", mapeando localmente uma porta "30000" para o loadbalancer, caso tenha muitos pods e seja escalável.

```bash
k3d cluster create cluster-rotten-potatoes --agents 3 --servers 3 -p "8080:30000@loadbalancer"
```

- Para realizar o deployment da aplicação, se da necessário rodar apenas um comando.

```bash
kubectl apply -f k8s/deployment.yml
```

- Você pode acompanhar os serviços com o comando.
Nele você consegue ver todos os "pods", "services", "replicateSets", "deployments" e etc.

```bash
kubectl get all
```

Saída do comando.

```bash
NAME                           READY   STATUS    RESTARTS      AGE
pod/mongodb-6f67bb74f7-p92m5   1/1     Running   0             113s
pod/web-db6d97585-fzmfp        1/1     Running   1 (23s ago)   113s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP   10.43.0.1      <none>        443/TCP        2m51s
service/mongodb      ClusterIP   10.43.213.82   <none>        27017/TCP      113s
service/web          NodePort    10.43.73.71    <none>        80:30000/TCP   113s

NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mongodb   1/1     1            1           113s
deployment.apps/web       1/1     1            1           113s

NAME                                 DESIRED   CURRENT   READY   AGE
replicaset.apps/mongodb-6f67bb74f7   1         1         1       113s
replicaset.apps/web-db6d97585        1         1         1       113s
```

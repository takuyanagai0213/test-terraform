# External Secrets Operator template

## templateの生成

helm repoの追加/更新

```sh
$ helm repo add external-secrets https://charts.external-secrets.io
# OR
$ helm repo update
```

以下のコマンドをmonopoly-manifestsディレクトリ直下で実行する

```sh
$ helm template external-secrets external-secrets/external-secrets \
  --set serviceAccount.name=external-secrets-ksa,prometheus.enabled=true \
  --namespace external-secrets \
  --output-dir k8s/vendor/external-secrets
```

デプロイ方法
```
$ kustomize build k8s/vendor/external-secrets | kubectl apply -f -
```

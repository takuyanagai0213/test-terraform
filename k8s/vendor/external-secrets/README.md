# External Secrets Operator template

## templateの生成

以下のコマンドをdatahive-manifestsディレクトリ直下で実行する

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

# ArgoCD template

## templateの生成

以下のコマンドをmonopoly-manifestsディレクトリ直下で実行する

```sh
$ helm template argocd argo/argo-cd \
  --set nameOverride=argocd \
  --namespace argocd \
  --output-dir k8s/vendor/argocd

```

以下のコマンドの出力結果を `k8s/vendor/argocd/kustomization.yaml` のresourcesに反映する
<!-- TODO: 自動化 -->
```
$ cd k8s/vendor/argocd
$ find argo-cd/templates -type f | sort
```

デプロイ方法
```
$ kustomize build k8s/vendor/argocd | kubectl apply -f -
```

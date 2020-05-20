# fish2.2

if test "$SYNC_LOCALHOST_KUBECONFIG" = true \
    -a -e "$HOME/.kube/config" \
    -a -e /usr/local/share/yc-localhost/config.yaml
  mkdir -p "$HOME/.config"
  mkdir -p "$HOME/.config/yandex-cloud"
  sudo cp /usr/local/share/yc-localhost/config.yaml "$HOME/.config/yandex-cloud"
  sudo chown -R (id -u) "$HOME/.config"
  sed -i -e 's|command: .*yc|command: /usr/local/bin/yc|g' "$HOME/.kube/config"
end

if [ -z "${SSH_CLIENT:-}" ] && [ "${TERM:-}" = "linux" ]; then
  echo "ERROR: can't use OSC 52" >&2
  exit 1
fi

if [ -n "${TMUX:-}" ]; then
  tmux load-buffer -w -
else
  b64=$(base64 | tr -d '\n')
  printf "\033]52;c;%s\007" "$b64"
fi

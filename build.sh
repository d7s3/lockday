#!/bin/sh
# Builds index.html (web) from artifact.html (the single source).
set -e
cd "$(dirname "$0")"
{
cat <<'HEAD'
<!doctype html>
<html lang="ar" dir="rtl">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#2F6A8C">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="Lockday">
<meta name="description" content="Lockday: دفتر مهام عربي تتكلم معه وينفّذ">
<link rel="manifest" href="manifest.json">
<link rel="icon" href="icon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="icon.svg">
<style>:root{padding:env(safe-area-inset-top,0px) 0 env(safe-area-inset-bottom,0px);color-scheme:light}body{margin:0;font:14px system-ui,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>
</head>
<body>
HEAD
cat artifact.html
cat <<'FOOT'

</body>
</html>
FOOT
} > index.html
echo "built index.html ($(wc -c < index.html) bytes)"

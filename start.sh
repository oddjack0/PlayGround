#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJECT_DIR"
PORT="${PORT:-3000}"
STATIC_DIR="$PROJECT_DIR/dist"
OPENCODE_WEB_DIR="${OPENCODE_WEB_DIR:?OPENCODE_WEB_DIR must be set by the runtime}"
export PORT STATIC_DIR OPENCODE_WEB_DIR

/usr/bin/time -p mkdir -p "$STATIC_DIR" "$OPENCODE_WEB_DIR"
/usr/bin/time -p cp "$PROJECT_DIR/preview/index.html" "$STATIC_DIR/index.html"
/usr/bin/time -p node -e 'const fs=require("node:fs"); const path=require("node:path"); fs.writeFileSync(path.join(process.env.OPENCODE_WEB_DIR,"deployment-output.json"), JSON.stringify({project:process.cwd(), directory:path.resolve(process.env.STATIC_DIR)}));'

# Keep the static preview server in the foreground for the controller-owned tmux session.
/usr/bin/time -p node --input-type=module - "$STATIC_DIR" <<'NODE'
import { createServer } from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { extname, resolve, sep } from 'node:path';

const root = resolve(process.argv[2]);
const types = { '.html': 'text/html; charset=utf-8', '.css': 'text/css; charset=utf-8', '.js': 'application/javascript; charset=utf-8', '.svg': 'image/svg+xml', '.png': 'image/png', '.jpg': 'image/jpeg', '.webp': 'image/webp' };
const server = createServer(async (req, res) => {
  try {
    const pathname = decodeURIComponent(new URL(req.url, 'http://localhost').pathname);
    let file = resolve(root, `.${pathname}`);
    if (file !== root && !file.startsWith(root + sep)) { res.writeHead(403).end('Forbidden'); return; }
    if ((await stat(file)).isDirectory()) file = resolve(file, 'index.html');
    const body = await readFile(file);
    res.writeHead(200, { 'Content-Type': types[extname(file)] || 'application/octet-stream', 'Cache-Control': 'no-store' });
    res.end(req.method === 'HEAD' ? undefined : body);
  } catch {
    res.writeHead(404, { 'Content-Type': 'text/plain; charset=utf-8' }).end('Not found');
  }
});
server.listen(Number(process.env.PORT), '0.0.0.0', () => console.log(`Emberbound preview serving ${root} on port ${process.env.PORT}`));
NODE

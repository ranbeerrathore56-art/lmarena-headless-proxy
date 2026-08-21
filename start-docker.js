const { spawn } = require('child_process');
const server = spawn('python3', ['src/main.py'], {
  stdio: 'inherit',
  env: { ...process.env, PORT: process.env.PORT || '8080' }
});
server.on('exit', code => process.exit(code || 0));

### Deployment Script (📁 scripts/deploy.sh)

```bash
#!/bin/bash
# Deployment script for C-Project

echo "Deploying the application..."
# Build the application
npm run build

# Deploy to server
scp -r dist/* user@server:/var/www/c-project
```

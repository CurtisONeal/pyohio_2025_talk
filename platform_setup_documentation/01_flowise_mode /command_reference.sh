
# This will attempt to globally install flowise using the pnpm package manager, and it will put it into your binaries' path
pnpm install -g flowise;

# You can still use npx with this ... 
# npx flowise start;

flowise start;

# You can directly call specific browsers if you know which one you want and it's in your PATH:

open http://localhost:3000

# google-chrome http://localhost:3000
# firefox http://localhost:3000
# microsoft-edge http://localhost:3000 # If Edge is installed on Linux

# For Windows (using Git Bash, WSL, or similar environment):
# start http://localhost:3000

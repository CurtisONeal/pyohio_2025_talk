
https://docs.flowiseai.com/getting-started

There are Four sections to this page:
1. Suggested quick start with Docker if you have Docker Desktop
2. Flowise Docker from their page
3. NodeJS method
4. NodeJS terminology for reference
5. Another page in this folder flowise _tutorial_1of31_leon_van_zyl.md is another walk through

---

## 1. Suggested quick start with Docker if you have Docker Desktop

The docker installation previously was more instructions but in my instance the NodeJS has a conflict. Your mileage may vary.

.Docker instructions are below.

Make sure you have Docker Desktop installed and running for your system:
https://www.docker.com/products/docker-desktop/

I recommend you tag your image's name with the date on which you pulled it.

```
$ docker pull flowiseai/flowise:latest

$ docker images | grep flowise # look for its number

$ docker run -d --name flowise_20250706 -p 3000:3000 flowiseai/flowise:latest

$ sudo lsof -i4tcp:3000 -sTCO:LISTEN -Fp 
```


 This will check for processes ids that are listening on 3000 (in case you have conflicts) and provide the process id, incase you need to investigate

Open: [http://localhost:3000](http://localhost:3000/)

If it is running you should see a set up page. 

For the quickstart I suggested using the below values but never for production.

```
user: admin
email: admin@gmail.com
Admin1234@
Admin1234@
```


To **Gracefully Stop the container:** Use the `docker stop` command followed by the `CONTAINER ID` or `NAMES`.

Bash

```
docker stop flowise_new # or docker stop flowise_20250706

# OR (using the ID)

docker stop e7cbc128acdb
```

#### Does the data persist in the Docker?

 Flowise's information is designed to persist, but how and for how long depends on how you set it up.
 
  Flowise uses a database to store all your chatbot configurations, credentials, chat history, and other settings. By default, it uses a SQLite database.

Where and how this data persists depends entirely on how you run Flowise:

A. When Running Flowise in Docker (Your Current Setup)

### Does its information persist? If so, where and how?

**Yes, Flowise's information is designed to persist.** Flowise uses a database to store all your chatbot configurations, credentials, chat history, and other settings. By default, it uses a SQLite database.

If you ran:

`docker run -d --name flowise -p 3000:3000 flowiseai/flowise:latest`

... the SQLite database (`database.sqlite`) is created _inside_ the container's filesystem. If you then `docker rm` that container, **all your data will be lost.**

If you don't explicitly configure data persistence for a Docker container, all data written _inside_ the container is lost when the container is removed (`docker rm`), not when it is stopped. 
 
 To ensure data persists across container restarts and removals, you need to use **Docker Volumes**.

```
docker run -d --name flowise_persistent \ -p 3000:3000 \ -v flowise_data:/app/database \ flowiseai/flowise:latest
```

`-v flowise_data:/app/database`:

- `flowise_data`: This creates a **named Docker Volume** called `flowise_data`. Docker manages this volume, and it's the recommended way for persistence.
    
- `:/app/database`: This is the path _inside the Flowise container_ where Flowise stores its SQLite database file (`database.sqlite`) and other relevant data.
---
## 2. Flowise Docker from their page:

### Flowise - Build LLM Apps Easily

`docker pull flowiseai/flowise`

https://hub.docker.com/r/flowiseai/flowise
##### Drag & drop UI to build your customized LLM flow

[![](https://github.com/FlowiseAI/Flowise/blob/main/images/flowise.gif?raw=true)⁠](https://github.com/FlowiseAI/Flowise)
#### ⚡Quick Start

Download and Install [NodeJS⁠](https://nodejs.org/en/download) >= 18.15.0
1. Install Flowise
    ```bash
    npm install -g flowise
    ```
2. Start Flowise
    ```bash
    npx flowise start
    ```
    With username & password
    ```bash
    npx flowise start --FLOWISE_USERNAME=user --FLOWISE_PASSWORD=1234
    ```
3. Open [http://localhost:3000⁠](http://localhost:3000/)
    
####  Docker with Compose ... more 

##### Docker Compose
1. Go to `docker` folder at the root of the project
2. Copy `.env.example` file, paste it into the same location, and rename to `.env`
3. `docker-compose up -d`
4. Open [http://localhost:3000⁠](http://localhost:3000/)
5. You can bring the containers down by `docker-compose stop`

##### Docker Image
1. Build the image locally:
    ```bash
    docker build --no-cache -t flowise .
    ```
2. Run image:
    ```bash
    docker run -d --name flowise -p 3000:3000 flowise
    ```
3. Stop image:
    ```bash
    docker stop flowise
    ```
#### 👨‍💻 Developers
Flowise has 3 different modules in a single mono repository.
- `server`: Node backend to serve API logics
- `ui`: React frontend
- `components`: Third-party nodes integrations
##### Prerequisite
- Install [PNPM⁠](https://pnpm.io/installation)
    ```bash
    npm i -g pnpm
    ```
##### Setup

1. Clone the repository    
    ```bash
    git clone https://github.com/FlowiseAI/Flowise.git
    ```
2. Go into repository folder
    ```bash
    cd Flowise
    ```
3. Install all dependencies of all modules:
    ```bash
    pnpm install
    ```
4. Build all the code:
    ```bash
    pnpm build
    ```
5. Start the app:
    ```bash
    pnpm start
    ```
    You can now access the app on [http://localhost:3000⁠](http://localhost:3000/)

6. For development build:
    
    - Create `.env` file and specify the `VITE_PORT` (refer to `.env.example`) in `packages/ui`
    - Create `.env` file and specify the `PORT` (refer to `.env.example`) in `packages/server`
    - Run
        ```bash
        pnpm dev
        ```    
    Any code changes will reload the app automatically on [http://localhost:8080⁠](http://localhost:8080/)

#### 🔒 Authentication

To enable app level authentication, add `FLOWISE_USERNAME` and `FLOWISE_PASSWORD` to the `.env` file in `packages/server`:

```bash
FLOWISE_USERNAME=user
FLOWISE_PASSWORD=1234
```

#### 🌱 Env Variables

Flowise support different environment variables to configure your instance. You can specify the following variables in the `.env` file inside `packages/server` folder. Read [more⁠](https://github.com/FlowiseAI/Flowise/blob/main/CONTRIBUTING.md#-env-variables)

#### 📖 Documentation

[Flowise Docs⁠](https://docs.flowiseai.com/)

#### 🌐 Self Host

Deploy Flowise self-hosted in your existing infrastructure, we support various [deployments⁠](https://docs.flowiseai.com/configuration/deployment)

- [AWS⁠](https://docs.flowiseai.com/deployment/aws)
- [Azure⁠](https://docs.flowiseai.com/deployment/azure)
- [Digital Ocean⁠](https://docs.flowiseai.com/deployment/digital-ocean)
- [GCP⁠](https://docs.flowiseai.com/deployment/gcp)
- Others

#### 🙋 Support

Feel free to ask any questions, raise problems, and request new features in [discussion⁠](https://github.com/FlowiseAI/Flowise/discussions)
See [contributing guide](https://hub.docker.com/r/flowiseai/flowise/CONTRIBUTING.md). Reach out to us at [Discord⁠](https://discord.gg/jbaHfsRVBW) if you have any questions or issues. [![Star History Chart](https://api.star-history.com/svg?repos=FlowiseAI/Flowise&type=Timeline)](https://star-history.com/#FlowiseAI/Flowise&Date)

#### 📄 License

Source code in this repository is made available under the [Apache License Version 2.0](https://hub.docker.com/r/flowiseai/flowise/LICENSE.md).


#### 3 Docker Pull Command


docker pull flowiseai/flowise
Copy
###### Why
[Overview](https://www.docker.com/why-docker)[What is a Container](https://www.docker.com/resources/what-container)
###### Products
[Product Overview](https://www.docker.com/products)
###### Product Offerings
[Docker Desktop](https://www.docker.com/products/docker-desktop)[Docker Hub](https://www.docker.com/products/docker-hub)
###### Features
[Container Runtime](https://www.docker.com/products/container-runtime)[Developer Tools](https://www.docker.com/products/developer-tools)[Docker App](https://www.docker.com/products/docker-app)[Kubernetes](https://www.docker.com/products/kubernetes)
###### Developers
[Getting Started](https://docs.docker.com/get-started)[Play with Docker](https://www.docker.com/play-with-docker)[Community](https://www.docker.com/docker-community)[Open Source](https://www.docker.com/open-source)[Documentation](https://www.docker.com/docs)
###### Company
[About Us](https://www.docker.com/company)[Resources](https://www.docker.com/resources)[Blog](https://www.docker.com/blog/)[Customers](https://www.docker.com/customers)[Partners](https://www.docker.com/partners)[Newsroom](https://www.docker.com/company/newsroom)[Events and Webinars](https://www.docker.com/events-and-webinars)[Careers](https://www.docker.com/careers)[Contact Us](https://www.docker.com/company/contact)[System Status⁠](https://www.dockerstatus.com/)






---

## 3. Nodejs Method

Usually the simplest way to run Flowise is with NodeJS. It is a Javascript runtime, that you may have on your machine already. Since there are several package managers that are similarly named a terminology section follows. If you get through it easily feel free to skip it.

https://nodejs.org/en/about

https://medium.com/@s.atmaramani/the-ultimate-guide-to-nvm-mastering-node-version-management-fbb9751876dd

Pre-requisite: ensure [NodeJS](https://nodejs.org/en/download) is installed on machine. 
As of the time of my installation, Node `v18.15.0` or `v20` and above is supported.

https://docs.flowiseai.com/getting-started

```
$ mkdir my-flowise-project 
$ cd my-flowise-project 

# Initialize a pnpm project 
$ pnpm init # Install flowise as a local dependency 

$ pnpm add flowise # Then try to run it (check Flowise docs for local execution command, might be `npx flowise start` or similar) 

$ npx flowise start # npx will find the local flowise package

$ pnpm self-update

$pnpm init

$ pnpm add flowise


# Global installation version --- didn't work for me.
$ pnpm install -g flowise

# [Lots of install echos]

$ flowise start

Need to install the following packages:
flowise@1.6.0
Ok to proceed? (y) y

[....]
Users/curtisoneal/Library/pnpm/global/5:

+ flowise 3.0.3

  
╭ Warning ─────────────────────────────────────────────────────────────────────────────────
│   Ignored build scripts: bufferutil, canvas, couchbase, cpu-features, es5-ext, esbuild, faiss-node,       │
│   fsevents, msgpackr-extract, protobufjs, puppeteer, sharp, sqlite3, ssh2, utf-8-validate.                │
│   Run "pnpm approve-builds -g" to pick which dependencies should be allowed to run scripts.               │
╰────────────────────────────────────────────────────────────────────────────────
% pnpm approve-builds -g # Decide what you want of the above sqlite3 is recommended.

%npx flowise start;

```

Open: [http://localhost:3000](http://localhost:3000/)

It is entirely possible that you will find older package conflicts, things that won't install, or older package manager conflicts.

```   
curtisoneal@curtiss-mbp flowise_mode % flowise start;

2025-07-06 12:02:05 [INFO]: Starting Flowise...

2025-07-06 12:02:05 [ERROR]: DriverPackageNotInstalledError: SQLite package has not been found installed. Try to install it: npm install sqlite3 --save

# Rounds and rounds of trying to get this to work.
```

---



---

## 4. Node terminology:
### NodeJS: JavaScript's Runtime Environment

Think of Node.js as the equivalent of the Python interpreter, but for JavaScript.
It enables JavaScript to be a general-purpose programming language, much like Python.

*NPM* is the default package manager for Node.js 
- `npm` (Node Package Manager) is the default package manager for Node.js. It's used to install, share, and manage project dependencies (libraries and packages) for Node.js applications.
- like pip. This installs packages from the npm registry, managing `package.json` (the equivalent of `requirements.txt` or `pyproject.toml`), running scripts, and publishing your own packages.
*NPX* allows you to run packages without installing them globally.
- `npx` (Node Package Execute) is a tool that comes bundled with `npm` (since npm 5.2.0). Its primary purpose is to execute Node.js package binaries.
    
- **Why it's useful:**
    
    - **Running one-off commands:** You can execute a command from a package without having to install that package globally, keeping your global environment clean.
        
    - **Running local project binaries:** It automatically finds and runs executables from your `node_modules/.bin` directory.
        
    - **Safe and efficient:** It temporarily installs the package if needed, runs the command, and then removes it, preventing global pollution.
*NVM*: 
- `nvm` (Node Version Manager) is a command-line tool that lets you easily install, switch between, and manage different versions of Node.js on your system.
- Essential for projects that require specific Node.js versions, or when you need to test your applications against various versions.
	- like pyenv, condo, et al.
PNPM:  **pnpm: Performant Node Package Manager**
- Think of it as an alternative to `pip` or a more efficient `pip` for specific use cases, focusing on speed and disk space.
- **What it is:** `pnpm` is an alternative package manager for Node.js, similar to `npm` and `yarn`. Its key differentiator is how it stores and links packages.
- **Key features:**
    - **Content-addressable store:** It stores packages on your disk using a content-addressable system, meaning a package is only downloaded once, even if it's used across multiple projects. This saves significant disk space.
    - **Symlinking for dependencies:** Instead of copying dependencies for each project, `pnpm` uses hard links and symlinks to connect your project's `node_modules` to the global store, leading to faster installations.
    - **Strictness:** By default, it's more strict about what packages can be accessed, helping prevent "phantom dependencies" (where a package uses a dependency that isn't explicitly listed in its `package.json`).
YARN: Yet Another Resource Negotiator (An alternative Node.js package manager)** with additional features. (IMO skip it unless you know it - more than we need here.)
- **Analogy for Python Devs:** Another alternative to `pip`, much like `poetry` or `pipenv` provide different workflows and features for Python package management.
- **What it is:** `Yarn` is another popular package manager for Node.js, originally developed by Facebook. It was created to address some of the performance and reliability issues that were present in `npm` during its earlier versions.
- **Key features:**
    - **Performance:** Known for its speed, especially for large projects, due to features like parallel installations and caching.
    - **Reliability:** Uses a `yarn.lock` file (similar to `package-lock.json` in npm) to ensure consistent installations across different environments.
    - **Offline Mode:** Can install packages from a local cache if they've been downloaded before.
    - **Workspaces:** Excellent support for monorepos, allowing you to manage multiple packages within a single repository.
        

---

### Node Troubleshooting pt 1:

https://www.freecodecamp.org/news/node-version-manager-nvm-install-guide/


The above suggests that there are alternative node managers ... asdf, Volta, n, and these can conflict with your attempts to get flowise on your local.



### Node Troubleshooting pt 2 : Additional resources from my first installation on a mac:

On Medium I responded to the above article:

https://medium.com/@s.atmaramani/the-ultimate-guide-to-nvm-mastering-node-version-management-fbb9751876dd

With the following and it has received claps - suggesting that I'm not the only one.
Nov 3, 2024

This was helpful, but my mac wasn't finding nvm after using brew to install it.

I used a combination of this article and [https://stackoverflow.com/questions/16904658/node-version-manager-install-nvm-command-not-found](https://stackoverflow.com/questions/16904658/node-version-manager-install-nvm-command-not-found)

Afterwards it $nvm --version worked.

Thanks for your help.

"Before proceeding, I also recommend that you uninstall Node.js if you have it installed already so that you do not have any conflicts with Node.js and nvm."

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```


[[]]

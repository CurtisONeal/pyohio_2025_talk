There are files in this folder that a note application Obsidian or cannot see since they are not Markdown.

These include:
- .env.example which is an example .env file for your folder which should hold your API keys.
- .env (your actual instance of the API keys)
- n8n_cmd.sh    - a command to pull and start an n8n docker container
	- If you have docker desktop installed and running
		- you can cut and paste the text in this file into the bash and hit enter 
		- -or-
	- you can $chmod +e n8n_cmd.sh 
		- then 
	- $./n8n_cmd.sh
	- http://localhost:5678/
- n8n_workflow.json this is an exported workflow file 
	- http://localhost:5678/
	- Click new workflow 
	- Import
		- Import this file
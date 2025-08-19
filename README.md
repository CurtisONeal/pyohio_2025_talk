# pyohio_2025_talk

This repo is for my talk presented on  2025_07_29 at CSU, at the 2025 [PyOhio conference](https://www.pyohio.org/2025/), in both pdf and slidev formats.

https://www.pyohio.org/2025/program/talks/a-very-brief-overview-of-pythons-lang-ai-tools-and-two-low-code/


## About
A pdf file of the presentation is in the main repo. Most people will want this. [Link to PDF](https://github.com/CurtisONeal/pyohio_2025_talk/blob/main/A%20Very%20Brief%20Overview%20of%20Pythons%20Lang%20AI%20Tools%20and%20Two%20Low-Code%20GUI%20AITools_%20Flowise%20and%20N8N%20-%20Slidev.pdf)

### Slidev
This talk was presented in slidev, which is like Powerpoint for people who need to present code, and is written in Javascript and runs in NodeJS.

The repo contains only the Slidev componenets that won't duplicate Node_modules are in the repo. Please see the slidev_README.md for more details if this is of use.


# Talk Summary


## A Very Brief Overview of Python’s “Lang” AI Tools and Two Low-Code GUI AI Tools: Flowise and n8n
30 Minute Talk
Given on Sunday July 27, 2025 at 2:45 pm in Ballroom C, at PyOhio in Cleveland, Ohio.

AI is the theme of the moment - and even as a pythonista you might not know where to begin, or you may have started as you had time - and wished to go further. This talk is a guide about where some have gone, and where you might want to go with AI in python. But it is not the last stop. This talk is designed to be a stating guide to move from hobbyist level AI learning to more production-ready coding.

Often where you begin is with some of the low-code GUI tools - for instance Flowise [ flowiseai.com] - where with a api key and some clicks you can quickly build a chatbot - and then you leant to add complexity - maybe you pull out some embeddable code -or start to have more than one agent talk to each other, or with some walk-throughs you build a knowledge-base of documents for your bot ( a RAG - Retrieval Augmented Generation ) and now it knows - all your recipes.

Later you want to give your bot some "hands" or rather tools and later you connect to N8N [n8n.io] - which is a flexible workflow automation. You've made your bot reach out into the world to do something (aka made it "Agentic").

But then you want more control - and stability - so you look to do what you previously did in low-code- directly in python, with a view to production.

This is when you look to the "Lang" flavor tools: Langchain, Langflow, Langraph, and Langsmith.

Given the time, this will be a very quick tour of these concepts with both images and code shown - so it won't be a line-by line build along. A repo and suggested resources will be provided at the end.

Presented by
Curtis Oneal


# Structure

My original plan for the talk included a take home project that would use a weather API and google email api. I later realized that the google api key is not easy for every user to get. My second version of this was discontinued in the interest of time. I may add the files in a later update to the repo. 

## /platform_setup_documentation

There are various markdown files in this folder for more options and details for setting up N8N and Flowise than are in the presentation.

- Langflow set up details are not needed beyond the slide commands.

- I plan to adjust a jupyter notebook with a Langchain demo.

## /images
These are image files from the presentation

- I'll likely update the images with captures of what was shown in the brief walk throughs, or what should have been shown, but I had technical difficulties and a compressed timeline - and moved on.

## /components

The /components file in a slidev project hold any custom javascript elements.

There is a custom chatbot element that was made with the Javascript embed code for the flowise bot ( The reference is for a bot made on my local). 

It would be possible for you to reproduce the effect by following the Flowise install steps from either the slide or from /platform_setup_documentation

## Thanks

My thanks go out to: 
- [Pyohio](https://www.pyohio.org/)
- [CLEpy and company](https://www.meetup.com/cleveland-area-python-interest-group/)
- [Pyladies local chapter (for the joint sessions with CLEpy)](https://www.meetup.com/cle-pyladies/)
- [Clevalend AI & Data](https://www.meetup.com/cleveland-ai-data/)
- [AI Woodstock CLI](https://www.meetup.com/ai-woodstock-cle)
- [The Python Foundation](https://www.python.org/psf-landing/), and 
- [Meta](https://www.meta.com/) for supporting the conference, and to 
- [BlueSkyAI](https://blueskyai.co/) for the fantastic opportunity to be immersed in GentAI and Data Science daily.




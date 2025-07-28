---
theme: seriph
background: /images/spider-web-1.jpg
title: 'A Very Brief Overview of Pythons Lang AI Tools and Two Low-Code GUI
  AITools: Flowise and N8N'
info: |
  ## Or biting off a more than I could chew
  30 Minute Talk
  Sunday at 2:45 pm in Ballroom C
  Learn more at [pyohio proposal](https://www.pyohio.org/2025/program/talks/a-very-brief-overview-of-pythons-lang-ai-tools-and-two-low-code/)
class: text-center
drawings:
  persist: false
transition: slide-left
mdc: true
lineNumbers: true
---

A Very Brief Overview of: Python's Lang AI Tools and Two Low-Code, GUI, AI Tools - Flowise and N8N
<br> July 27, 20205
<br> Sunday at 2:45 pm in Ballroom C
---
layout: cover
background: /images/your_cover_bg.jpg
title: "Thank you's: PyOhio, CLEpy, and You"
subtitle: 'GUI AI tools and Python Lang tools - a speed-run'
subsubtitle: 'How I bit off more than I could chew in 30 minutes or less'
author: 'Curtis Oneal'
date: 'July 13, 2025'
transition: slide-down
---

<div class="text-center">
<h1> {{ $frontmatter.title }}</h1>
<p class="text-3xl op80" v-click="1">{{ $frontmatter.subtitle }}</p>
<p class="text-xl mt-4 text-pink-500" v-click="2">or {{ $frontmatter.subsubtitle }}</p>
<p class="text-xl mt-4">By {{ $frontmatter.author }}</p>
<p class="text-xl op60">{{ $frontmatter.date }}</p>
</div>

<!--
Some quick thank you's.
Thanks to PyOhio for having me.
To ClePY for community, for letting me run a draft of this there on July 13. This was its title then.
And to you for listening, and you forgiveness with the rough edges and any errors that will come up.
-->

---
layout: default
title: '0 Introduction'
---

# Introduction

1. This talk is intended for intermediate Pythonista and the AI curious person who has wondered about AI and also deployment. After all this is a Python Conference and you are here.

2. I make a lot of assumptions about your interest, your llm exposure and willingness to dig into documentation or tutorials. 

3. This talk is not a code walk-through, but more of a tourist map of some of the tools you could use.

4. It bridges the conversation between low-code AI tools and some of Python's Lang-named ecosystem. 

<div class="my-bullets1">
 <h4>**You'll see how to prototype quickly with:**</h4>
<ul>  
<li>Flowise </li>
<li>n8n</li>
<li>We'll transition to scalable Python implementations using: *LangChain, *Langflow,*LangGraph, *LangSmith. We'll wave as we pass by at a few other Lang' tools.</li>
<li>We'll explore some practical challenges along the way. </li>
</ul>
</div>

<!-- (I don't cover a large nunber of terms thinking you have already heard them either before or this weekend, or you will google them if you download. -->

---
layout: two-cols
title: '1 Introduction: My Background'
transition: slide-down
---

## My Background
- My AI, Data Engineering, and coding background is largely based in Medical Metrics at Enterprise scale
  - Watson Health
  - Arbormetrics (Ann Arbor MI)
  - Arkos Health (AZ)
  - BlueSkyAI (NC)
- I have past experience with some low-ish code tooling that hides the logic
  - Nifi 
  - Mulesoft Dataweave (Salesforce)
  - Mirth Connect
  - Talend Open Studio
- And huge integration systems where each touch-point is its own specific adaptation.

::right::
## My Initial Approach's Bias
- Don't hide the logic
- Transparent diffs
- Git commits and change tracking
- Cloud scaling/High Availability(AWS|GCP|Azure)
- Infrastructure as code (e.g.,Terraform, Ansible)
- Automated deployments 

## Danger of Confirmation Bias
- While approaching the topic I'm open to other evidence that these GUI tools have capabilities that can satisfy the above needs.
- Limited research on the topic shows N8N and Flowise in production at other companies.


---
layout: image
title: "2 There are Patterns Everywhere"
image: /images/flower-townsend-walton-G7ppFb-sXEE-unsplash.jpg
---


---
layout: default
title: "3. Agent Patterns"

---

## Most Commonly talked about LLM Architectural Patterns

1. **ReAct (Reasoning and Acting)**

LLM reasons, plans actions, executes tools, observes results, iteratively refines

2.  **Tool-Calling Agent**

LLM equipped with external tools (APIs, databases, calculators) for enhanced capabilities


3.  **Agent Supervising Agent (Hierarchical)**

Supervisor agent delegates tasks to specialized sub-agents, coordinates results

4.  **Multi-Agent Collaboration**

Peer agents communicate and work together toward shared goals

5.  **Retrieval-Augmented Generation (RAG)**


---
layout: default
title: "4 SDKs' Because there are patterns there are SDKs that abstract them"
---

## "A Few" AI SDKs 

-  <div style="color: purple;">LangChain - open-source framework for LLM applications with modular components, RAG capabilities, and memory for building chatbots and AI agents</div> 
- **Google AI SDK/Vertex AI** - Google's platform with Gemini models, document summarization, unified API access, and fully-managed ML deployment
- **LlamaIndex** - Specialized framework for connecting LLMs to diverse data sources with powerful indexing, querying, and retrieval-augmented generation
- **OpenAI SDK** - Direct API access to GPT models providing text generation, embeddings, and fine-tuning capabilities for developers
- <div style="color: purple;">Low-Code/No-Code Platforms - n8n (workflow automation), Flowise (visual LLM orchestration) democratizing AI development for non-technical users</div> 
- **Multi-Agent Frameworks - CrewAI** (role-playing agents), AutoGen (cooperative agents) enabling sophisticated AI team coordination and task distribution
- **Specialized Provider SDKs** - Cohere (NLP focus), AI21 Labs (creative writing), Anthropic Claude (ethical AI), each offering unique strengths and model characteristics
- **etc** ...(word salad)

<!-- You wouldn't manually code for tabular data, you'd use a package like pandas or polars. So try and find tools.  -->

---
layout: image-left
title: '5 Why Start with GUI Tools?'
image: /images/containers.png
transition: fade
---

## GUI Tool-sets Advantages

Key Takeaways:
- Rapid prototyping advantages
- Visualization of complex workflows
- Learning deeper concepts without getting lost in code
- Applying complex concepts staying at a high-level of strategy

Note: <br>
N8N is Typescript under the hood. <br>
Flowise is Langchain Typescript under the hood.

---
layout: full
title: '5. High-Level Comparison'
transition: fade
---

<h2 class="mt-4"> Platform Comparison </h2>

| Feature | N8N | Flowise | LangFlow | LangChain & Graph |
|---------|-----|---------|----------|-----------|
| **Visual Interface** | ✅ Node-based | ✅ AgentFlow V2 | ✅ Component-based | ❌ Code-only |
| **Learning Curve** | Low | Medium | Medium | High |
| **Customization** | Medium | High | High | Highest |
| **Error Handling** | Good | Good | Good | Excellent |
| **Scalability** | Good | Good | Good | Excellent |
| **Deployment** | Easy | Easy | Easy | Flexible |

This was a Claude.ai comparison. I find Flowise UI easier to navigate, but N8N easier to troubleshoot.

<!-- I hope to show you why in a bit.  -->

---
layout: image
title: "6 Branching Flows Rather than Circular Patterns "
image: /images/cropped-daniel-gomez-FCVMPabu16w-unsplash.jpg
backgroundSize: full
---



<!-- These break up the sections.  -->

---
layout: two-cols
title: '7 Flowise Overview'
image: /images/flowise_chatbog_demo.png
---

# Flowise
- GUI demonstration: Creating a basic chatbot
- Key components: nodes, connections, interfaces
- Live 'demo': Building a simple assistant
- If you have Node and NPM or PNPM:

[Shortcut to running local](http://localhost:3000/canvas)

[Getting Started](https://docs.flowiseai.com/getting-started)

[Official Tutorials](https://docs.flowiseai.com/tutorials)

[Leon Van Zyl](https://www.youtube.com/@leonvanzyl)


<div class="flex flex-col items-center mt-8">
```python
# Install flowise with NodeJS
npm install -g flowise
# Specific version
npm install -g flowise@x.x.x
# Start Flowise:
npx flowise start
```
</div>

::right::
<div class="mermaid2" style="max-height: 80vh; overflow: auto; transform: scale(0.85); transform-origin: top;">
```mermaid
flowchart TD 
A[Chat Trigger] --> B[AI Agent] 
B --> C{If Node} 
C -->|True Path| D[Tool Call] 
C -->|False Path| E[Alternative Action] 
D --> F[Response]
```</div>

<!-- This was a minimal project I was trying to build the instrctions for to supply in the repo.
producing reliable instructions for flowise, N8N, Langflow, and Langchain is ongoing. I'll push to the repo as I feel better about them.  -->

---
layout: default
title: "8 Will it work?"
---

# My Interactive Slide


## (Click on the blue bubble below.)


<Chatbot />

<!-- This blue bubble uses the javascript embed code from Flowise. It is put into a componenet in the deck, and is runnable. Although I've managed to bread it a few times this morning. Let's see if it works.  -->

---
layout: image-right
title: '9. Flowise Assessment'
image: /images/flowise_chatbog_demo.png
---

### Flowise Additional Patterns
- API key/Secret Organization is Straightforward
- Naive RAG is fairly easy
- Tool Use can be easy
- Multi-agent interaction is simple
- Complex model understanding is easy

### Flowise Areas of Concern
- Self hosting in cloud is challenging
- Documentation lags
- Requires a database for persistence of configurations
  - Leads to problematic scaling designs
  - This makes it brittle 
- Path to reload it as code is difficult

<!-- In genteral it seems great for "simpler" designs and gets you started fast. Much more complex integration can be done in N8N though.  -->

---
layout: image
title: "10. Next N8N"
image: /images/spider-web-3.avif
---

<!-- You start to see the point of the spirder webs with the nodes and edges, and the complexity.
as a comparison.  -->

---
layout: two-cols
title: '11. N8N Overview'
url: http://localhost:8000/test_localhost.html
---

# N8N
- GUI demonstration: Creating a basic Workflow
- Key components: nodes, connections, Triggers, Actions
- Live 'demo': Building a simple Flow
- AI bots are doable, start small
- Using Docker

## Docs
- [Shortcut to my running N8N](http://localhost:5678/workflow/faJjleuxBcPxzB2X)
- [N8N Installation guide Docker](https://docs.n8n.io/hosting/installation/docker/)
- [N8N Installation guide NPM NodeJS](https://docs.n8n.io/hosting/installation/npm/)
- [Very Quick start](https://docs.n8n.io/try-it-out/tutorial-first-workflow/)
- [15 Minute Tutorial video](https://www.youtube.com/watch?v=4cQWJViybAQ)

::right::
<div class="code right bottom-30 " >
```bash
# Set up a dedicated space for N8N
docker volume create n8n_data
# This complex set of commands will pull a docker 
# image set it up with and serve it locally, and 
# mount a docker volume to persist your data locally
docker run \
  -it \
  --rm \
  --name n8n \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  docker.n8n.io/n8nio/n8n
```
</div>

---
layout: image-right
title: "12. Next Complexity Automation"
image: /images/complex-workflow-feature-request.jpeg
backgroundSize: contain
---

# Jump to: 
https://community.n8n.io/t/re-route-nodes-connections-for-complex-workflows/62003

<!-- Step through the pictures in this feature request. The complexity is both good
but obviously it can be a challenge to manage.  -->

---
layout: image
title: "13. Transitioning back to python""
image: /images/spider-web-2.jpg
backgroundSize: default
---


---
layout: default
title: '14 Decorators **Python Decorators Matter in Langchain**'
---

# Shifting back toward python

## Decorators 
Decorators are first class objects in python, that can get deep quickly.

The can be used on both functions and classes, and allow you to modify the behavior of the code without actually modifying it.

In Python they have an @ symbol and name and go in front of a function definition.

They change the behavior of the function, and glossing over detail level are used in essentially pass functions to and through one another keeping their state, and keeping track of why you are doing it.

The one you've most likely seen is the `@asyc` decorator.

Langchain et al. use these frequently.

[Realpython Decorator overview](https://realpython.com/primer-on-python-decorators/)

<!-- Decorators make units of code runnable and chainable like the boxes and lines in the visuals but they connect more like words in a sentence and the branching logic is more hidden.  -->

---
layout: default
title: '15. **LangChain Fundamentals**'
---

# Langchain
## High-level Concepts
- When you use a desktop or web-based LLM Application it manages many details for you that as an API caller you manage
  - Current conversational context, chat History, past chats
  - Which part of the conversation is you vs the LLM
  - Custom settings and prompts
  - Access to custom knowledge
  - Access to specific integrations that you may have allowed
- Langchain abstracts away the specifics of the API implementation of each LLM.
- [reference for LLMs APIs](https://python.langchain.com/api_reference/langchain/index.html
  - Look down the left side menu
  - Examine the following image on the next slide Attribution is below.) [^1]
    - The abstraction makes the data transportation uniform across the various implementations

 [^1] url: https://www.devshorts.in/p/unpacking-langchain-all-you-need  by Banerjee and Putrevu Oct 26, 2024

<!-- Thesse start to be the abstraction units.  -->

---
layout: image
title: Banerjee and Putrevu
image: /images/Banerjee_and_Putrevu_2024.png
backgroundSize: contain
---

<!-- Visual Thesse start to be the abstraction units.  -->

---
layout: full
title: '16. **Langchain Simple case**'
---

## Langchain - simplest case
- prompt chaining
- while this is the simplest case other uses make runnable objects of LLMs, prompts and states that "pipe" into each other like the bash | operator or R's %>% (from the magrittr package) 
<div class="h-full flex items-center justify-center ">

```python
from langchain_core.prompts import ChatPromptTemplate
from langchain_openai import ChatOpenAI

prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant"),
    ("human", "{input}")
])
model = ChatOpenAI()
chain = prompt | model
result = chain.invoke({"input": "Hello world"})
```

</div>

Reference: [LangChain Documentation](https://python.langchain.com/docs/introduction/)

<!-- Zoom into the side bar on the API page for more Visual Thesse start to be the abstraction units.  
See the chain like bash pipe on the bottom. -->

---
layout: two-cols
title: '17. **LangGraph Agent Orchestration**'
url: http://localhost:8000/test_localhost.html
---

## LangGraph 
- Graph-based architecture for complex workflows
- State management and check-pointing
- Human-in-the-loop capabilities
- Multi-agent coordination
- Langgraph is how syntactic python does the nodes and connections we saw in the GUI's

Reference: [Langgraph Documentation](https://langchain-ai.github.io/langgraph/)
::right::
<div class="h-full flex items-center justify-center">

```python
from langgraph.graph import StateGraph
from typing import TypedDict

class State(TypedDict):
    messages: list

def agent_node(state):
    # Agent logic here
    return {"messages": state["messages"] + ["response"]}

graph = StateGraph(State)
graph.add_node("agent", agent_node)
graph.set_entry_point("agent")
graph.set_finish_point("agent")
```
</div>

<!-- Zoom into the side bar on the API page for more Visual Thesse start to be the abstraction units.  
See the chain like bash pipe on the bottom. -->

---
layout: two-cols
title: '18. **Fast Pass at LangSmith**'
url: http://localhost:8000/test_localhost.html
---

## LangSmith And Web Platform
- Real-time tracing and debugging
- Performance metrics (latency, cost, quality)
- A/B testing capabilities
- Framework-agnostic (works beyond LangChain)
- [My Login Link](https://smith.langchain.com/o/8b10a387-6472-40dc-a5b8-3ef5088a96bd/dashboards/projects/add37f7f-c840-487c-9848-1548c4e265c9)

Reference: [LangSmith Documentation](https://docs.smith.langchain.com/)

::right::

<div class="h-full flex items-center justify-center">

```python
from langsmith import traceable

@traceable
def my_llm_function(input_text):
    # Your LLM logic here
    return response

# Automatic tracing to LangSmith dashboard
result = my_llm_function("Hello")
```
</div>

<!-- This is the attempt at observability and monitoring - which in the lab you might need less then in prod. -->

---
layout: full
title: '19. **LangSmith Purpose**'
url:  http://localhost:8000/test_localhost.html
---

You might ask yourself Why?

# Langsmith Business Impact:

- Cost Optimization: Track token usage and spending
- Quality Assurance: Monitor response quality
- Debugging: Trace failures in production
- Prompt testing


---
layout: two-cols
title: '20. **LangServe API deployment**'
url:  http://localhost:8000/test_localhost.html
---

# LangServe:
- Convert LangChain chains to REST endpoints
- Automatic API documentation
- Streaming support
- Production-ready deployment
- Uses Pydantic for Typing and FastAPI for API-ing

## Use Cases:
- API Deployment: Expose LLM workflows as services
- Integration: Connect with existing systems
- Scalability: Production deployment

Reference: [LangServe Documentation](https://python.langchain.com/docs/langserve/)
Sadly no longer adding features in preference to Paid platform
::right::

<div class="h-full flex items-center justify-center">

```python
from langserve import add_routes
from fastapi import FastAPI

app = FastAPI()
# Add your chain as an API endpoint
add_routes(app, chain, path="/my-chain")

# Now accessible at /my-chain/invoke
```
</div>

<!-- This is no longer taking feature requests, and they are pushing people toward their hosting. -->

---
layout: two-cols
title: '21. ** LangHub**'
---

# LangChain Hub (LangHub) - Prompt sharing
- Prompt version control
- Community sharing platform
- Model-specific optimizations
- Programmatic access
- Its a combination of github and hugging face for prompts

# Why? / Value Proposition:

- Community: Share best practices
- Re-usability: Don't reinvent prompts
- Versioning: Track prompt evolution
  - Then check the variation performance in LangSmith

::right::

<div class="h-full flex items-center justify-center">

```python
from langchain import hub

# Pull a public prompt
prompt = hub.pull("rlm/rag-prompt")

# Push your own prompt
hub.push("my-prompt", prompt_template)
```
</div>

<!-- Commmunity, search, and gitshare. This can be auto loaded from Flowise. Maybe in N8N? -->


---
layout: image
title: "22 Langflow - Backup image in case I dont get to run it.""
image: /images/Langflow.png
backgroundSize: contain
---


---
layout: default
title: '23. ** LangFlow Visual builder **'
---
# LangFlow - Visual GUI Version
- Visual node-based editor
- Prebuilt components
- Integration with LangChain
- Can export individual flows as JSON ... still can't Diff it.
- Rapid prototyping
- Can self host, but holds state
  - while not transformable back to code, there is a feature request for this.
- DatStax, not LangChain, owns this and is in process of being acquired by IBM.

<!-- This should look familiar -->

---
layout: two-cols
title: '24. ** LangFlow Setup Options **'
---
# Langflow Setup Options

- **Repository**: [https://github.com/langflow-ai/langflow](https://github.com/langflow-ai/langflow)
- **License**: MIT (completely free)
- **Installation**: Self-hosted

### DataStax LangFlow (Paid Platform)
- **URL**: [https://www.datastax.com/products/langflow](https://www.datastax.com/products/langflow)
- Type: Managed cloud service
- Visual Interface**: Same visual interface + enterprise features

[Link to running process](http://0.0.0.0:7860/flow/a33343d7-19ee-4445-b8bd-ff1e37ef9f6b)

::right::
<div class="h-full flex items-center justify-center">

```bash
# Install with pip
pip install langflow

# Start the visual interface
python -m langflow run

# Or use the shortcut
langflow run --host 0.0.0.0 --port 7860
```
</div>

<!-- This takes a while to download -->

---
layout: default
title: '24 Key Takeaways A'
---

## What We've Learned

* Flowise and n8n simplify AI workflows.
* Docker provides robust deployment.
* Persistence is critical for data integrity.
* Everyone is using these as freeware - with a managed hosting component, except for raw python
* Trying to serve your AI as a product or service, to an App, a business or an enterprise has different needs than your home lab does.
* Langchain family tools have deep methods for each, but has a much higher learning curve
* Thankfully we have AI to help digest all the documentation.



---
layout: default
title: '25 Key Takeaways B'
---

## Succinctly: 

The GUI tools allow you to learn the strategy, patterns, interactions, and to iterate quickly. 

The code allows you to deploy seamlessly.

<!-- Still wondering if there is a way to load that JSON back into the GUIs. -->

---
layout: quote
title: " 26 I've seen that both Flowise and N8N are used in production by Enterprises"
---

# Open to Other Experiences
## "When the Facts Change, I Change My Mind. What Do You Do, Sir?"
- John Maynard Keynes/ Paul Samuelson/ Winston Churchill ... [by quoteresearch July 22, 2011](https://quoteinvestigator.com/2011/07/22/keynes-change-mind/)

- I'm open to being educated on the ways to run these GUI based methods in a more sustainable way. I'm likely ignorant of the way that is done.


<!-- This basically crowdsources my search for who is doing it out in the world. -->

---
layout: full
title: "27. Gemini tells me ... ""
---

# N8N: 
- Their website and community forums feature numerous case studies and user stories from companies of various sizes. 
- Official case studies page: https://n8n.io/case-studies/

# Flowise: 
- The FlowiseAI GitHub repository and community discussions also point to production use cases. 
- Examples in the "Show and Tell" section of their GitHub discussions: https://github.com/FlowiseAI/Flowise/discussions/categories/show-and-tell


<!-- Flowise also has a deployment section to the documentation, and an API to create things.... -->

---
layout: two-cols
title: '28 Minimum Resource Dump'
---

# Minimal Resources
## N8N
- [n8n Official Documentation](https://docs.n8n.io/)
- [n8n video courses](https://docs.n8n.io/video-courses/)
- [n8n AI Automation Workflows](https://n8n.io/workflows/categories/ai/)
- [n8n Workflow library and tutorials](https://n8n.io/workflows/)
## Flowise
- [Flowise Getting Started](https://docs.flowiseai.com/getting-started)
- [Flowise Official Tutorials](https://docs.flowiseai.com/tutorials)
- [Flowise Community Flows](https://github.com/FlowiseAI/Flowise/discussions/categories/show-and-tell)
- [Leon Van Zyl](https://www.youtube.com/@leonvanzyl)

### Slidev - [Slidev](https://sli.dev/)
- [The tutorial I wish I had read](https://www.wimdeblauwe.com/blog/2024/11/05/technical-presentations-with-slidev/)

::right::

## Lang-various
- [LangChain Python Documentation](https://python.langchain.com/docs/get_started/introduction)
- [LangChain Templates](https://github.com/langchain-ai/langchain/tree/master/templates)
- [RAG Advanced Patterns](https://python.langchain.com/docs/use_cases/question_answering/)
- [LangChain Gallery](https://python.langchain.com/docs/gallery)
- [Agent Construction Patterns](https://python.langchain.com/docs/integrations/tools/)
- [LangGraph Examples](https://github.com/langchain-ai/langgraph/tree/main/examples)

- [LangGraph Tutorials](https://langchain-ai.github.io/langgraph/)
- [LangSmith Quick-start](https://docs.smith.langchain.com/get-started)
- [Advanced LangSmith Tracing](https://docs.smith.langchain.com/tracing)
- [LangSmith Evaluation Guides](https://docs.smith.langchain.com/evaluation/evaluation-overview)

---
layout: default
title: '29 Ending'
---

# Thank you


<br>Contact me at: curtis@blueskyai.co

<br>Curtis O on Cleveland Tech Slack, ClePy
<br>Repo: https://github.com/CurtisONeal/pyohio_2025_talk
<br><br>Please reach out or connect
<br>http://www.linkedin.com/in/curtisoneal


<img src="/images/my_linkedin_qr_code.jpeg"
  alt="QR Code to my contact"
  class="absolute bottom-10 right-10 w-40 h-40"
  style="object-fit: contain;"
/>

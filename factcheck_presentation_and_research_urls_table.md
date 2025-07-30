# Fact-Check Assessment and Research URLs

## **Fact-Check Results**

### ✅ **VERIFIED CLAIMS**

**Flowise & n8n in Production:**
- Flowise is indeed used by Fortune 500 companies and enterprises in production, with case studies showing real-world deployments
- n8n has documented enterprise case studies, including Delivery Hero saving 200 hours/month with workflows
- Flowise documentation includes specific production deployment guidelines with PostgreSQL, load balancing, and AWS S3 support

**LangFlow & DataStax/IBM Acquisition:**
- IBM announced intent to acquire DataStax (parent company of LangFlow) in February 2025
- DataStax acquired LangFlow (Logspace) in April 2024
- Your statement about "DataStax, not LangChain, owns this and is in process of being acquired by IBM" is accurate

**LangServe Status:**
- LangServe is not actively accepting new features: "We will continue to accept bug fixes for LangServe from the community; however, we will not be accepting new feature contributions"
- Your claim about it "no longer adding features in preference to Paid platform" is accurate

### ⚠️ **PARTIALLY ACCURATE**

**Python Decorators in LangChain:**
- LangChain heavily uses the @tool decorator for creating custom tools
- There's a separate "langchain-decorators" library that provides syntactic sugar, but it's not core LangChain
- Your emphasis on decorators is valid, though you might clarify the distinction between core LangChain decorators and the separate decorators library

### ❌ **ATTRIBUTION ERROR**

**Keynes Quote:**
The quote "When the Facts Change, I Change My Mind. What Do You Do, Sir?" is commonly misattributed. Quote investigators have found no evidence Keynes ever said this. You correctly noted the uncertainty with "John Maynard Keynes/ Paul Samuelson/ Winston Churchill" but should probably remove this or note it's an unverified attribution.

### ✅ **ARCHITECTURAL & TECHNICAL CLAIMS**

**GUI Tool Advantages:**
- Both tools offer rapid prototyping, visual workflows, and reduced learning curves as claimed
- Production deployment challenges you mention (database persistence, scaling complexity) are documented concerns

**Agent Patterns:**
Your listed patterns (ReAct, Tool-Calling, Hierarchical, Multi-Agent, RAG) align with industry standards and are well-established in the literature.

### 📊 **STATISTICS TO VERIFY**

- n8n GitHub stars: You didn't specify but current data shows significant community adoption
- Flowise: "12,000 stars on Github" - this appears in marketing materials

## **OVERALL ASSESSMENT**

Your presentation is largely factually accurate, especially regarding:
- Enterprise adoption of GUI tools
- Technical capabilities and limitations
- Recent industry developments (IBM/DataStax acquisition)
- LangServe's current status

**Main Correction Needed:** Remove or properly attribute the Keynes quote.

**Suggestions:**
1. Add specific version numbers where relevant (e.g., LangChain versions)
2. Consider noting that some GitHub star counts change rapidly
3. Your technical assessments of scaling challenges and production considerations are well-supported by documentation

The presentation demonstrates solid research and understanding of the current AI tooling landscape.

---

# Research URLs by Topic

## Flowise Production & Enterprise Use

| Topic | Main Idea | URL |
|-------|-----------|-----|
| Flowise Production | Production deployment guidelines with PostgreSQL, load balancing, and queue mode recommendations | [Running in Production - FlowiseAI](https://docs.flowiseai.com/configuration/running-in-production) |
| Flowise Enterprise | Fortune 500 companies use Flowise in production with enterprise-grade features | [5 Flowise Alternatives & Competitors for 2025](https://budibase.com/blog/alternatives/flowise/) |
| Flowise Reviews | Enterprise deployment capabilities and pricing tiers including custom enterprise plans | [Flowise AI Review: Features, Pricing, and Alternatives 2025](https://findmyaitool.io/tool/flowise-ai/) |
| Flowise Alternatives | Comparison with other platforms showing production use cases | [26 Best Flowise AI Alternatives to Build Scalable LLM Workflows](https://blog.lamatic.ai/guides/flowise-ai/) |

## n8n Production & Enterprise Use

| Topic | Main Idea | URL |
|-------|-----------|-----|
| n8n Case Studies | Delivery Hero saved 200 hours/month, showing real enterprise production use | [n8n case studies](https://n8n.io/case-studies/) |
| n8n Production Setup | Detailed production environment setup with Docker, PostgreSQL, and Kubernetes | [N8N Deployment: Production Environment Setup](https://www.wednesday.is/writing-articles/n8n-deployment-production-environment-setup) |
| n8n Enterprise Guide | Production deployment best practices and enterprise architecture | [N8n Deployment Guide: How To Set Up, Scale, And Maintain Your Automation Infrastructure](https://groovetechnology.com/blog/software-development/n8n-deployment-guide-how-to-set-up-scale-and-maintain-your-automation-infrastructure/) |
| n8n Use Cases | Real-world applications across industries in 2025 | [Exploring N8n Use Cases: Your Ultimate Guide To Smarter Automation In 2025](https://groovetechnology.com/blog/software-development/exploring-n8n-use-cases-your-ultimate-guide-to-smarter-automation-in-2025/) |
| n8n Review | Comprehensive review showing enterprise capabilities and limitations | [A Comprehensive n8n Review (2025)](https://cybernews.com/ai-tools/n8n-review/) |
| n8n Enterprise Features | Enterprise workflow automation software capabilities | [Enterprise Workflow Automation Software & Tools - n8n](https://n8n.io/enterprise/) |

## LangFlow & DataStax/IBM Acquisition

| Topic | Main Idea | URL |
|-------|-----------|-----|
| IBM DataStax Acquisition | IBM announced intent to acquire DataStax (LangFlow's parent) in March 2025 | [IBM to acquire DataStax, helping clients bring the power of unstructured data to enterprise AI applications](https://www.ibm.com/new/announcements/ibm-to-acquire-datastax-helping-clients-bring-the-power-of-unstructured-data-to-enterprise-ai-applications) |
| LangFlow IBM News | LangFlow team's excitement about IBM acquisition bringing more resources | [Big news for Langflow! - Rodrigo Nader - Medium](https://medium.com/logspace/big-news-for-langflow-392594d13230) |
| DataStax Acquisition Analysis | Technical analysis of how Cassandra and LangFlow fit into IBM's watsonx strategy | [Langflow, Cassandra: IBM's DataStax Buy - The New Stack](https://thenewstack.io/ibm-to-acquire-datastax-to-boost-watsonx-ai-development/) |
| DataStax Background | DataStax acquired LangFlow (Logspace) in April 2024 before IBM deal | [DataStax acquires the startup behind low-code AI builder Langflow - TechCrunch](https://techcrunch.com/2024/04/04/datastax-acquires-logspace-the-startup-behind-the-langflow-low-code-tool-for-building-rag-based-chatbots/) |

## LangServe Status & Development

| Topic | Main Idea | URL |
|-------|-----------|-----|
| LangServe Documentation | Official confirmation that new features are no longer being accepted, only bug fixes | [🦜️🏓 LangServe - LangChain](https://python.langchain.com/docs/langserve/) |
| LangServe Deprecation | GitHub issues showing deprecation warnings in FastAPI components | [servery.py on_event deprecated · Issue #441 · langchain-ai/langserve](https://github.com/langchain-ai/langserve/issues/441) |

## Python Decorators in LangChain

| Topic | Main Idea | URL |
|-------|-----------|-----|
| LangChain Decorators Library | Third-party library providing syntactic sugar for LangChain prompts | [langchain-decorators · PyPI](https://pypi.org/project/langchain-decorators/) |
| Core LangChain Tools | Official @tool decorator is the recommended way to create custom tools | [How to create tools - LangChain](https://python.langchain.com/docs/how_to/custom_tools/) |
| LangChain Tools Overview | Tools are created primarily using the @tool decorator system | [Tools - LangChain](https://python.langchain.com/docs/concepts/tools/) |
| Langfuse Decorators | Observability platform showing widespread decorator usage in LLM applications | [Cookbook: Python Decorators (v2) - Langfuse](https://langfuse.com/docs/sdk/python/example) |
| LangChain State 2024 | Industry report showing increased complexity in LLM applications | [LangChain State of AI 2024 Report](https://blog.langchain.com/langchain-state-of-ai-2024/) |

## Quote Attribution Issues

| Topic | Main Idea | URL |
|-------|-----------|-----|
| Keynes Quote | Often misattributed but no evidence Keynes ever said "When facts change, I change my mind" | *[Note: This URL was referenced in your slides but would need verification from quote investigation sources]* |

---

## Summary

This table contains all URLs used in the fact-checking analysis of your PyOhio 2025 presentation on Python AI tools. The research confirmed most of your key technical claims about Flowise and n8n production usage, the IBM/DataStax/LangFlow acquisition timeline, and LangServe's current development status. The main correction needed is the Keynes quote attribution.

**Key Findings:**
- ✅ Flowise and n8n are indeed used in enterprise production environments
- ✅ IBM's acquisition of DataStax (and by extension LangFlow) is accurate and recent
- ✅ LangServe is no longer accepting new features, only bug fixes
- ✅ Python decorators are heavily used in LangChain ecosystem
- ❌ The Keynes quote is commonly misattributed and should be corrected
# Multi-Platform AI Agent Implementation Guide

A comprehensive demonstration project implementing quantitative vs qualitative decision-making agents across four AI platforms using Northwind SQL database and RAG with FAISS vector storage.

## Project Overview

This guide creates a standardized AI demonstration that works identically across N8N, Flowise, LangFlow, and LangChain/LangGraph platforms. Each implementation features two specialized agents: a **Decision Router** that analyzes whether queries are quantitative or qualitative, and a **Data Agent** that queries either the SQL database or RAG system based on that routing decision.

**Implementation Time**: 15-20 minutes per platform  
**Total Setup Time**: 5 minutes for shared infrastructure  
**Complexity Level**: Intermediate to Advanced
Total Estimated Time: 65-85 minutes

## Core Architecture

### Agent Workflow Design
```acii
User Query → Decision Router Agent → Route Decision → Data Agent → Final Response
                     ↓                    ↓
            [Quantitative Analysis]  [SQL Database Query]
                     ↓                    ↓  
            [Qualitative Analysis]   [RAG Search + Response]
```

```mermaid
graph TD 
A["User Query"] --> B{"Decision Router Agent"}; 
B -- Quantitative --> C["Data Agent: SQL Query"]; 
B -- Qualitative --> D["Data Agent: RAG Search"]; 
C --> E["Final Response"]; 
D --> E;
```
### Shared Infrastructure Components
- **Docker MySQL**: Northwind database with business data
- **FAISS Vector Store**: Local similarity search for company memos
- **OpenAI GPT-4.1 Mini**: Cost-effective model for all platforms
- **Consistent Embeddings**: OpenAI text-embedding-3-large across platforms

## Infrastructure Setup (5 Minutes)

### Docker MySQL with Northwind Database

**Quick Setup (Recommended)**:
```bash
# Start Northwind database (Intel/AMD Mac)
docker run -d -p 3307:3306 --name northwind \
  -e MYSQL_ROOT_PASSWORD=supersecret \
  manchestercodes/northwind

# For Apple Silicon (M1/M2)
docker run -d -p 3307:3306 --name northwind \
  -e MYSQL_ROOT_PASSWORD=supersecret \
  manchestercodes/northwind:m1

# Verify database is ready
docker logs northwind
```

If running and you check the logs using the above, this will supply a response with a number of logs that look something like this:
```acii
...
2025-07-22 10:04:38+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.

2025-07-22T10:04:39.051312Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.28) starting as process 1
...
2025-07-22T10:04:39.406789Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.28'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.

```

If you are using Apple Silicon you specify your chip version as below:

``` Gemini refinement
(adding the specific Apple Silicon connection details directly into the main list is helpful)

# For Intel/AMD Macs 
docker pull manchestercodes/northwind 

# For Apple Silicon (M1/M2/M3) Macs 
docker pull manchestercodes/northwind:m1
```

## Continuing ...
 Now, run the container. The command is the same, but it will use the image you  just pulled. This command maps the container's port `3306` to your local # machine's port `3307` to avoid conflicts with any local MySQL installations.

``` Bash
# Run the container (works for both architectures)
docker run -d -p 3307:3306 --name northwind \
  -e MYSQL_ROOT_PASSWORD=supersecret \
  manchestercodes/northwind

```

**Connection Details**:
- **Host**: localhost
- **Port**: 3307  
- **Username**: root (Intel/AMD) or user (M1)
- **Password**: supersecret (Intel/AMD) or password (M1)
- **Database**: northwind


**Test Connection**:
One way to connect - _Inside_ the Docker Container.  See [[additional_instructions_ for_ SQL_connection.md]]
You first open a shell _inside_ the container and then launch the MySQL client from there.

Open a terminal session inside the container:
    
    docker exec -it northwind bash
    
    
Your terminal prompt will change, indicating you are now inside the Docker container (e.g., root@<container_id>:/#).
    
Connect to the MySQL client:
    
    mysql -u root -p
    
    
It will prompt you for the password. Type 
supersecret 
and press Enter.

`ascii`
`Welcome to the MySQL monitor.  Commands end with ; or \g.`
`Your MySQL connection id is 11` 
`Server version: 8.0.28 MySQL Community Server - GPL`
`Copyright (c) 2000, 2022, Oracle and/or its affiliates.`

`Oracle is a registered trademark of Oracle Corporation and/or its affiliates. Other names may be trademarks of their respective owners.`
`Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.` 
`mysql>`
	

Run the SQL commands: Once you see the mysql> prompt, you can run the commands from the guide:
    
 `SQL`
    `USE northwind;` 
    `SHOW TABLES;`
    `SELECT COUNT() FROM customers;  -- Should return 29`
    `SELECT COUNT() FROM products;   -- Should return 77`
    `exit;`
    
Exit the container:** After you type:exit; to leave MySQL, type exit again to close the container session and return to your Mac's terminal.

### Company Memo Documents for RAG - provided in the folder

Create two mock company memos for qualitative queries:

**File**: `company_memo_1.txt`
```
MEMORANDUM

TO: All Staff
FROM: Executive Team  
DATE: July 2025
RE: Remote Work Policy Update

Our company is implementing a hybrid work model effective August 1st. Employees may work remotely up to 3 days per week, with mandatory office presence on Tuesdays and Thursdays for collaboration and team meetings.

Key Policy Points:
- Home office equipment stipend: $500 annually
- Core collaboration hours: 10 AM - 3 PM local time
- Performance evaluation based on outcomes, not hours
- Monthly in-person team building events

This policy reflects our commitment to work-life balance while maintaining team cohesion and productivity.
```

**File**: `company_memo_2.txt`  
```
MEMORANDUM

TO: All Departments
FROM: HR Department
DATE: July 2025  
RE: Professional Development Budget Increase

We're pleased to announce a 40% increase in professional development budgets for FY2026. Each employee now has access to $2,000 annually for:

Training and Certification Programs:
- Technical certifications and courses
- Leadership development workshops  
- Conference attendance and networking
- Online learning platform subscriptions

Application Process:
- Submit requests via HR portal
- Manager approval required for amounts over $500
- Receipts must be submitted within 30 days
- Unused budget does not roll over

This investment demonstrates our commitment to employee growth and competitive positioning in the market.
```

## Platform-Specific Implementations

## N8N Implementation

**Setup Time**: 20 minutes  
**Complexity**: Medium (requires workflow design)

### Installation
```bash
# Install N8N
npm install n8n -g

# Start N8N
n8n start
# Access: http://localhost:5678
```

### Workflow Architecture

**Nodes Required**:
1. **Webhook Trigger** - Receive user queries
2. **Decision Router Agent** - LangChain Code node
3. **Conditional Branch** - Route based on analysis
4. **SQL Agent** - Query Northwind database  
5. **RAG Agent** - Search company memos
6. **Response Formatter** - Return final answer

### Key Node Configurations

**1. Decision Router Agent (LangChain Code Node)**
```javascript
import { ChatOpenAI } from "@langchain/openai";

const llm = new ChatOpenAI({
  model: "gpt-4.1-mini",
  temperature: 0.1,
  apiKey: $credentials.openAI.apiKey,
});

const routingPrompt = `Analyze this query and classify it:
- QUANTITATIVE: Numbers, calculations, data analysis, counts, sums, metrics
- QUALITATIVE: Opinions, policies, text analysis, recommendations, subjective content

Query: ${$input.first().json.query}

Respond with only: QUANTITATIVE or QUALITATIVE`;

const response = await llm.invoke(routingPrompt);
const decision = response.content.trim().toUpperCase();

return [{ 
  query: $input.first().json.query,
  route_decision: decision,
  reasoning: `Classified as ${decision} based on query analysis`
}];
```

**2. SQL Agent Configuration**
- **Connection**: MySQL Northwind database
- **Host**: localhost:3307
- **Credentials**: root/supersecret
- **Sample Query Logic**: 
```sql
-- For customer count queries
SELECT COUNT(*) as customer_count FROM customers;

-- For product analysis  
SELECT category, COUNT(*) as product_count, 
       AVG(unit_price) as avg_price
FROM products GROUP BY category;

-- For order metrics
SELECT YEAR(order_date) as year, 
       COUNT(*) as order_count,
       SUM(freight) as total_freight
FROM orders GROUP BY YEAR(order_date);
```

**3. RAG Agent Setup**
- Use **FAISS Vector Store** via LangChain Code node
- **Document Loading**: Load company memos from text files
- **Embedding Model**: OpenAI text-embedding-3-large
- **Similarity Search**: Return top 3 relevant chunks

### Workflow Implementation Tips
- **Error Handling**: Add try/catch blocks in code nodes
- **Logging**: Use console.log for debugging
- **Testing**: Test each agent separately before connecting
- **Memory**: Use sticky notes to track conversation context

## Flowise Implementation  

**Setup Time**: 15 minutes  
**Complexity**: Low (visual drag-and-drop)

### Installation
```bash
npm install -g flowise
flowise start
# Access: http://localhost:3000
```

### AgentFlow V2 Architecture

**Required Nodes**:
1. **Start Node** - Initialize Flow State
2. **LLM Node** - Decision routing analysis  
3. **AI Condition Node** - Route based on classification
4. **Agent Node (SQL)** - Database queries
5. **Agent Node (RAG)** - Vector search
6. **End Node** - Return response

### Node Configuration Details

**1. Decision Router (LLM Node)**
- **Model**: ChatOpenAI (GPT-4.1-mini)
- **System Message**: 
```
You are a query classifier. Analyze the user query and respond with exactly one word:
- "QUANTITATIVE" for numerical analysis, data queries, calculations, metrics
- "QUALITATIVE" for policy questions, opinions, recommendations, text analysis

Query: {{input}}
Classification:
```
- **Output**: Structured response for AI Condition Node

**2. AI Condition Node Configuration**  
```
If the LLM classification contains "QUANTITATIVE":
  Route to: SQL Agent Node
Else if the LLM classification contains "QUALITATIVE":  
  Route to: RAG Agent Node
Default:
  Route to: RAG Agent Node
```

**3. SQL Agent Node**
- **Agent Type**: Tool Calling Agent
- **Tools**: Custom MySQL tool
- **Connection String**: `mysql://root:supersecret@localhost:3307/northwind`
- **System Message**: "You are a business analyst. Query the Northwind database to provide accurate quantitative answers with specific numbers and analysis."

**4. RAG Agent Node** 
- **Vector Store**: FAISS (local)
- **Embeddings**: OpenAI text-embedding-3-large  
- **Documents**: Company memos (auto-indexed)
- **Retrieval Settings**: Top-k=3, similarity threshold=0.7
- **System Message**: "You are a company policy expert. Use the retrieved information to provide comprehensive qualitative answers about company policies and procedures."

### FAISS Vector Store Setup in Flowise
1. Add **FAISS Vector Store** node
2. Configure paths:
   - **Index Directory**: `./flowise_storage/vectors`
   - **Document Directory**: `./company_memos/`
3. **Upsert Documents**: Upload memo text files
4. **Test Retrieval**: Verify similarity search works

## LangFlow Implementation

**Setup Time**: 18 minutes
**Complexity**: Medium (visual with Python components)

### Installation
```bash
pip install langflow
langflow run
# Access: http://127.0.0.1:7860
```

### Visual Component Flow

**Component Chain**:
```
Input → Text Input → Language Model (Router) → Conditional Router → [SQL Agent | RAG Agent] → Output
```

### Key Component Configurations

**1. Decision Language Model**
- **Provider**: OpenAI
- **Model**: gpt-4.1-mini
- **System Message**:
```
Classify this query as either QUANTITATIVE or QUALITATIVE:

QUANTITATIVE: Involves numbers, calculations, data analysis, metrics, counts, financial data
QUALITATIVE: Involves policies, opinions, recommendations, subjective analysis, text-based content

User Query: {input}

Respond with exactly one word: QUANTITATIVE or QUALITATIVE
```
- **Temperature**: 0.1
- **Max Tokens**: 50

**2. Conditional Router Component**
- **Type**: Custom Python Component
- **Logic**: Route based on LLM classification
```python
def route_query(classification: str, query: str):
    if "QUANTITATIVE" in classification.upper():
        return ("sql_agent", query)
    else:
        return ("rag_agent", query)
```

**3. SQL Database Agent**  
- **Tool**: Custom SQL tool
- **Database Connection**: MySQL Northwind
- **Connection Parameters**:
  - Host: localhost
  - Port: 3307
  - User: root  
  - Password: supersecret
  - Database: northwind

**4. RAG Search Agent**
- **Vector Database**: FAISS component
- **Embedding Model**: OpenAI text-embedding-3-large
- **Documents**: Company memo files
- **Search Parameters**: k=3, similarity_threshold=0.7

### Custom Component Development

**SQL Query Tool** (`custom_sql_tool.py`):
```python
from langchain.tools import tool
import mysql.connector

@tool
def query_northwind_db(query_description: str) -> str:
    """Execute SQL queries against Northwind database based on description."""
    
    # Connect to database
    conn = mysql.connector.connect(
        host="localhost",
        port=3307,
        user="root", 
        password="supersecret",
        database="northwind"
    )
    
    # Query generation logic based on description
    cursor = conn.cursor()
    
    if "customer" in query_description.lower():
        sql = "SELECT COUNT(*) as customer_count FROM customers"
    elif "product" in query_description.lower():
        sql = "SELECT category, COUNT(*) FROM products GROUP BY category"  
    elif "order" in query_description.lower():
        sql = "SELECT COUNT(*) as order_count, SUM(freight) as total_freight FROM orders"
    else:
        sql = "SELECT 'Query type not recognized' as result"
    
    cursor.execute(sql)
    results = cursor.fetchall()
    conn.close()
    
    return str(results)
```

## LangChain/LangGraph Python Implementation

**Setup Time**: 25 minutes  
**Complexity**: High (full programming required)

### UV Package Manager Setup

**pyproject.toml**:
```toml
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[project]
name = "multi-agent-demo"
version = "0.1.0"
description = "Multi-agent decision routing demo"
requires-python = ">=3.11"

dependencies = [
    "langchain>=0.3.26,<0.4.0",
    "langchain-core>=0.3.68,<0.4.0", 
    "langchain-community>=0.3.27,<0.4.0",
    "langchain-openai>=0.3.28,<0.4.0",
    "langgraph>=0.5.3,<0.6.0",
    "openai>=1.97.0,<2.0.0",
    "faiss-cpu>=1.11.0,<2.0.0",
    "mysql-connector-python>=8.0.33,<9.0.0",
    "python-dotenv>=1.0.0,<2.0.0",
]

[tool.uv]
dev-dependencies = [
    "pytest>=8.0.0",
    "jupyter>=1.0.0",
]
```

### Installation Commands
```bash
# Initialize project
uv init multi-agent-demo
cd multi-agent-demo

# Install dependencies  
uv sync

# Create environment file
echo "OPENAI_API_KEY=your_openai_api_key" > .env
```

### Complete Implementation

**main.py**:
```python
import os
from typing import Literal, Sequence, Annotated, TypedDict
from dotenv import load_dotenv

from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import TextLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_core.messages import BaseMessage, HumanMessage, add_messages
from langchain_core.tools import tool
from langgraph.graph import MessagesState, StateGraph, START, END  
from langgraph.types import Command
from langgraph.prebuilt import create_react_agent

import mysql.connector
import faiss
from langchain_community.docstore.in_memory import InMemoryDocstore

load_dotenv()

class MultiAgentDemo:
    def __init__(self):
        self.llm = ChatOpenAI(model="gpt-4.1-mini", temperature=0.1)
        self.embeddings = OpenAIEmbeddings(model="text-embedding-3-large")
        self.setup_tools()
        self.setup_vector_store()
        self.setup_agents()
        self.setup_graph()
    
    @tool
    def query_northwind_database(self, query_description: str) -> str:
        """Query the Northwind database for quantitative business data."""
        try:
            conn = mysql.connector.connect(
                host="localhost",
                port=3307,
                user="root",
                password="supersecret", 
                database="northwind"
            )
            cursor = conn.cursor()
            
            # Simple query routing based on keywords
            query_lower = query_description.lower()
            if "customer" in query_lower and "count" in query_lower:
                sql = "SELECT COUNT(*) as customer_count FROM customers"
            elif "product" in query_lower:
                sql = """SELECT c.category_name, COUNT(p.id) as product_count, 
                        ROUND(AVG(p.unit_price), 2) as avg_price
                        FROM products p 
                        JOIN categories c ON p.category_id = c.id 
                        GROUP BY c.category_name"""
            elif "order" in query_lower:
                sql = """SELECT COUNT(*) as total_orders, 
                        ROUND(SUM(freight), 2) as total_freight,
                        ROUND(AVG(freight), 2) as avg_freight
                        FROM orders"""
            else:
                sql = """SELECT 
                        (SELECT COUNT(*) FROM customers) as customers,
                        (SELECT COUNT(*) FROM products) as products,
                        (SELECT COUNT(*) FROM orders) as orders"""
            
            cursor.execute(sql)
            results = cursor.fetchall()
            columns = [desc[0] for desc in cursor.description]
            conn.close()
            
            # Format results nicely
            formatted_results = []
            for row in results:
                row_dict = dict(zip(columns, row))
                formatted_results.append(row_dict)
            
            return f"Database query results: {formatted_results}"
            
        except Exception as e:
            return f"Database query failed: {str(e)}"
    
    @tool  
    def search_company_memos(self, query: str) -> str:
        """Search company memos for qualitative policy information."""
        try:
            docs = self.vector_store.similarity_search(query, k=3)
            context = "\n\n".join([doc.page_content for doc in docs])
            return f"Relevant company memo information:\n{context}"
        except Exception as e:
            return f"Memo search failed: {str(e)}"
    
    def setup_tools(self):
        """Initialize tools for agents."""
        self.sql_tool = self.query_northwind_database
        self.rag_tool = self.search_company_memos
    
    def setup_vector_store(self):
        """Create FAISS vector store with company memos."""
        # Create sample documents if they don't exist
        memo_texts = [
            """MEMORANDUM
TO: All Staff
FROM: Executive Team  
DATE: July 2025
RE: Remote Work Policy Update

Our company is implementing a hybrid work model effective August 1st. Employees may work remotely up to 3 days per week, with mandatory office presence on Tuesdays and Thursdays for collaboration and team meetings.

Key Policy Points:
- Home office equipment stipend: $500 annually
- Core collaboration hours: 10 AM - 3 PM local time  
- Performance evaluation based on outcomes, not hours
- Monthly in-person team building events

This policy reflects our commitment to work-life balance while maintaining team cohesion and productivity.""",

            """MEMORANDUM
TO: All Departments
FROM: HR Department
DATE: July 2025  
RE: Professional Development Budget Increase

We're pleased to announce a 40% increase in professional development budgets for FY2026. Each employee now has access to $2,000 annually for:

Training and Certification Programs:
- Technical certifications and courses
- Leadership development workshops  
- Conference attendance and networking
- Online learning platform subscriptions

Application Process:
- Submit requests via HR portal
- Manager approval required for amounts over $500
- Receipts must be submitted within 30 days
- Unused budget does not roll over

This investment demonstrates our commitment to employee growth and competitive positioning in the market."""
        ]
        
        # Split documents
        text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=500,
            chunk_overlap=50,
            separators=["\n\n", "\n", " "]
        )
        
        documents = []
        for i, memo in enumerate(memo_texts):
            chunks = text_splitter.split_text(memo)
            for chunk in chunks:
                documents.append({
                    'page_content': chunk,
                    'metadata': {'source': f'memo_{i+1}', 'type': 'company_policy'}
                })
        
        # Create FAISS index
        try:
            self.vector_store = FAISS.load_local(
                "company_memos_index", 
                self.embeddings,
                allow_dangerous_deserialization=True
            )
            print("Loaded existing FAISS index")
        except:
            # Create new index
            index = faiss.IndexFlatL2(len(self.embeddings.embed_query("test")))
            self.vector_store = FAISS(
                embedding_function=self.embeddings,
                index=index,
                docstore=InMemoryDocstore(),
                index_to_docstore_id={}
            )
            
            # Add documents
            from langchain_core.documents import Document
            docs = [Document(page_content=doc['page_content'], 
                           metadata=doc['metadata']) for doc in documents]
            self.vector_store.add_documents(docs)
            
            # Save for future use
            self.vector_store.save_local("company_memos_index")
            print("Created new FAISS index with company memos")
    
    def setup_agents(self):
        """Create specialized agents."""
        # SQL Agent for quantitative queries
        self.sql_agent = create_react_agent(
            self.llm,
            [self.sql_tool],
            state_modifier="You are a business data analyst. Use the database query tool to provide accurate quantitative answers with specific numbers and business insights."
        )
        
        # RAG Agent for qualitative queries  
        self.rag_agent = create_react_agent(
            self.llm,
            [self.rag_tool], 
            state_modifier="You are a company policy expert. Use the memo search tool to provide comprehensive answers about company policies, procedures, and qualitative information."
        )
    
    class Router(TypedDict):
        """Router decision output."""
        next: Literal["sql_agent", "rag_agent"]
        reasoning: str
    
    def supervisor_node(self, state: MessagesState) -> Command[Literal["sql_agent", "rag_agent"]]:
        """Route queries to appropriate specialist agent."""
        
        routing_prompt = f"""Analyze this user query and classify it as:

QUANTITATIVE: Questions about numbers, data analysis, calculations, metrics, counts, financial data, statistics
QUALITATIVE: Questions about policies, procedures, opinions, recommendations, subjective content, company culture

User query: {state["messages"][-1].content}

Choose the appropriate agent and provide reasoning."""
        
        messages = [
            {"role": "system", "content": routing_prompt}
        ]
        
        response = self.llm.with_structured_output(self.Router).invoke(messages)
        
        return Command(
            goto=response["next"],
            update={
                "messages": [
                    HumanMessage(
                        content=f"Routing to {response['next']}: {response['reasoning']}"
                    )
                ]
            }
        )
    
    def sql_agent_node(self, state: MessagesState) -> Command[Literal["__end__"]]:
        """Execute SQL agent for quantitative queries."""
        result = self.sql_agent.invoke(state)
        return Command(
            update={
                "messages": [
                    HumanMessage(
                        content=result["messages"][-1].content, 
                        name="sql_analyst"
                    )
                ]
            },
            goto=END
        )
    
    def rag_agent_node(self, state: MessagesState) -> Command[Literal["__end__"]]:
        """Execute RAG agent for qualitative queries."""
        result = self.rag_agent.invoke(state)
        return Command(
            update={
                "messages": [
                    HumanMessage(
                        content=result["messages"][-1].content,
                        name="policy_expert"
                    )
                ]
            },
            goto=END
        )
    
    def setup_graph(self):
        """Build the multi-agent decision graph."""
        builder = StateGraph(MessagesState)
        
        # Add nodes
        builder.add_edge(START, "supervisor")
        builder.add_node("supervisor", self.supervisor_node)
        builder.add_node("sql_agent", self.sql_agent_node)
        builder.add_node("rag_agent", self.rag_agent_node)
        
        # Compile graph
        self.graph = builder.compile()
    
    def query(self, user_input: str):
        """Process user query through multi-agent system."""
        result = self.graph.invoke({
            "messages": [HumanMessage(content=user_input)]
        })
        return result["messages"][-1].content

# Example usage
if __name__ == "__main__":
    # Initialize system
    demo = MultiAgentDemo()
    
    # Test quantitative query
    print("=== QUANTITATIVE QUERY TEST ===")
    response = demo.query("How many customers are in the database?")
    print(f"Response: {response}\n")
    
    # Test qualitative query
    print("=== QUALITATIVE QUERY TEST ===") 
    response = demo.query("What is the company's remote work policy?")
    print(f"Response: {response}\n")
    
    # Interactive mode
    print("=== INTERACTIVE MODE ===")
    print("Enter queries (type 'quit' to exit):")
    while True:
        user_input = input("\nQuery: ")
        if user_input.lower() in ['quit', 'exit']:
            break
        response = demo.query(user_input)
        print(f"Response: {response}")
```

### Running the Implementation
```bash
# Ensure Docker MySQL is running
docker start northwind

# Run the demo
uv run python main.py
```

## Testing and Validation

### Sample Test Queries

**Quantitative Tests**:
```
"How many customers do we have?"
"What's the average product price by category?"  
"Show me order volume and freight costs"
"How many products are in each category?"
```

**Qualitative Tests**:
```
"What is our remote work policy?"
"Tell me about professional development opportunities"
"What are the core collaboration hours?"
"How much budget do employees get for training?"
```

**Edge Cases**:
```
"What's our customer satisfaction policy?" (should route to RAG)
"How many remote work days are allowed?" (could go either way)
```

### Expected Behavior
- **Quantitative queries** should route to SQL agent and return specific numbers from Northwind database
- **Qualitative queries** should route to RAG agent and return policy information from company memos
- **Response time** should be under 10 seconds per query
- **Routing accuracy** should be 90%+ for clear-cut cases

## Troubleshooting Guide

### Common Issues and Solutions

**1. Docker MySQL Connection Failures**
```bash
# Check if container is running
docker ps

# Check logs
docker logs northwind

# Restart if needed
docker restart northwind

# Test connection
docker exec -it northwind mysql -uroot -psupersecret -e "USE northwind; SHOW TABLES;"
```

**2. OpenAI API Rate Limits**
- Implement exponential backoff
- Use GPT-4.1-mini for cost efficiency
- Monitor usage at platform.openai.com/usage

**3. FAISS Index Issues**
```python
# Recreate index if corrupted
import shutil
shutil.rmtree("company_memos_index", ignore_errors=True)
# Restart application to rebuild
```

**4. Platform-Specific Issues**

**N8N**: 
- Ensure credentials are properly configured
- Check node execution order
- Use console.log for debugging

**Flowise**:
- Verify all nodes are connected
- Check vector store upsert operations
- Monitor AgentFlow execution logs

**LangFlow**:  
- Validate component connections
- Test individual components separately
- Check Python environment compatibility

**LangChain**:
- Verify all dependencies are installed
- Check environment variable loading
- Monitor agent execution traces

## Production Deployment Notes

### Security Considerations
- Store API keys in environment variables
- Use connection pooling for database connections
- Implement rate limiting and authentication
- Regular security updates for all dependencies

### Performance Optimization
- Cache frequently accessed vector embeddings
- Implement connection pooling for MySQL
- Use Redis for session management
- Monitor and log all agent decisions

### Scaling Recommendations
- Use managed vector databases (Pinecone, Weaviate) for production
- Implement proper logging and monitoring
- Add fallback mechanisms for agent failures
- Use load balancers for high availability

This comprehensive implementation guide provides working solutions across all four platforms, with consistent behavior and shared infrastructure that can be deployed in under 2 hours total setup time.
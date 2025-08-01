# Multi-Platform AI Agent Implementation Guide Platform-Specific Implementations

## Flowise Implementation  

**Setup Time**: 15 minutes  
**Complexity**: Low (visual drag-and-drop)

### Installation 
```bash
npm install -g flowise
flowise start

### AgentFlow V2 Architecture

**Required Nodes**:
1. **Start Node** - Initialize Flow State
2. **LLM Node** - Decision routing analysis  
3. **AI Condition Node** - Route based on classification
4. **Agent Node (SQL)** - Database queries
5. **Agent Node (RAG)** - Vector search
6. **End Node** - Return response
# Access: http://localhost:3000
```



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

## Troubleshooting Guide


**4. Platform-Specific Issues**

**Flowise**:
- Verify all nodes are connected
- Check vector store upsert operations
- Monitor AgentFlow execution logs

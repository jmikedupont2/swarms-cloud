[![Multi-Modality](agorabanner.png)](https://discord.gg/qUtxnK2NMf)

# Swarms Cloud
Deploy your autonomous agents to the cloud with infinite scalability, 99% uptime, and a polymorphic api.


Base swarms code -> fastapi code is added to top and bottom -> agent is decorated with expose as api decorator -> file is parsed and then -> added onto yaml for -> skypilot


# Install
`pip install swarms-cloud`



## Calculate Pricing
```python
from transformers import AutoTokenizer
from swarms_cloud import calculate_pricing

# Initialize the tokenizer
tokenizer = AutoTokenizer.from_pretrained("gpt2")

# Define the example texts
texts = ["This is the first example text.", "This is the second example text."]

# Calculate pricing and retrieve the results
total_tokens, total_sentences, total_words, total_characters, total_paragraphs, cost = calculate_pricing(texts, tokenizer)

# Print the total tokens processed
print(f"Total tokens processed: {total_tokens}")

# Print the total cost
print(f"Total cost: ${cost:.5f}")
```


## Generate an API key
```python
from swarms_cloud.api_key_generator import generate_api_key

generate_api_key(prefix="sk", length=30)

```

# Stack
- Backend: FastAPI
- Skypilot for container management
- Stripe for payment tracking
- Postresql for database
- TensorRT for inference
- Docker for cluster management
- Kubernetes for managing and autoscaling docker containers



# License
MIT
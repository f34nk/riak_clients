# openriak

Python HTTP client for OpenRiak, generated from the OpenRiak Smithy model.

```shell
pip install openriak
```

```python
from openriak import OpenRiak, Config

client = OpenRiak(Config(endpoint_uri="http://127.0.0.1:8098"))
```

`OpenRiak` is an async client. Construct it inside a running event loop (or pass a custom transport) before calling operations. See `openriak.client` and `openriak.models` for the full API.

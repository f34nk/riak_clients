# openriak

Python HTTP client for [OpenRiak](https://github.com/OpenRiak), generated from the [OpenRiak Smithy model](https://github.com/f34nk/riak_clients) using [smithy-beam](https://github.com/f34nk/smithy-beam).

```shell
pip install openriak
```

```python
import asyncio
from openriak import Config, OpenRiak
from openriak.models import (
    GetDefaultObjectOperationInput,
    GetObjectInput,
    PutDefaultObjectOperationInput,
    PutObjectOperationInput,
)

async def main():
    client = OpenRiak(Config(endpoint_uri="http://127.0.0.1:8098"))
    body = b'{"message":"hello"}'

    # Default bucket path: /buckets/{bucket}/keys/{key}
    await client.put_default_object(PutDefaultObjectOperationInput(
        bucket="demo",
        key="hello",
        content_type="application/json",
        w="1",
        dw="1",
        body=body,
    ))
    default_out = await client.get_default_object(
        GetDefaultObjectOperationInput(bucket="demo", key="hello")
    )
    print(await default_out.body.read())

    # Typed bucket path: /types/{bucketType}/buckets/{bucket}/keys/{key}
    await client.put_object(PutObjectOperationInput(
        bucket_type="default",
        bucket="demo",
        key="hello-typed",
        content_type="application/json",
        w="1",
        dw="1",
        body=body,
    ))
    typed_out = await client.get_object(
        GetObjectInput(bucket_type="default", bucket="demo", key="hello-typed")
    )
    print(await typed_out.body.read())

asyncio.run(main())
```

`OpenRiak` is an async client. See `openriak.client` and `openriak.models` for the full API.

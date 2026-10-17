import asyncio
import json
import os

from openriak import Config, OpenRiak
from openriak.models import (
    GetDefaultObjectOperationInput,
    GetObjectInput,
    PutDefaultObjectOperationInput,
    PutObjectOperationInput,
)

RIAK_HOST = os.environ.get("RIAK_HOST", "openriak")
RIAK_PORT = os.environ.get("RIAK_PORT", "8098")

BUCKET_TYPE = "default"
BUCKET = "demo"
DEFAULT_KEY = "hello"
TYPED_KEY = "hello-typed"

TEST_OBJECT = {
    "client": "python",
    "message": "Hello from OpenRiak",
}


async def main() -> None:
    endpoint = f"http://{RIAK_HOST}:{RIAK_PORT}"
    print("=== OpenRiak Python Demo ===")
    print(f"Using OpenRiak at {endpoint}")

    config = Config(endpoint_uri=endpoint)
    client = OpenRiak(config)

    json_bytes = json.dumps(TEST_OBJECT).encode("utf-8")

    await put_default(client, json_bytes)
    await get_default(client)

    await put_typed(client, json_bytes)
    await get_typed(client)

    print("Demo complete: default and typed write/read verified.")


async def put_default(client: OpenRiak, body: bytes) -> None:
    put_output = await client.put_default_object(
        PutDefaultObjectOperationInput(
            bucket=BUCKET,
            key=DEFAULT_KEY,
            content_type="application/json",
            w="1",
            dw="1",
            body=body,
        )
    )
    print(
        f"Wrote default object -> bucket={BUCKET!r} key={DEFAULT_KEY!r} "
        f"status={put_output.status_code}"
    )


async def get_default(client: OpenRiak) -> None:
    get_output = await client.get_default_object(
        GetDefaultObjectOperationInput(
            bucket=BUCKET,
            key=DEFAULT_KEY,
        )
    )
    print(
        f"Read default object  <- bucket={BUCKET!r} key={DEFAULT_KEY!r} "
        f"status={get_output.status_code}"
    )
    body_bytes = await get_output.body.read()
    result = json.loads(body_bytes.decode("utf-8"))
    print(f"Default result: {json.dumps(result, indent=2)}")
    assert result["message"] == TEST_OBJECT["message"], "Default value mismatch after read!"


async def put_typed(client: OpenRiak, body: bytes) -> None:
    put_output = await client.put_object(
        PutObjectOperationInput(
            bucket_type=BUCKET_TYPE,
            bucket=BUCKET,
            key=TYPED_KEY,
            content_type="application/json",
            w="1",
            dw="1",
            body=body,
        )
    )
    print(
        f"Wrote typed object -> type={BUCKET_TYPE!r} bucket={BUCKET!r} "
        f"key={TYPED_KEY!r} status={put_output.status_code}"
    )


async def get_typed(client: OpenRiak) -> None:
    get_output = await client.get_object(
        GetObjectInput(
            bucket_type=BUCKET_TYPE,
            bucket=BUCKET,
            key=TYPED_KEY,
        )
    )
    print(
        f"Read typed object  <- type={BUCKET_TYPE!r} bucket={BUCKET!r} "
        f"key={TYPED_KEY!r} status={get_output.status_code}"
    )
    body_bytes = await get_output.body.read()
    result = json.loads(body_bytes.decode("utf-8"))
    print(f"Typed result: {json.dumps(result, indent=2)}")
    assert result["message"] == TEST_OBJECT["message"], "Typed value mismatch after read!"


if __name__ == "__main__":
    asyncio.run(main())

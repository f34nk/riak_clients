# openriak

Java HTTP client for [OpenRiak](https://github.com/OpenRiak), generated from the [OpenRiak Smithy model](https://github.com/f34nk/riak_clients) using [smithy-beam](https://github.com/f34nk/smithy-beam).

```xml
<dependency>
  <groupId>io.github.f34nk</groupId>
  <artifactId>openriak</artifactId>
  <version>0.1.2</version>
</dependency>
```

```java
import openriak.protocol.OpenRiakHttpProtocol;
import openriak.v3_4.api.client.OpenRiakClient;
import openriak.v3_4.api.model.GetDefaultObjectOperationInput;
import openriak.v3_4.api.model.GetObjectInput;
import openriak.v3_4.api.model.PutDefaultObjectOperationInput;
import openriak.v3_4.api.model.PutObjectOperationInput;
import software.amazon.smithy.java.io.datastream.DataStream;

OpenRiakClient client = OpenRiakClient.builder()
        .endpoint("http://127.0.0.1:8098")
        .protocol(new OpenRiakHttpProtocol())
        .build();

byte[] body = "{\"message\":\"hello\"}".getBytes();

// Default bucket path: /buckets/{bucket}/keys/{key}
client.putDefaultObject(PutDefaultObjectOperationInput.builder()
        .bucket("demo")
        .key("hello")
        .contentType("application/json")
        .w("1")
        .dw("1")
        .body(DataStream.ofBytes(body))
        .build());
try (var defaultOut = client.getDefaultObject(
        GetDefaultObjectOperationInput.builder().bucket("demo").key("hello").build())) {
    System.out.println(new String(defaultOut.getBody().asByteBuffer().array()));
}

// Typed bucket path: /types/{bucketType}/buckets/{bucket}/keys/{key}
client.putObject(PutObjectOperationInput.builder()
        .bucketType("default")
        .bucket("demo")
        .key("hello-typed")
        .contentType("application/json")
        .w("1")
        .dw("1")
        .body(DataStream.ofBytes(body))
        .build());
try (var typedOut = client.getObject(
        GetObjectInput.builder()
                .bucketType("default")
                .bucket("demo")
                .key("hello-typed")
                .build())) {
    System.out.println(new String(typedOut.getBody().asByteBuffer().array()));
}
```

Pass `OpenRiakHttpProtocol` when building the client. See `OpenRiakClient` and
`openriak.v3_4.api.model` for the full API.

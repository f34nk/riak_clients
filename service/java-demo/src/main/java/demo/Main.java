package demo;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.Objects;
import openriak.protocol.OpenRiakHttpProtocol;
import openriak.v3_4.api.client.OpenRiakClient;
import openriak.v3_4.api.model.GetDefaultObjectOperationInput;
import openriak.v3_4.api.model.GetDefaultObjectOutput;
import openriak.v3_4.api.model.GetObjectInput;
import openriak.v3_4.api.model.GetObjectOutput;
import openriak.v3_4.api.model.PutDefaultObjectOperationInput;
import openriak.v3_4.api.model.PutDefaultObjectOutput;
import openriak.v3_4.api.model.PutObjectOperationInput;
import openriak.v3_4.api.model.PutObjectOutput;
import software.amazon.smithy.java.auth.api.identity.IdentityResolver;
import software.amazon.smithy.java.auth.api.identity.IdentityResult;
import software.amazon.smithy.java.auth.api.identity.LoginIdentity;
import software.amazon.smithy.java.context.Context;
import software.amazon.smithy.java.io.datastream.DataStream;

public final class Main {

    private static final String RIAK_HOST = env("RIAK_HOST", "openriak");
    private static final String RIAK_PORT = env("RIAK_PORT", "8098");

    private static final String BUCKET_TYPE = "default";
    private static final String BUCKET = "demo";
    private static final String DEFAULT_KEY = "hello-java";
    private static final String TYPED_KEY = "hello-java-typed";

    private static final Gson GSON = new Gson();

    private static final Map<String, Object> TEST_OBJECT = Map.of(
            "client", "java",
            "message", "Hello from OpenRiak"
    );

    public static void main(String[] args) {
        try {
            System.out.println("=== OpenRiak Java Demo ===");

            String endpoint = "http://" + RIAK_HOST + ":" + RIAK_PORT;
            OpenRiakClient client = OpenRiakClient.builder()
                    .endpoint(endpoint)
                    .protocol(new OpenRiakHttpProtocol())
                    .addIdentityResolver(loginIdentityResolver(
                            env("RIAK_USER", ""),
                            env("RIAK_PASSWORD", "")))
                    .build();
            System.out.println("Using OpenRiak at " + endpoint);

            byte[] jsonBytes = GSON.toJson(TEST_OBJECT).getBytes(StandardCharsets.UTF_8);

            putDefault(client, jsonBytes);
            JsonObject defaultResult = getDefault(client);
            System.out.println("Default result: " + GSON.toJson(defaultResult));
            assertMessage(defaultResult);

            putTyped(client, jsonBytes);
            JsonObject typedResult = getTyped(client);
            System.out.println("Typed result: " + GSON.toJson(typedResult));
            assertMessage(typedResult);

            System.out.println("Demo complete: default and typed write/read verified.");
            System.exit(0);
        } catch (Exception e) {
            System.err.println(e.getMessage());
            e.printStackTrace(System.err);
            System.exit(1);
        }
    }

    private static void putDefault(OpenRiakClient client, byte[] jsonBytes) {
        try (PutDefaultObjectOperationInput putInput = PutDefaultObjectOperationInput.builder()
                .bucket(BUCKET)
                .key(DEFAULT_KEY)
                .contentType("application/json")
                .w("1")
                .dw("1")
                .body(DataStream.ofBytes(jsonBytes))
                .build()) {
            PutDefaultObjectOutput putOutput = client.putDefaultObject(putInput);
            System.out.printf(
                    "Wrote default object -> bucket='%s' key='%s' status=%d%n",
                    BUCKET,
                    DEFAULT_KEY,
                    putOutput.getStatusCode());
        }
    }

    private static JsonObject getDefault(OpenRiakClient client) {
        GetDefaultObjectOperationInput getInput = GetDefaultObjectOperationInput.builder()
                .bucket(BUCKET)
                .key(DEFAULT_KEY)
                .build();

        try (GetDefaultObjectOutput getOutput = client.getDefaultObject(getInput)) {
            System.out.printf(
                    "Read default object  <- bucket='%s' key='%s' status=%d%n",
                    BUCKET,
                    DEFAULT_KEY,
                    getOutput.getStatusCode());
            byte[] bodyBytes = getOutput.getBody().asByteBuffer().array();
            return GSON.fromJson(new String(bodyBytes, StandardCharsets.UTF_8), JsonObject.class);
        }
    }

    private static void putTyped(OpenRiakClient client, byte[] jsonBytes) {
        try (PutObjectOperationInput putInput = PutObjectOperationInput.builder()
                .bucketType(BUCKET_TYPE)
                .bucket(BUCKET)
                .key(TYPED_KEY)
                .contentType("application/json")
                .w("1")
                .dw("1")
                .body(DataStream.ofBytes(jsonBytes))
                .build()) {
            PutObjectOutput putOutput = client.putObject(putInput);
            System.out.printf(
                    "Wrote typed object -> type='%s' bucket='%s' key='%s' status=%d%n",
                    BUCKET_TYPE,
                    BUCKET,
                    TYPED_KEY,
                    putOutput.getStatusCode());
        }
    }

    private static JsonObject getTyped(OpenRiakClient client) {
        GetObjectInput getInput = GetObjectInput.builder()
                .bucketType(BUCKET_TYPE)
                .bucket(BUCKET)
                .key(TYPED_KEY)
                .build();

        try (GetObjectOutput getOutput = client.getObject(getInput)) {
            System.out.printf(
                    "Read typed object  <- type='%s' bucket='%s' key='%s' status=%d%n",
                    BUCKET_TYPE,
                    BUCKET,
                    TYPED_KEY,
                    getOutput.getStatusCode());
            byte[] bodyBytes = getOutput.getBody().asByteBuffer().array();
            return GSON.fromJson(new String(bodyBytes, StandardCharsets.UTF_8), JsonObject.class);
        }
    }

    private static void assertMessage(JsonObject result) {
        String message = result.get("message").getAsString();
        if (!Objects.equals(message, TEST_OBJECT.get("message"))) {
            throw new IllegalStateException("Value mismatch after read!");
        }
    }

    private static String env(String name, String defaultValue) {
        String value = System.getenv(name);
        return value == null || value.isBlank() ? defaultValue : value;
    }

    private static IdentityResolver<LoginIdentity> loginIdentityResolver(String username, String password) {
        LoginIdentity identity = LoginIdentity.create(username, password);
        return new IdentityResolver<>() {
            @Override
            public IdentityResult<LoginIdentity> resolveIdentity(Context context) {
                return IdentityResult.of(identity);
            }

            @Override
            public Class<LoginIdentity> identityType() {
                return LoginIdentity.class;
            }
        };
    }
}

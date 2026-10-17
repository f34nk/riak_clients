package openriak.v3_4.api.model;

import java.util.List;
import software.amazon.smithy.java.core.schema.ApiOperation;
import software.amazon.smithy.java.core.schema.ApiService;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.java.core.schema.ShapeBuilder;
import software.amazon.smithy.java.core.serde.TypeRegistry;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

/**
 * Legacy /riak/ object API. Deprecated in docs but still served on openriak-3.4.
 */
@SmithyGenerated
public final class PostLegacyObjectReturnBody implements ApiOperation<PostLegacyObjectReturnBodyInput, PostLegacyObjectReturnBodyOutput> {

    private static final PostLegacyObjectReturnBody $INSTANCE = new PostLegacyObjectReturnBody();

    static final Schema $SCHEMA = Schema.createOperation(ShapeId.from("openriak.v3_4.api#PostLegacyObjectReturnBody"));

    public static final ShapeId $ID = $SCHEMA.id();

    private static final TypeRegistry TYPE_REGISTRY = TypeRegistry.builder()
        .putType(BadRequestError.$ID, BadRequestError.class, BadRequestError::builder)
        .putType(UnauthorizedError.$ID, UnauthorizedError.class, UnauthorizedError::builder)
        .putType(ForbiddenError.$ID, ForbiddenError.class, ForbiddenError::builder)
        .putType(NotFoundError.$ID, NotFoundError.class, NotFoundError::builder)
        .putType(NotAcceptableError.$ID, NotAcceptableError.class, NotAcceptableError::builder)
        .putType(ConflictError.$ID, ConflictError.class, ConflictError::builder)
        .putType(PreconditionFailedError.$ID, PreconditionFailedError.class, PreconditionFailedError::builder)
        .putType(TimeoutError.$ID, TimeoutError.class, TimeoutError::builder)
        .putType(UpgradeRequiredError.$ID, UpgradeRequiredError.class, UpgradeRequiredError::builder)
        .putType(InternalServerError.$ID, InternalServerError.class, InternalServerError::builder)
        .build();

    private static final List<ShapeId> SCHEMES = List.of(ShapeId.from("smithy.api#httpBasicAuth"));

    private static final Schema INPUT_STREAM_MEMBER = PostLegacyObjectReturnBodyInput.$SCHEMA.member("body");
    private static final Schema OUTPUT_STREAM_MEMBER = PostLegacyObjectReturnBodyOutput.$SCHEMA.member("body");

    /**
     * Get an instance of this {@code ApiOperation}.
     *
     * @return An instance of this class.
     */
    public static PostLegacyObjectReturnBody instance() {
        return $INSTANCE;
    }

    private PostLegacyObjectReturnBody() {}

    @Override
    public ShapeBuilder<PostLegacyObjectReturnBodyInput> inputBuilder() {
        return PostLegacyObjectReturnBodyInput.builder();
    }

    @Override
    public ShapeBuilder<PostLegacyObjectReturnBodyOutput> outputBuilder() {
        return PostLegacyObjectReturnBodyOutput.builder();
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public Schema inputSchema() {
        return PostLegacyObjectReturnBodyInput.$SCHEMA;
    }

    @Override
    public Schema outputSchema() {
        return PostLegacyObjectReturnBodyOutput.$SCHEMA;
    }

    @Override
    public TypeRegistry errorRegistry() {
        return TYPE_REGISTRY;
    }

    @Override
    public List<Schema> errorSchemas() {
        return List.of(BadRequestError.$SCHEMA, UnauthorizedError.$SCHEMA, ForbiddenError.$SCHEMA, NotFoundError.$SCHEMA, NotAcceptableError.$SCHEMA, ConflictError.$SCHEMA, PreconditionFailedError.$SCHEMA, TimeoutError.$SCHEMA, UpgradeRequiredError.$SCHEMA, InternalServerError.$SCHEMA);
    }

    @Override
    public List<ShapeId> effectiveAuthSchemes() {
        return SCHEMES;
    }

    @Override
    public Schema inputStreamMember() {
        return INPUT_STREAM_MEMBER;
    }

    @Override
    public Schema outputStreamMember() {
        return OUTPUT_STREAM_MEMBER;
    }

    @Override
    public Schema idempotencyTokenMember() {
        return null;
    }

    @Override
    public ApiService service() {
        return OpenRiakApiService.instance();
    }
    }

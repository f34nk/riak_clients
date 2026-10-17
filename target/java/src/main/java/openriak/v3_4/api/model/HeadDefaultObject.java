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
 * When siblings exist and no vtag is given, the server may respond with 300 Multiple Choices and a
 * text body listing vtags. Send Accept: multipart/mixed to receive all siblings in one body at 200.
 */
@SmithyGenerated
public final class HeadDefaultObject implements ApiOperation<HeadDefaultObjectOperationInput, HeadDefaultObjectOutput> {

    private static final HeadDefaultObject $INSTANCE = new HeadDefaultObject();

    static final Schema $SCHEMA = Schema.createOperation(ShapeId.from("openriak.v3_4.api#HeadDefaultObject"));

    public static final ShapeId $ID = $SCHEMA.id();

    private static final TypeRegistry TYPE_REGISTRY = TypeRegistry.builder()
        .putType(BadRequestError.$ID, BadRequestError.class, BadRequestError::builder)
        .putType(UnauthorizedError.$ID, UnauthorizedError.class, UnauthorizedError::builder)
        .putType(ForbiddenError.$ID, ForbiddenError.class, ForbiddenError::builder)
        .putType(NotFoundError.$ID, NotFoundError.class, NotFoundError::builder)
        .putType(NotAcceptableError.$ID, NotAcceptableError.class, NotAcceptableError::builder)
        .putType(ConflictError.$ID, ConflictError.class, ConflictError::builder)
        .putType(MultipleChoicesError.$ID, MultipleChoicesError.class, MultipleChoicesError::builder)
        .putType(TimeoutError.$ID, TimeoutError.class, TimeoutError::builder)
        .putType(UpgradeRequiredError.$ID, UpgradeRequiredError.class, UpgradeRequiredError::builder)
        .putType(InternalServerError.$ID, InternalServerError.class, InternalServerError::builder)
        .build();

    private static final List<ShapeId> SCHEMES = List.of(ShapeId.from("smithy.api#httpBasicAuth"));

    /**
     * Get an instance of this {@code ApiOperation}.
     *
     * @return An instance of this class.
     */
    public static HeadDefaultObject instance() {
        return $INSTANCE;
    }

    private HeadDefaultObject() {}

    @Override
    public ShapeBuilder<HeadDefaultObjectOperationInput> inputBuilder() {
        return HeadDefaultObjectOperationInput.builder();
    }

    @Override
    public ShapeBuilder<HeadDefaultObjectOutput> outputBuilder() {
        return HeadDefaultObjectOutput.builder();
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public Schema inputSchema() {
        return HeadDefaultObjectOperationInput.$SCHEMA;
    }

    @Override
    public Schema outputSchema() {
        return HeadDefaultObjectOutput.$SCHEMA;
    }

    @Override
    public TypeRegistry errorRegistry() {
        return TYPE_REGISTRY;
    }

    @Override
    public List<Schema> errorSchemas() {
        return List.of(BadRequestError.$SCHEMA, UnauthorizedError.$SCHEMA, ForbiddenError.$SCHEMA, NotFoundError.$SCHEMA, NotAcceptableError.$SCHEMA, ConflictError.$SCHEMA, MultipleChoicesError.$SCHEMA, TimeoutError.$SCHEMA, UpgradeRequiredError.$SCHEMA, InternalServerError.$SCHEMA);
    }

    @Override
    public List<ShapeId> effectiveAuthSchemes() {
        return SCHEMES;
    }

    @Override
    public Schema inputStreamMember() {
        return null;
    }

    @Override
    public Schema outputStreamMember() {
        return null;
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

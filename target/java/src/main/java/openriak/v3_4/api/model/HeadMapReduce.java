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
 * Deprecated in docs but still served on openriak-3.4. Prefer the Query API for data queries.
 */
@SmithyGenerated
public final class HeadMapReduce implements ApiOperation<HeadMapReduceInput, HeadMapReduceOutput> {

    private static final HeadMapReduce $INSTANCE = new HeadMapReduce();

    static final Schema $SCHEMA = Schema.createOperation(ShapeId.from("openriak.v3_4.api#HeadMapReduce"));

    public static final ShapeId $ID = $SCHEMA.id();

    private static final TypeRegistry TYPE_REGISTRY = TypeRegistry.builder()
        .putType(UnauthorizedError.$ID, UnauthorizedError.class, UnauthorizedError::builder)
        .putType(ForbiddenError.$ID, ForbiddenError.class, ForbiddenError::builder)
        .putType(UpgradeRequiredError.$ID, UpgradeRequiredError.class, UpgradeRequiredError::builder)
        .putType(InternalServerError.$ID, InternalServerError.class, InternalServerError::builder)
        .build();

    private static final List<ShapeId> SCHEMES = List.of(ShapeId.from("smithy.api#httpBasicAuth"));

    /**
     * Get an instance of this {@code ApiOperation}.
     *
     * @return An instance of this class.
     */
    public static HeadMapReduce instance() {
        return $INSTANCE;
    }

    private HeadMapReduce() {}

    @Override
    public ShapeBuilder<HeadMapReduceInput> inputBuilder() {
        return HeadMapReduceInput.builder();
    }

    @Override
    public ShapeBuilder<HeadMapReduceOutput> outputBuilder() {
        return HeadMapReduceOutput.builder();
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public Schema inputSchema() {
        return HeadMapReduceInput.$SCHEMA;
    }

    @Override
    public Schema outputSchema() {
        return HeadMapReduceOutput.$SCHEMA;
    }

    @Override
    public TypeRegistry errorRegistry() {
        return TYPE_REGISTRY;
    }

    @Override
    public List<Schema> errorSchemas() {
        return List.of(UnauthorizedError.$SCHEMA, ForbiddenError.$SCHEMA, UpgradeRequiredError.$SCHEMA, InternalServerError.$SCHEMA);
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

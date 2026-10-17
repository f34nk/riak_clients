package openriak.v3_4.api.model;

import java.util.List;
import software.amazon.smithy.java.core.schema.ApiOperation;
import software.amazon.smithy.java.core.schema.ApiService;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.java.core.schema.ShapeBuilder;
import software.amazon.smithy.java.core.serde.TypeRegistry;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

@SmithyGenerated
public final class GetDefaultFetchClocksRange implements ApiOperation<GetDefaultFetchClocksRangeInput, GetDefaultFetchClocksRangeOutput> {

    private static final GetDefaultFetchClocksRange $INSTANCE = new GetDefaultFetchClocksRange();

    static final Schema $SCHEMA = Schema.createOperation(ShapeId.from("openriak.v3_4.api#GetDefaultFetchClocksRange"));

    public static final ShapeId $ID = $SCHEMA.id();

    private static final TypeRegistry TYPE_REGISTRY = TypeRegistry.builder()
        .putType(BadRequestError.$ID, BadRequestError.class, BadRequestError::builder)
        .putType(UnauthorizedError.$ID, UnauthorizedError.class, UnauthorizedError::builder)
        .putType(ForbiddenError.$ID, ForbiddenError.class, ForbiddenError::builder)
        .putType(TimeoutError.$ID, TimeoutError.class, TimeoutError::builder)
        .putType(UpgradeRequiredError.$ID, UpgradeRequiredError.class, UpgradeRequiredError::builder)
        .putType(InternalServerError.$ID, InternalServerError.class, InternalServerError::builder)
        .build();

    private static final List<ShapeId> SCHEMES = List.of(ShapeId.from("smithy.api#httpBasicAuth"));

    private static final Schema OUTPUT_STREAM_MEMBER = GetDefaultFetchClocksRangeOutput.$SCHEMA.member("body");

    /**
     * Get an instance of this {@code ApiOperation}.
     *
     * @return An instance of this class.
     */
    public static GetDefaultFetchClocksRange instance() {
        return $INSTANCE;
    }

    private GetDefaultFetchClocksRange() {}

    @Override
    public ShapeBuilder<GetDefaultFetchClocksRangeInput> inputBuilder() {
        return GetDefaultFetchClocksRangeInput.builder();
    }

    @Override
    public ShapeBuilder<GetDefaultFetchClocksRangeOutput> outputBuilder() {
        return GetDefaultFetchClocksRangeOutput.builder();
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public Schema inputSchema() {
        return GetDefaultFetchClocksRangeInput.$SCHEMA;
    }

    @Override
    public Schema outputSchema() {
        return GetDefaultFetchClocksRangeOutput.$SCHEMA;
    }

    @Override
    public TypeRegistry errorRegistry() {
        return TYPE_REGISTRY;
    }

    @Override
    public List<Schema> errorSchemas() {
        return List.of(BadRequestError.$SCHEMA, UnauthorizedError.$SCHEMA, ForbiddenError.$SCHEMA, TimeoutError.$SCHEMA, UpgradeRequiredError.$SCHEMA, InternalServerError.$SCHEMA);
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

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
public final class UpdateDatatype implements ApiOperation<UpdateDatatypeInput, UpdateDatatypeOutput> {

    private static final UpdateDatatype $INSTANCE = new UpdateDatatype();

    static final Schema $SCHEMA = Schema.createOperation(ShapeId.from("openriak.v3_4.api#UpdateDatatype"));

    public static final ShapeId $ID = $SCHEMA.id();

    private static final TypeRegistry TYPE_REGISTRY = TypeRegistry.builder()
        .putType(BadRequestError.$ID, BadRequestError.class, BadRequestError::builder)
        .putType(UnauthorizedError.$ID, UnauthorizedError.class, UnauthorizedError::builder)
        .putType(ForbiddenError.$ID, ForbiddenError.class, ForbiddenError::builder)
        .putType(NotFoundError.$ID, NotFoundError.class, NotFoundError::builder)
        .putType(ConflictError.$ID, ConflictError.class, ConflictError::builder)
        .putType(MovedPermanentlyError.$ID, MovedPermanentlyError.class, MovedPermanentlyError::builder)
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
    public static UpdateDatatype instance() {
        return $INSTANCE;
    }

    private UpdateDatatype() {}

    @Override
    public ShapeBuilder<UpdateDatatypeInput> inputBuilder() {
        return UpdateDatatypeInput.builder();
    }

    @Override
    public ShapeBuilder<UpdateDatatypeOutput> outputBuilder() {
        return UpdateDatatypeOutput.builder();
    }

    @Override
    public Schema schema() {
        return $SCHEMA;
    }

    @Override
    public Schema inputSchema() {
        return UpdateDatatypeInput.$SCHEMA;
    }

    @Override
    public Schema outputSchema() {
        return UpdateDatatypeOutput.$SCHEMA;
    }

    @Override
    public TypeRegistry errorRegistry() {
        return TYPE_REGISTRY;
    }

    @Override
    public List<Schema> errorSchemas() {
        return List.of(BadRequestError.$SCHEMA, UnauthorizedError.$SCHEMA, ForbiddenError.$SCHEMA, NotFoundError.$SCHEMA, ConflictError.$SCHEMA, MovedPermanentlyError.$SCHEMA, TimeoutError.$SCHEMA, UpgradeRequiredError.$SCHEMA, InternalServerError.$SCHEMA);
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

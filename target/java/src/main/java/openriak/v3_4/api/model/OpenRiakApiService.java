package openriak.v3_4.api.model;

import software.amazon.smithy.java.core.schema.ApiService;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

/**
 * Service API schema
 */
@SmithyGenerated
public final class OpenRiakApiService implements ApiService {
    private static final OpenRiakApiService $INSTANCE = new OpenRiakApiService();
    private static final Schema $SCHEMA = Schema.createService(ShapeId.from("openriak.v3_4.api#OpenRiak"));

    /**
     * Get an instance of this {@code ApiService}.
     *
     * @return An instance of this class.
     */
    public static OpenRiakApiService instance() {
        return $INSTANCE;
    }

    private OpenRiakApiService() {}

    @Override
    public Schema schema() {
        return $SCHEMA;
    }
}

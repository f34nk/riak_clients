package openriak.v3_4.api.model;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import software.amazon.smithy.java.core.schema.Schema;
import software.amazon.smithy.java.core.schema.SerializableShape;
import software.amazon.smithy.java.core.schema.ShapeBuilder;
import software.amazon.smithy.java.core.schema.SmithyEnum;
import software.amazon.smithy.java.core.serde.ShapeDeserializer;
import software.amazon.smithy.java.core.serde.ShapeSerializer;
import software.amazon.smithy.java.core.serde.ToStringSerializer;
import software.amazon.smithy.model.shapes.ShapeId;
import software.amazon.smithy.utils.SmithyGenerated;

@SmithyGenerated
public sealed interface SyncOnWrite extends SmithyEnum, SerializableShape {
    SyncOnWrite ONE = new OneType();
    SyncOnWrite ALL = new AllType();
    SyncOnWrite BACKEND = new BackendType();
    List<SyncOnWrite> $TYPES = List.of(ONE, ALL, BACKEND);

    Schema $SCHEMA = Schema.createEnum(ShapeId.from("openriak.v3_4.api#SyncOnWrite"),
        Set.of(ONE.getValue(), ALL.getValue(), BACKEND.getValue()), SyncOnWrite.class
    );

    ShapeId $ID = $SCHEMA.id();

    String getValue();

    @Override
    default void serialize(ShapeSerializer serializer) {
        serializer.writeString($SCHEMA, getValue());
    }

    /**
     * Create an unknown enum variant with the given value.
     *
     * @param value value for the unknown variant.
     */
    static SyncOnWrite unknown(String value) {
        return new $Unknown(value);
    }

    /**
     * Returns an unmodifiable list containing the constants of this enum type, in the order declared.
     */
    static List<SyncOnWrite> values() {
        return $TYPES;
    }

    /**
     * Returns a {@link SyncOnWrite} constant with the specified value.
     *
     * @param value value to create {@code SyncOnWrite} from.
     * @throws IllegalArgumentException if value does not match a known value.
     */
    static SyncOnWrite from(String value) {
        return switch (value) {
            case "one" -> ONE;
            case "all" -> ALL;
            case "backend" -> BACKEND;
            default -> throw new IllegalArgumentException("Unknown value: " + value);
        };
    }

    final class OneType implements SyncOnWrite {
        private OneType() {}

        @Override
        public String getValue() {
            return "one";
        }

        @Override
        public String toString() {
            return ToStringSerializer.serialize(this);
        }

    }

    final class AllType implements SyncOnWrite {
        private AllType() {}

        @Override
        public String getValue() {
            return "all";
        }

        @Override
        public String toString() {
            return ToStringSerializer.serialize(this);
        }

    }

    final class BackendType implements SyncOnWrite {
        private BackendType() {}

        @Override
        public String getValue() {
            return "backend";
        }

        @Override
        public String toString() {
            return ToStringSerializer.serialize(this);
        }

    }

    record $Unknown(String value) implements SyncOnWrite {
        public $Unknown {
            Objects.requireNonNull(value, "Value cannot be null");
        }

        @Override
        public String getValue() {
            return value;
        }

        @Override
        public String toString() {
            return ToStringSerializer.serialize(this);
        }

        private final class $Hidden implements SyncOnWrite {
            @Override
            public String getValue() {
                return null;
            }
        }
    }

    /**
     * @return returns a new Builder.
     */
    static Builder builder() {
        return new Builder();
    }

    /**
     * Builder for {@link SyncOnWrite}.
     */
    final class Builder implements ShapeBuilder<SyncOnWrite> {
        private String value;

        private Builder() {}

        @Override
        public Schema schema() {
            return $SCHEMA;
        }

        private Builder value(String value) {
            this.value = Objects.requireNonNull(value, "Enum value cannot be null");
            return this;
        }

        @Override
        public SyncOnWrite build() {
            return switch (value) {
                case "one" -> ONE;
                case "all" -> ALL;
                case "backend" -> BACKEND;
                default -> new $Unknown(value);
            };
        }

        @Override
        public Builder deserialize(ShapeDeserializer de) {
            return value(de.readString($SCHEMA));
        }
    }
}

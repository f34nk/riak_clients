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
public sealed interface QueueObjectFormat extends SmithyEnum, SerializableShape {
    QueueObjectFormat INTERNAL = new InternalType();
    QueueObjectFormat INTERNAL_AAEHASH = new InternalAaehashType();
    List<QueueObjectFormat> $TYPES = List.of(INTERNAL, INTERNAL_AAEHASH);

    Schema $SCHEMA = Schema.createEnum(ShapeId.from("openriak.v3_4.api#QueueObjectFormat"),
        Set.of(INTERNAL.getValue(), INTERNAL_AAEHASH.getValue()), QueueObjectFormat.class
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
    static QueueObjectFormat unknown(String value) {
        return new $Unknown(value);
    }

    /**
     * Returns an unmodifiable list containing the constants of this enum type, in the order declared.
     */
    static List<QueueObjectFormat> values() {
        return $TYPES;
    }

    /**
     * Returns a {@link QueueObjectFormat} constant with the specified value.
     *
     * @param value value to create {@code QueueObjectFormat} from.
     * @throws IllegalArgumentException if value does not match a known value.
     */
    static QueueObjectFormat from(String value) {
        return switch (value) {
            case "internal" -> INTERNAL;
            case "internal_aaehash" -> INTERNAL_AAEHASH;
            default -> throw new IllegalArgumentException("Unknown value: " + value);
        };
    }

    final class InternalType implements QueueObjectFormat {
        private InternalType() {}

        @Override
        public String getValue() {
            return "internal";
        }

        @Override
        public String toString() {
            return ToStringSerializer.serialize(this);
        }

    }

    final class InternalAaehashType implements QueueObjectFormat {
        private InternalAaehashType() {}

        @Override
        public String getValue() {
            return "internal_aaehash";
        }

        @Override
        public String toString() {
            return ToStringSerializer.serialize(this);
        }

    }

    record $Unknown(String value) implements QueueObjectFormat {
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

        private final class $Hidden implements QueueObjectFormat {
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
     * Builder for {@link QueueObjectFormat}.
     */
    final class Builder implements ShapeBuilder<QueueObjectFormat> {
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
        public QueueObjectFormat build() {
            return switch (value) {
                case "internal" -> INTERNAL;
                case "internal_aaehash" -> INTERNAL_AAEHASH;
                default -> new $Unknown(value);
            };
        }

        @Override
        public Builder deserialize(ShapeDeserializer de) {
            return value(de.readString($SCHEMA));
        }
    }
}

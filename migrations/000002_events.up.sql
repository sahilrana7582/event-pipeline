
CREATE TABLE events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    event_id UUID NOT NULL UNIQUE,

    campaign_id UUID NOT NULL REFERENCES campaigns(id),

    user_id VARCHAR(100) NOT NULL,

    event_type VARCHAR(20) NOT NULL,

    ip_address INET NOT NULL,

    user_agent TEXT,

    occurred_at TIMESTAMPTZ NOT NULL,

    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,

    processing_status VARCHAR(20) NOT NULL DEFAULT 'PENDING',

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT events_type_check
        CHECK (
            event_type IN (
                'IMPRESSION',
                'CLICK',
                'INSTALL',
                'PURCHASE'
            )
        ),

    CONSTRAINT events_status_check
        CHECK (
            processing_status IN (
                'PENDING',
                'ACCEPTED',
                'REJECTED',
                'FRAUD'
            )
        ),

    CONSTRAINT events_metadata_object_check
        CHECK (jsonb_typeof(metadata) = 'object')
);

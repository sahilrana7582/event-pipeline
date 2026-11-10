
CREATE TABLE IF NOT EXISTS campaigns (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name VARCHAR(20) NOT NULL,
    description TEXT,

    status VARCHAR(10) NOT NULL DEFAULT 'ACTIVE',

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT campaigns_name_length_check
        CHECK (char_length(name) BETWEEN 5 AND 20),

    CONSTRAINT campaigns_status_check
        CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

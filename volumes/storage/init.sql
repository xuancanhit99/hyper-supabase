-- Create storage schema
CREATE SCHEMA IF NOT EXISTS storage;

-- Create a bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('public', 'public', true)
ON CONFLICT DO NOTHING;

-- Set bucket policies
INSERT INTO storage.policies (name, definition)
VALUES
  ('allow_public_reads',
   jsonb_build_object(
     'key', 'public_reads',
     'statement', 'bucket_id = ''public'' AND operation = ''read'''
   ));
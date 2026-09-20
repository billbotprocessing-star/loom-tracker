# Security

Do **not** put production API keys (Anthropic, Supabase service role, or other secrets) in client-side HTML or any file that ships to the browser. Route those calls through a trusted backend (for example n8n or a small server) so keys never leave a secure environment.

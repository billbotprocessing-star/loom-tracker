-- Transactions Table
CREATE TABLE transactions (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  date date NOT NULL,
  merchant text NOT NULL,
  amount decimal(12,2) NOT NULL,
  category text NOT NULL,
  recurring boolean DEFAULT false,
  user_id uuid REFERENCES auth.users(id) -- For future multi-user support
);

-- Savings Table
CREATE TABLE savings (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  label text NOT NULL,
  icon text DEFAULT '🎯',
  target decimal(12,2) NOT NULL,
  saved decimal(12,2) DEFAULT 0,
  color text DEFAULT '#6366f1'
);

-- Contributions Table (linked to savings)
CREATE TABLE contributions (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  savings_id uuid REFERENCES savings(id) ON DELETE CASCADE,
  date date NOT NULL,
  amount decimal(12,2) NOT NULL,
  note text
);

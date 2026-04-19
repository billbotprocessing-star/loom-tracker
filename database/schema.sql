-- 1. TRANSACTIONS TABLE
-- This handles the primary ledger.
CREATE TABLE IF NOT EXISTS transactions (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  date date NOT NULL,
  merchant text NOT NULL,
  amount decimal(12,2) NOT NULL,
  category text NOT NULL,
  recurring boolean DEFAULT false,
  notes text,
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE
);

-- 2. SAVINGS GOALS TABLE
-- Tracks the high-level "accounts" or "sinking funds".
CREATE TABLE IF NOT EXISTS savings (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  label text NOT NULL,
  icon text DEFAULT '🎯',
  target decimal(12,2) NOT NULL,
  saved decimal(12,2) DEFAULT 0,
  color text DEFAULT '#6366f1',
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE
);

-- 3. CONTRIBUTIONS TABLE
-- A ledger for every time you add money to a savings goal.
CREATE TABLE IF NOT EXISTS contributions (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  savings_id uuid REFERENCES savings(id) ON DELETE CASCADE,
  date date NOT NULL,
  amount decimal(12,2) NOT NULL,
  note text,
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE
);

-- 4. SECURITY (Row Level Security)
-- This ensures that users can only see their own data.
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE savings ENABLE ROW LEVEL SECURITY;
ALTER TABLE contributions ENABLE ROW LEVEL SECURITY;

-- Simple policies for authenticated users
CREATE POLICY "Users can manage their own transactions" 
  ON transactions FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can manage their own savings" 
  ON savings FOR ALL USING (auth.uid() = user_id);

CREATE POLICY "Users can manage their own contributions" 
  ON contributions FOR ALL USING (auth.uid() = user_id);

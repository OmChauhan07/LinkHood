const { createClient } = require('@supabase/supabase-js');

// Use the URL and Service Role Key from your .env
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY; 

// This client has admin rights to manage your community
const supabase = createClient(supabaseUrl, supabaseKey);

module.exports = supabase;
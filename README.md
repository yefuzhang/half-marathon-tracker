# Road to 2:30
1. Supabase Dashboard → SQL Editor → New query. Paste schema.sql and Run.
2. Edit config.js: replace URL and key placeholders with Project URL and publishable (or legacy anon) key. Never use service_role or secret keys.
3. Upload all files in this folder to the root of your GitHub repository. Settings → Pages → Deploy from a branch → main / (root) → Save.
4. Supabase Authentication → URL Configuration: set Site URL and allowed Redirect URLs to your exact GitHub Pages URL (including trailing slash). Keep email/password sign-in enabled.
5. Open the deployed site, Create account, confirm email if required, sign in. Settings: choose the Monday of week 1. Use the same email/password on all devices. Optionally disable new signups in Supabase after creating your account.
6. iPhone Safari → Share → Add to Home Screen. Sign in again if needed.
7. Test: choose a scheduled run, save distance and duration, refresh, then sign in on another device and check History. Test strength completion and CSV export. Internet is required for authentication and saving; offline check-ins are not supported. The app caches only its public shell.

Plan dates are local calendar dates. Changing the start date does not move old records. Race is Saturday of week 8. Training plan is defined in plan.js. Data is protected by per-user RLS; free service availability and retention are subject to Supabase terms. Export backups periodically.

# sunset in a jar 🫙

Open `index.html` in a browser — that's the whole app.

Right now photos are saved in your browser (IndexedDB): works offline, nothing leaves your machine. The five sample jars are borrowed from Unsplash and disappear once you add your own first sunset.

Little touches: drag a photo anywhere onto the page to jar it, click a jar for the full view (with its story), "fix the label" to edit, and "pour them out" for a full-screen slideshow. Fireflies live in the jars; hover to see them glow.

## Switching to Supabase (whenever you're ready)

1. Create a free project at [supabase.com](https://supabase.com)
2. SQL editor → paste and run `supabase-setup.sql`
3. Project settings → API → copy the **Project URL** and **anon public** key
4. Open `index.html` in a text editor, find the `SUPABASE` block near the top of the `<script>`, paste both values, save
5. Reload the page — if you had jars stored locally, it offers to move them up to the cloud

After that, photos land in a public `sunsets` storage bucket and metadata in a `sunsets` table, so your collection follows you across devices and browsers.

**Note:** the setup uses open anon-key policies — fine for personal use, but add Supabase Auth and owner-based policies before sharing your URL widely.
